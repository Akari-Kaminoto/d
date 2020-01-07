;;; mf-lib-utility.el -- This library for mf-tag-write.el -*- coding: utf-8-emacs -*-
;; Copyright (C) 2018, 2919 fubuki

;; Author: fubuki@frill.org
;; Version: $Revision: 1.1 $
;; Keywords: multimedia

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Sample junk collection using mf-tag-write.el.

;; - make-digital-album : ディレクトリ内の音楽ファイルのアルバム名等を統一.
;; - dired-music-file-change-title : dired でポイント位置の音楽ファイルの曲名を変更.
;; - dired-music-file-get-titles : dired でポイント位置のファイルの曲名/アルバムの中身等を表示.
;; - dired-image-extract : バイナリファイルからマジックナンバーで jpg/png を抽出.
;; - mf-tag-list : 音楽ファイルのタグをプロパティリストで表示.
;; - dired-rename-file-to-title : dired でマークされた音楽ファイルを曲名を元にファイル名変更.
;; - dired-music-file-get-title : dired でポイント位置の音楽ファイルの曲名等を表示.
;; - mf-artwork-to-window : 音楽ファイル内のアートワークを表示.

;;; Installation:

;;; Change Log:

;;; Code:

(require 'mf-tag-write)
(require 'wtag)

(defconst mf-lib-utility-version "1.0")
(defconst mf-lib-utility-rcs-version "$Revision: 1.1 $")
  
(defun music-file-directory-index-list (directory)
  (let* ((files (wtag-directory-files directory t (wtag-suffix-list mf-function-list))))
    (wtag-directory-set files)))

(defun mf-file-exists-p (file)
  "`file-exists-p' FILE なら FILE(文字列) を返しさもなくば NIL を返す."
  (if (file-exists-p file) file nil))

;;;###autoload
(defun make-digital-album (directory album-name &optional cover)
  "DIRECTORY 中の `mf-function-list' の要素の car にマッチする file のアルバム名を
ALBUM-NAME にしトラック番号を振り直す.
用途としてひとつまたは複数のアルバムから曲をいくつか抜き出してコピーしたディレクトリを作り
それを新たなアルバムとして再構成する等に使う."
  (let (albums track result (n 1))
    (setq albums (reverse (music-file-directory-index-list directory))
          albums (sort albums 'wtag-sort-track)
          albums (sort albums 'wtag-sort-album))
    (dolist (a albums result) (setq result (cons (mf-fifth a) result)))
    (setq cover
          (or (mf-file-exists-p (concat directory "/" cover))
              (mf-file-exists-p (concat default-directory "/" cover))
              cover))
    (dolist (file (reverse result))
      (mf-tag-write
       file
       (append
        `((album . ,album-name)
          ("OMG_OLINF") ("OMG_FENCA1") ("OMG_BKLSI")
          (track . ,(number-to-string n)))
        (if cover (list cover) nil)))
      (setq n (1+ n)))))

;;;###autoload
(defun dired-music-file-change-title (&optional prefix)
  "dired でカーソル位置の音楽ファイルの曲名を変更する.
PREFIX 非NIL でアー名変更."
  (interactive "P")
  (let ((file (dired-get-filename))
        (mode (if prefix
                  '("Artist: " . ("TPE1" "TP1" "\251ART"))
                '("Title: " . ("TIT2" "TT2" "\251nam"))))
        tags list tag str new)
    (setq tags (mf-tag-read file 1024 t))
    (setq list
          (catch 'break
            (dolist (a tags list)
              (setq tag (plist-get a :tag))
              (when (member tag (cdr mode)) (throw 'break a)))))
    (setq str (plist-get list :data))
    (setq new (read-string (car mode) str))
    (unless (string-equal str new)
      (mf-tag-write file (list (cons tag new)))
      (revert-buffer))))

;;;###autoload
(defun dired-music-file-get-titles (file &optional prefix)
  "FILE の主なタグをエコーエリアに表示.
FILE がディレクトリならその中の音楽ファイルのタイトル一覧表示.
PREFIX 在りで file なら タグを詳しく表示."
  (interactive
   (list (dired-get-filename) current-prefix-arg))
  (if (file-directory-p file)
      (wtag file prefix)
    (if prefix
        (mf-tag-list)
      (dired-music-file-get-title file))))

(defcustom dired-image-extract-max nil
  "*抜き取る画像の最大枚数. NIL ならすべて."
  :type  '(choice (const nil) integer)
  :group 'mf-tag)

(defvar dired-image-extract-max-length 32 "出力ファイル名ベース部の最大長.")
(defvar dired-image-extract-type '(("\xff\xd8\xff[\xe0\xe1]"  "\xff\xd9" 0 "jpg")
                                   ("\x89PNG\x0d\x0a\x1a\x0a" "IEND"     4 "png")))

(defun assoc-regexp (key alist)
  (catch 'break
    (dolist (a alist)
      (if (string-match (car a) key)
          (throw 'break a)))))

(defalias 'dired-jpeg-extract 'dired-image-extract)
(defalias 'dired-png-extract  'dired-image-extract)

;;;###autoload
(defun dired-image-extract (files &optional max)
  "FILES に含まれる jpg または png パートすべてを file(-数).ext に抜き出す.
TAG を手繰らずバイナリレベルでサーチして抜き出すのでフォーマットには依存しません.
最大 MAX 枚数抜き出す. デフォルトは `dired-image-extract-max' で指定. NIL ならすべて."
  (interactive
   (let ((files (dired-get-marked-files))
         (max   (and current-prefix-arg (prefix-numeric-value current-prefix-arg))))
     (list files max)))
  (let* ((max    (or max dired-image-extract-max))
         (files  (if (listp files) files (list files)))
         (type   dired-image-extract-type)
         (regexp (concat "\\(" (mapconcat #'identity (mapcar #'car type) "\\|") "\\)"))
         (len    dired-image-extract-max-length))

    (dolist (file files)
      (let* ((c 0)
             term ext beg end mode)

        (with-temp-buffer
          (insert-file-contents-literally file)
          (set-buffer-multibyte nil)

          (catch 'break
            (while (re-search-forward regexp nil t)
              (setq beg  (match-beginning 0)
                    mode (assoc-regexp (match-string 0) type)
                    ext  (mf-fourth mode)
                    term (mf-second mode)
                    c    (1+ c))

              (unless (re-search-forward term nil t)
                (error "%s Broken image" ext))
              (setq end (+ (point) (mf-third mode)))

              (if (< len (length (file-name-base (file-name-nondirectory file))))
                  (setq file (dired-image-extract-short-name file len)))
              (write-region beg end (format "%s-%d.%s" file c ext))
              (if (and max (= max c)) (throw 'break nil)))))
        (if (zerop c) (message "No image in `%s'." file)))))
  (revert-buffer))

(defun dired-image-extract-short-name (file max)
  "FILE の Base name が max より長ければ MAX の長さに丸めこんで返す."
  (let* ((dir  (file-name-directory file))
         (node (file-name-nondirectory file))
         (base (file-name-base node))
         (ext  (file-name-extension node)))
    (if (< max (length base))
        (concat dir (substring base 0 max) "." ext)
      file)))

;; (defun make-test-bin (&rest args)
;;   (with-temp-buffer
;;     (dolist (file args)
;;       (insert-file-contents-literally file))
;;       (set-buffer-multibyte nil)
;;       (write-region (point-min) (point-max) "test-bin.bin")))

;;;###autoload
(defun mf-tag-list ()
  "dired でカーソル位置の音楽ファイルのタグを別ウインドウに表示."
  (interactive)
  (let* ((file (dired-get-filename))
         (tags (mf-tag-read file 1024))
         (buffer "*tag-list*")
         (font-lock '(("\\(:.+?\\) " 1 font-lock-keyword-face))))
    (with-output-to-temp-buffer buffer
      (font-lock-set buffer font-lock)
      (mapcar #'(lambda (f)
                  (when (member (plist-get f :tag) '("APIC" "PIC" "GEOB" "covr"))
                    (plist-put f :data "..."))
                  (princ f) (princ "\n"))
              tags))))

(defun font-lock-set (buffer key)
  (with-current-buffer buffer (font-lock-add-keywords nil key)))

;;;###autoload
(defun dired-rename-file-to-title ()
  (interactive)
  (rename-file-to-title (dired-get-marked-files))
  (revert-buffer))
   
(defun rename-file-to-title (files)
  "FILES の \"01-未タイトル(1).mp4\" のようなファイル名を曲名にリネーム."
  (let (name ext num)
    (dolist (f files)
      (setq name (file-relative-name f)
            ext (file-name-extension name)
            num (and
                 (string-match "\\`\\(?1:[0-9]+[^0-9]\\)" name)
                 (match-string 1 name)))
      (condition-case err
          (progn
            (setq name (concat
                        num
                        (rename-file-to-title-regular
                         (rename-file-to-title-get-title (mf-tag-read f 1024 t)))
                        "." ext))
            (rename-file f name))
        (error (dired-log "Rename to title error %s\n" f))))))

(defun rename-file-to-title-regular (name)
  (replace-regexp-in-string "[.?:*/\\~\"']" "_" name))

(defun rename-file-to-title-get-title (list)
  (plist-get
   (catch 'break
     (dolist (a list)
       (and (string-equal (plist-get a :tag) "\251nam")
            (throw 'break a))))
   :data))

(defvar music-file-get-title-separator      nil
  "*`dired-music-file-get-title' で表示される区切文字. NIL なら \"|\" になる.")
(defvar music-file-get-title-separator-face 'bold
  "*`dired-music-file-get-title' で表示される区切文字の face.")

;;;###autoload
(defun dired-music-file-get-title (&optional file)
  "Put Message \"TITLE | ARTIST | ALBUM | CATEGORY\"."
  (interactive
   (list (dired-get-filename)))
  (let* ((image t)
         (result (music-file-get-title file nil image))
         (separator
          (propertize
           (or music-file-get-title-separator " | ")
           'face music-file-get-title-separator-face))
         size)
    (message (mapconcat #'identity result separator))))

(defvar music-file-header-function
  '(("\\.oma\\'"                    mf-get-title   30)
    ("\\.\\(mp4\\|m4a\\|mp3\\)\\'"  mf-get-title   10)
    ("\\.flac\\'"                   flac-get-title 10))
  "((regexp header-scan-func read-size(%)) ...)")

(defvar music-file-dummy-list '("unknown" "unknown" "unknown")
  "* `music-file-get-title' 用の曲名を除く ARTIST ALBUM CATEGORY の未定義ファイル用ダミー.")

;;;###autoload
(defun music-file-get-title (file &optional length image)
  "音楽 `FILE' のコンテンツ情報(所謂タグ)から \"TITLE\" \"ARTIST\" \"ALBUM\" \"CATEGORY\" を 4つの文字列から成る list を返す. 
現在対応しているのは .oma(Atrac3plus) .mp4 .m4a .mp3(ID32 ID33) .flac の 6種類.
`LENGTH' はアナライズするために読み込むサイズ. NIL ならすべて読み込む.
 mp4 等はコンテンツ情報の前にデータサイズによって変動の大きいパケットテーブルがあるので
この数値を大きめに取らないといけない.
IMAGE が NON-NIL ならイメージタグの内容をバッファ表示する."
  (let* ((flength (mf-eighth (file-attributes file)))
         (mode    (assoc-default file music-file-header-function 'string-match))
         (func    (car mode))
         (per     (or (cadr mode) 0))
         (length  (or length (round (* (/ flength 100.0) per)))))
    (if func
        (condition-case err
            (funcall func file length image)
          (error (cons (file-name-nondirectory file) music-file-dummy-list))))))

(defvar music-title-null "(nil)")

(defun mf-get-tag-data (klist plist)
  (let (tag result)
    (catch 'break
      (dolist (a plist result)
        (setq tag (or (plist-get a :dsc) (plist-get a :tag)))
        (if (member tag klist)
            (throw 'break (setq result (plist-get a :data))))))))

(defun mf-get-title (file &optional length image)
  "`mf-tag-read' で得たタグのデータを `update-directory-copy' 用に整理して返す.
Retern list (TITLE ARTIST ALBUM CATEGORY).
IMAGE が non-nil でなければイメージを表示しない. 他にも条件在り."
  (let ((plist (mf-tag-read file length nil))
        (magick mf-magick)
        (buff-name " *img*")
        size obj)
    (list
     (or (mf-get-tag-data '("TIT2" "TT2" "\251nam") plist) music-title-null)
     (or (mf-get-tag-data '("TPE1" "TP1" "\251ART") plist) music-title-null)
     (or (mf-get-tag-data '("TALB" "TAL" "\251alb") plist) music-title-null)
     (or (mf-get-tag-data '("TCON" "TCO" "\251gen") plist) music-title-null)
     (if (and image
              (image-type-available-p 'jpeg)
              (setq obj (mf-get-tag-data '("covr" "PIC" "APIC" "OMG_TDFCA") plist)))
         (progn
           (setq size (mf-put-image-obj-window obj buff-name magick))
           (format "H:%d W:%d" (car size) (cdr size)))
       music-title-null))))

;;
;; *** FLAC ***
;;
;; for flac (.flac) Fri Aug 24 10:34:35 2018
;; "TITLE" "ARTIST" "ALBUM" "CATEGORY"
(defvar flac-header-tags '("Title=" "Artist=" "Album=" "Genre="))
(defvar flac-null        "(nil)")

(defun flac-get-title (file &optional length dummy)
  "From flac FILE header extract \"TITLE\" \"ARTIST\" \"ALBUM\" \"CATEGORY\" list.
LENGTH is read length."
  (let (string beg result)
    (with-temp-buffer
      (if length
          (insert-file-contents-literally file nil 0 length)
        (insert-file-contents-literally file))
      (set-buffer-multibyte nil)
      (goto-char (point-min))
      (unless (looking-at "fLaC\0\0") (error "Not Flac."))

      (dolist (key flac-header-tags)
        (goto-char (point-min))
        (if (re-search-forward key nil t)
            (progn
              (setq beg (point))
              (re-search-forward "\0\0" nil t)
              (setq string (buffer-substring beg (1- (match-beginning 0))))
              (setq result
                    (cons (decode-coding-string
                           string
                           (car (detect-coding-string string)))
                          result)))
          (setq result (cons flac-null result))))
      (reverse result))))

(defvar mf-magick
  ((lambda (exe)
     "EXE が `exec-path' に存在すれば EXE を返しさもなくば NIL を返す."
     (catch 'break
       (dolist (a exec-path)
         (if (file-executable-p (concat (file-name-as-directory a) exe))
             (throw 'break exe)))))
   "magick.exe")
  "この変数が非NILなら `dired-select-cover-set-put-images' で画像が縮小表示される.")

(defun mf-put-image-obj-window (obj buff-name magick &optional funk)
  "イメージ OBJ を BUFF-NAME のバッファに表示.
MAGICK が NON-NIL ならバッファの高さに合わせバッファ表示. for imagemagick."
  (interactive)
  (let ((coding-system-for-write 'no-conversion)
        (buffer buff-name)
        (size (mf-image-size obj))
        hight tmp)
    (and (get-buffer buffer) (kill-buffer buffer))
    (with-current-buffer (get-buffer-create buffer)
      (if funk
          (display-buffer buffer)
        (pop-to-buffer buffer))
      (when magick
        (setq tmp
              (concat
               (make-temp-name (expand-file-name "MGK" temporary-file-directory)) ".jpg")
              hight (* (1- (window-height (get-buffer-window buffer))) (frame-char-height)))
        (write-region obj nil tmp  nil 'silent)
        (mf-fit-save tmp hight) ; NO ERROR CHECKE.
        (setq obj (with-temp-buffer (insert-file-contents-literally tmp) (buffer-string)))
        (and tmp (file-exists-p tmp) (delete-file tmp)))
      (insert obj)
      (image-mode))
    (cons (car size) (cdr size))))

(defun mf-fit-save (file size)
  "FILE の縦ピクセルを SIZE(ピクセル) に縮小して OUT に書き出す.
註: magick v7 系で引数指定が変更されたらしくそれに準じている."
  (call-process "magick" nil nil nil file "-resize" (format "x%d" size) file))

(defun mf-artwork-to-window (music-file buff-name magick &optional funk)
  "music FILE 内のイメージオブジェクトを image-mode でバッファ表示.
*カレントウィンドウが変わるので注意."
  (let (size)
    (catch 'break
      (dolist (a (mf-tag-read music-file 1024))
        (when (or (member (plist-get a :tag) '("covr" "PIC" "APIC"))
                  (string-equal (plist-get a :dsc) "OMG_TDFCA"))
          (setq size (mf-put-image-obj-window (plist-get a :data) buff-name magick funk))
          (throw 'break size))))
    (and size (cons (car size) (cdr size)))))

(defun mf-point-word (obj point)
  "OBJ 先頭 2バイトを数値で返す."
  (+ (* 256 (aref obj point)) (aref obj (1+ point))))

(defun mf-point-long-word (obj point)
  "OBJ 先頭 4バイトを数値で返す."
  (let (high low)
    (setq high (mf-point-word obj point) low  (mf-point-word obj (+ point 2)))
    (+ (* 65536 high) low)))

(defun mf-image-size (obj)
  "jpeg/png バイナリ OBJ のサイズを `(width . hight) で返す."
  (let (beg)
    (cond
     ((string-match "\xdIHDR" obj)  ; PNG
      (setq beg (match-end 0))
      (cons (mf-point-long-word obj beg) (mf-point-long-word obj (+ beg 4))))
     ((string-match "\xff\xc0" obj) ; JPG
      (setq beg (+ (match-end 0) 3))
      (cons (mf-point-word obj beg) (mf-point-word obj (+ beg 2)))))))

(provide 'mf-lib-utility)
;; fine.
