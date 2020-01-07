;;; music-file-index.el -- Music file writable tags. -*- coding: utf-8-emacs -*-
;; Copyright (C) 2919 fubuki

;; Author: fubuki@frill.org
;; Version: $Revision: 1.2 $
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

;; Music file tag display and interactive editing. mf-tag-write.el is required.

;;; Installation:

;; (require 'wtag)

;;; Change Log:

;;; Code:

(require 'mf-tag-write)
;; (require 'make-atrac-index)

(defgroup wtag nil
  "Writable music file tag."
  :group 'multimedia
  :version "26.3"
  :prefix "wtag-")

(defvar wtag-test nil "真なら書き換えが実行されない.")

(defvar wtag-frame nil)
(make-variable-buffer-local 'wtag-frame)
(defvar wtag-old-content nil)
(make-variable-buffer-local 'wtag-old-content)
(defvar wtag-old-cover nil)
(make-variable-buffer-local 'wtag-old-cover)
(defvar wtag-old-point nil)
(make-variable-buffer-local 'wtag-old-point)
(defvar wtag-ps nil)
(make-variable-buffer-local 'wtag-ps)
(defvar wtag-image-filename nil "for buffer local variable.")
(make-variable-buffer-local 'wtag-image-filename)
(put 'wtag-image-filename   'permanent-local t)

(defconst wtag-version     "1.1")
(defconst wtag-rcs-version "$Revision: 1.2 $")

(defconst wtag-emacs-version "GNU Emacs 26.3 (build 1, i686-w64-mingw32) of 2019-08-29")

(defcustom wtag-load-without-query nil
  "*NON-NILなら新たなジャケをロードするとき問合せない."
  :type  'boolean
  :group 'wtag)

(defcustom wtag-no-backup t
  "*非NILならバックアップファイルを作らない.

backup file を作らなくても元のファイルは(今の Emacs であれば)
システムの Trash に破棄されるので万が一のとき復活は可能.
*scratch* buffer 等で以下のように試しゴミ箱に移動していれば対応しています.
 (delete-file \"foo.txt\" 'trash)"
  :type  'boolean
  :group 'wtag)

(defcustom wtag-kakashi (executable-find "kakasi")
  "*カカシの絶対パス. NIL ならソートタグは元の文字列の単純コピー."
  :type  '(choice
           (file :must-match t)
           (const nil))
  :group 'wtag)

(defcustom wtag-kakashi-usrdic
  (and wtag-kakashi
       (cond
        ((boundp 'skk-jisyo)
         (expand-file-name skk-jisyo (getenv "HOME")))
        ((file-exists-p "~/.skk-jisyo")
         (expand-file-name ".skk-jisyo" (getenv "HOME")))))
  "kakasi を賢くするための辞書. NIL なら辞書なしのデフォルト."
  :type  '(choice
           (file :must-match t)
           (const nil))
  :group 'wtag)

(defcustom wtag-make-sort-string-function 'wtag-make-sort-string
  "引数文字列をソートタグ用文字列にして返す関数."
  :type  'function
  :group 'wtag)

(defcustom wtag-music-player "wmplayer.exe"
  "`wtag-music-play' で使う再生アプリ.
PATH が通っていなければフルパスで."
  :type  '(choice
           (file :must-match t)
           (const nil))
  :group 'wtag)

(defcustom wtag-music-opts   '("/play" "/close")
  "`wtag-music-player' に渡すオプション."
  :type  '(repeat string)
  :group 'wtag)

(defcustom wtag-music-coding 'sjis-dos
  "`wtag-music-player' のプロセスコーディング."
  :type  'coding-system
  :group 'wtag)

(defcustom wtag-truncate-lines t
  "非NILなら画面端で表示を折り返さない."
  :type  'boolean
  :group 'wtag)

;; 簡単に色を変えたい場合は以下のような設定を init.el 等でする.
;; 色名一覧は M-x list-colors-display
;; (set-face-foreground 'wtag-genre-name-face "DodgerBlue")
;; (set-face-background 'wtag-protect-face    "misty rose")

(copy-face 'font-lock-function-name-face 'wtag-disk-number-face)  ; Disc number.
(copy-face 'font-lock-comment-face       'wtag-album-artis-face)  ; Album artis name.
(copy-face 'bold                         'wtag-album-name-face)   ; Album name.
(copy-face 'font-lock-builtin-face       'wtag-genre-name-face)   ; Genre name.
(copy-face 'font-lock-type-face          'wtag-release-year-face) ; Release year.
(copy-face 'font-lock-function-name-face 'wtag-track-number-face) ; Track number.
(copy-face 'font-lock-keyword-face       'wtag-artist-name-face)  ; Artist name.
(copy-face 'font-lock-constant-face      'wtag-title-face)        ; Title.
(copy-face 'error                        'wtag-mark-face)         ; Mark.
(copy-face 'header-line                  'wtag-protect-face) ; 編集モード時の編集不可エリア.

(defcustom wtag-read-length-alist
  '(("mp3" . 10) ("oma" . 32) ("mp4" . 10) ("m4a" . 10))
  "拡張子毎の読み込みパーセント. oma はデータが小さいのでこの数値が大きくなる."
  :type  '(repeat (cons :tag "ext . %" string integer))
  :group 'wtag)

(defun wtag-artist-name-max-width (list)
  "アーティスト名文字列の LIST から最大`幅'を返す.
`wtag-directory-set' が生成する list の list から 3番目の要素の一番長い長さを返す."
  (let ((max 0))
    (dolist (a list max)
      (setq max (max (string-width (mf-third a)) max)))))

(defun wtag-read-size (file)
  "FILE から読み込むバイト数を返す.
大きさは `wtag-read-length-alist' に拡張子と読み込むパーセントを
整数をコンスセルにして指定."
  (let ((len (cdr (assoc (downcase (file-name-extension file)) wtag-read-length-alist))))
    (round (* (/ (or (mf-eighth (file-attributes file)) 0) 100.0) len))))

(defcustom wtag-artwork-buffer-suffix "*art*"
  "*Cover buffer名サフィクス."
  :type  'string
  :group 'wtag)

(defcustom wtag-not-available-string  "n/a"
  "*TAG が無いときの代替文字列."
  :type  'string
  :group 'wtag)
  
(defun wtag-artwork-buffer-name (str)
  "STR is index buffer name."
  (concat str wtag-artwork-buffer-suffix))

(defun wtag-str-gets (plist tags &optional ret)
  "PLIST 中のリストに TAGS リストにマッチする :tag か :dsc があればその :data を返す.
マッチしなければ RET が返る."
  (let (result l)
    (catch 'break
      (dolist (a plist (or result ret))
        (setq l (or (plist-get a :dsc) (plist-get a :tag)))
        (and (member l tags) (throw 'break (setq result (plist-get a :data))))))))

(defun wtag-directory-set (files)
  "FILES からタグを読み読み込みリストにして返す.
参照するときここでの順序が影響する."
  (let ((null wtag-not-available-string)
        result message-log-max)
    (dolist (f files (progn (message nil) result))
      (let* ((length  (wtag-read-size f))
             (tags    (condition-case nil
                          (progn (message "Read file %s..." f)
                                 (mf-tag-read f length nil))
                        (error nil)))
             (album   (wtag-str-gets tags '("TALB" "TAL" "\251alb") null))
             (title   (wtag-str-gets tags '("TIT2" "TT2" "\251nam")
                                           (concat null " " (file-name-nondirectory f))))
             (artist  (wtag-str-gets tags '("TPE1" "TP1" "\251ART") null))
             (genre   (wtag-str-gets tags '("TCON" "TCO" "\251gen") null))
             (mode    (wtag-str-gets tags (list mf-type-dummy) ""))
             (track   (wtag-str-gets tags '("TRCK" "TRK" "OMG_TRACK" "trkn") null))
             (disc    (wtag-str-gets tags '("TPOS" "TPA" "disk") null))
             (year    (wtag-str-gets tags '("TYER" "TYE" "\251day") null))
             (aartist (wtag-str-gets tags '("TPE2" "TP2" "OMG_ATPE1" "aART") null))
             (cover   (wtag-str-gets
                       tags '("APIC" "PIC" "GEOB" "OMG_TDFCA" "OMG_FENCA1" "covr"))))
        (when tags
          (setq result
                (cons (list track title artist album f disc genre year aartist mode cover)
                      result)))))))

;; (defun wtag-sort-track (a b)
;;   "sort プリディケイド for trkn. trkn に加えて disk も鑑みる."
;;   (let (tmp1 tmp2)
;;     (setq tmp1 (if disk (* (string-to-number (or (mf-sixth a) "0")) 100) 0)
;;           tmp2 (if disk (* (string-to-number (or (mf-sixth b) "0")) 100) 0))
;;     (setq a (+ (string-to-number (mf-first a)) tmp1)
;;           b (+ (string-to-number (mf-first b)) tmp2))
;;     (< a b)))

(defun wtag-sort-track (a b)
  "sort プリディケイド for trkn."
  (< (string-to-number (mf-first a)) (string-to-number (mf-first b))))

(defun wtag-sort-album (a b)
  "sort プリディケイド for album."
  (string< (mf-fourth a) (mf-fourth b)))

;;;###autoload
(defun dired-wtag (&optional prefix)
  "関数wtag の Dired 用インターフェイス.
PREFIX によって表示するソートオーダーが変わる."
  (interactive "P")
  (let ((dir (dired-get-filename)))
    (wtag (file-name-as-directory dir) prefix)))

(defun wtag-directory-files-list (directory &optional fun)
  "DIRECTORY の中のファイルのタグリストを返す.
FUN は真偽ならソート切り換えスイッチで関数ならソート関数."
  (let* ((suffixs (wtag-suffix-list mf-function-list))
         (files   (if (and (file-regular-p directory)
                           (assoc-default directory mf-function-list 'string-match))
                      (list directory)
                    (wtag-directory-files directory t suffixs)))
         (sort-fun (cond
                    ((functionp fun)
                     fun)
                    (fun
                     'wtag-sort-album)
                    (t
                     'wtag-sort-track))))
    (sort (reverse (wtag-directory-set files)) sort-fun)))

(defun wtag-suffix-list (lst)
  "alist LST の各要素の car だけの list を返す."
  (let (result)
    (while lst
      (setq result (cons (car (car lst)) result))
      (setq lst (cdr lst)))
    result))

(defun wtag-directory-files (directory &optional full regexp-list)
  "regexp を list で複数指定する directory-files.
結果は常にソートされるので 4番目の引数はない."
  (let ((files (directory-files directory full nil t))
        result)
    (if (null regexp-list)
        (sort files #'string-lessp)
      (dolist (f files (sort result #'string-lessp))
        (dolist (rx regexp-list)
          (when (string-match rx f)
            (setq result (cons f result))))))))

;;;###autoload
(defun wtag (directory &optional prefix)
  "DiRECTORY 内の .mp3 または .oma ファイルのタイトル一覧をバッファに表示する.
PREFIX によってソートオーダーが変わる."
  (interactive "DAlbum Directory: \nP")
  (let* ((directory (file-name-as-directory directory))
         (result (wtag-directory-files-list directory prefix))
         (kill-read-only-ok t)
         buffer art-buff obj)
    (unless result (error "No music file"))
    (setq buffer   (mf-fourth  (car result))
          art-buff (wtag-artwork-buffer-name buffer))
    (and (get-buffer buffer) (kill-buffer buffer))
    (and (get-buffer art-buff) (kill-buffer art-buff))
    (and (setq obj (nth 10 (car result)))
         (wtag-artwork-load obj art-buff 'no-disp t))
    (with-current-buffer (get-buffer-create buffer)
      (buffer-disable-undo)
      (wtag-insert-index result directory)
      (set-buffer-modified-p nil)
      (goto-char (point-min))
      (wtag-view-mode)
      (and (get-buffer art-buff) (pop-to-buffer art-buff))
      (pop-to-buffer buffer))))

(defun wtag-insert-index (index directory)
  "Tag plist INDEX を取得した DIRECTORY."
  (let* ((max-width (wtag-artist-name-max-width index))
         form slash)
    (setq slash (or (string-match "/" (mf-first (car index)))
                    (string-match "/" (mf-sixth (car index)))))
    (setq form (if slash "%5s" "%2s"))
    (insert ; Common part.
     (propertize " " 'directory directory 'old-disk (mf-sixth (car index)))
     (propertize (format form (mf-sixth (car index))) 'disk t
                 'mouse-face 'highlight 'face 'wtag-disk-number-face)

     (propertize " " 'old-aartist (mf-ninth (car index)))
     (propertize (mf-ninth (car index)) 'aartist t 'mouse-face 'highlight
                 'face 'wtag-album-artis-face)

     (propertize " " 'old-album (mf-fourth (car index)))
     (propertize (mf-fourth (car index)) 'album t 'mouse-face 'highlight
                 'face 'wtag-album-name-face)
     "\n"

     (propertize
      (make-string (if slash 7 4) 32)
      'old-genre (mf-seventh (car index)))
     (propertize (mf-seventh (car index)) 'genre t
                 'mouse-face 'highlight 'face 'wtag-genre-name-face)
     (propertize " " 'old-year (mf-eighth (car index)))
     (propertize (mf-eighth (car index)) 'year t 'mouse-face 'highlight
                 'face 'wtag-release-year-face)
     "\n")

    ;; `wtag-directory-set' に依存.
    ;; Index 1     2     3      4     5        6    7     8    9       10   11
    ;;       track title artist album filename disc genre year aartist mode cover
    (dolist (a index)
      (setq form (if slash "%5s" "%2s"))
      (insert
       (propertize " " 'old-track (mf-first  a) 'mode (mf-tenth a) 'stat (wtag-stat a))
       ;; Track number.
       (propertize (format form (mf-first  a))
                   'track t 'mouse-face 'highlight 'face 'wtag-track-number-face)
       (propertize " " 'old-performer (mf-third  a) 'file-name (mf-fifth a))
       ;; Performer.
       (propertize (concat
                    (propertize (mf-third  a)
                                'mouse-face 'highlight 'face 'wtag-artist-name-face)
                    (wtag-padding-string (mf-third  a) max-width))
                   'performer t)
       (propertize " " 'old-title (mf-second a) 'file-name (mf-fifth a))
       ;; Music Title.
       (propertize (mf-second a) 'title t 'mouse-face 'highlight 'face 'wtag-title-face)
       "\n"))))

(defun wtag-stat (list)
  "LIST から最後の要素を取り除いた list を返す."
  (reverse (cdr (reverse list))))

(defun wtag-padding-string (str max-width)
    (make-string (1+ (- max-width (string-width str))) 32))

(defun wtag-writable-tag ()
  "タグの書き換えできるモードに入る."
  (interactive)
  (let ((inhibit-read-only t))
    (setq buffer-read-only nil))
  ;; (setq wtag-window (current-window-configuration))
  (wtag-protect)
  (wtag-writable-mode)
  (buffer-enable-undo))

(defun wtag-read-only-visualiz ()
  "text property read-only の箇所を可視化. 手抜き"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (not (eobp))
      (if (get-text-property (point) 'read-only)
          (put-text-property (point) (1+ (point)) 'face 'wtag-protect-face))
      (forward-char)))
  (set-buffer-modified-p nil))

;; <old-disk> DISK <old-album> ALBUM <old-genre> GENRE <old-year> YEAR <"\n">
;;            disk             album-name        genre-name       year
;; 1. 移動: old-disk 末尾(または DISK 先頭)に移動
;; 2. 挿入: DISK 先頭ひとつ前(1-)に漏れてはいけないシンボルを non-sticky-property で挿す
;; 3. 挿入: 変数 protect ～ DISK 先頭(point)までを read-only にする
;; 4. 移動: DISK 末尾に移動 protect に位置をセット
;; 5. 挿入: 現在位置 1+ に end-disk(等) を挿す
;;    ～ 以下タグ分を繰り返す
(defun wtag-protect ()
  "曲タイトル箇所以外を read-only にする."
  (let (protect)
    (save-excursion
      (goto-char (point-min))
      (add-text-properties (point) (1+ (point)) '(front-sticky t common t))
      (setq protect (point))
      (dolist (a '((disk old-disk end-disk) (aartist old-aartist  end-aartist)
                   (album old-album end-album) skip
                   (genre old-genre end-genre) (year old-year end-year) skip))
        (if (eq a 'skip)
            (forward-line)
          (wtag-move-to-property (car a))
          (put-text-property (1- (point)) (point) 'rear-nonsticky t)
          (put-text-property protect (point) 'read-only t)
          (setq protect (wtag-move-to-end-property (car a)))
          (put-text-property (point) (1+ (point)) (caddr a) t)))
      (put-text-property (1- (point)) (point) 'common-end t)
      (while (not (eobp))
        (dolist (a '((track     old-track     end-track)
                     (performer old-performer end-performer)
                     (title     old-title     end-title)))
          (wtag-move-to-property (car a))
          (put-text-property (1- (point)) (point) 'rear-nonsticky t)
          (put-text-property protect (point) 'read-only t)
          (setq protect (wtag-move-to-end-property (car a)))
          (put-text-property (point) (1+ (point)) (caddr a) t))
        (forward-line))
      (put-text-property protect (point-max) 'read-only t)
      (set-buffer-modified-p nil))))

(defun wtag-beg-limit ()
  "行の編集先頭位置を返す."
  (save-excursion
    (beginning-of-line)
    (while (get-text-property (point) 'read-only)
      (forward-char))
    (point)))

(defun wtag-get-name (beg-prop end-prop)
  "text property が BEG-PROP END-PROP の間のバッファ文字列を返す."
  (let ((limit (line-end-position))
        beg end str)
    (save-excursion
      (beginning-of-line)
      (setq beg (next-single-property-change (point) beg-prop nil limit)
            end (next-single-property-change (point) end-prop nil limit))
      (setq str (buffer-substring-no-properties beg end))
      (string-match "\\`[ ]*\\(?1:.*?\\)[ ]*\\'" str)  
      (match-string-no-properties 1 str))))

(defun wtag-move-to-property (property)
  "その行の PROPERTY の先頭位置に移動."
  (let ((limit (line-end-position)))
    (beginning-of-line)
    (goto-char (next-single-property-change (point) property nil limit))))

(defun wtag-move-to-end-property (property)
  "その行の PROPERTY の末尾に移動."
  (let ((limit (line-end-position)))
    (if (get-text-property (point) property) ; PROPERTY に in していれば
        (goto-char (next-single-property-change (point) property nil limit))
      (wtag-move-to-property property) ; さもなければ PROPERTY 先頭に移動して立て直す
      (goto-char (next-single-property-change (point) property nil limit)))))

(defun wtag-get-property-value (prop &optional beg end)
  "BEG から END まで走査して PROP が見つかればその値を返す.
BEG と END のデフォルトはポイントの行頭と行末.
無ければ多分 NIL."
  (let ((beg (or beg (line-beginning-position)))
        (end (or end (line-end-position))))
    (save-excursion
      (goto-char beg)
      (or (get-text-property (point) prop)
          (get-text-property
           (next-single-property-change (point) prop nil end)
           prop)))))

(defun wtag-get-common-property-value (prop)
  "共有部(最初の2行)から PROP を探しその値を返す.
無ければ多分 NIL."
  (let ((beg (point-min))
        (limit (next-single-property-change (point-min) 'common-end)))
    (wtag-get-property-value prop beg limit)))

(defun wtag-cons (sym name)
  "NAME が null string なら nil として SYM に cons."
  (cons sym (if (string-equal name "") nil name)))

(defun wtag-get-common-properties (&optional buffer)
  (save-excursion
    (save-current-buffer
      (if buffer (set-buffer buffer))
      (goto-char (point-min))
      (list 
       (cons 'old-disk    (wtag-get-common-property-value 'old-disk))
       (cons 'old-aartist (wtag-get-common-property-value 'old-aartist))
       (cons 'old-album   (wtag-get-common-property-value 'old-album))
       (cons 'old-genre   (wtag-get-common-property-value 'old-genre))
       (cons 'old-year    (wtag-get-common-property-value 'old-year))
       (cons 'directory   (wtag-get-common-property-value 'directory))))))

(defun wtag-flush-tag-ask ()
  "フィニッシュ時バッファが read-only なら問合せる."
  (interactive)
  (when (or (not buffer-read-only) (and buffer-read-only (y-or-n-p "Do you wanna write?")))
    (wtag-flush-tag))
  (message nil))

(defun wtag-flush-tag ()
  "フィニッシュ関数.
バッファを元にタグを構成しファイルを書き換えロードし直す."
  (interactive)
  (let ((no-backup wtag-no-backup)
        (sfunc     wtag-make-sort-string-function)
        buffer result obj
        new-disk new-aartist new-album new-genre new-year new-title
        old-disk old-aartist old-album old-genre old-year track directory tmp)

    (goto-char (point-min))
    (setq new-disk    (wtag-get-name 'old-disk    'end-disk)
          new-aartist (wtag-get-name 'old-aartist 'end-aartist)
          new-album   (wtag-get-name 'old-album   'end-album))
    (forward-line)
    (setq new-genre (wtag-get-name 'old-genre 'end-genre)
          new-year  (wtag-get-name 'old-year  'end-year))

    (setq tmp (wtag-get-common-properties))
    (setq old-disk    (cdr (assq 'old-disk    tmp))
          old-aartist (cdr (assq 'old-aartist tmp))
          old-album   (cdr (assq 'old-album   tmp))
          old-genre   (cdr (assq 'old-genre   tmp))
          old-year    (cdr (assq 'old-year    tmp))
          directory   (cdr (assq 'directory   tmp)))
    (forward-line)
    
    (while (not (eobp))
      (let* ((mode          (wtag-get-property-value 'mode))
             (old-track     (wtag-get-property-value 'old-track))
             (old-performer (wtag-get-property-value  'old-performer))
             (old-title     (wtag-get-property-value  'old-title))
             (new-track     (wtag-get-name 'old-track     'end-track))
             (new-performer (wtag-get-name 'old-performer 'end-performer))
             (new-title     (wtag-get-name 'old-title     'end-title))
             (filename      (wtag-get-property-value 'file-name))
             (ext           (downcase (file-name-extension filename)))
             (mp3           (and (string-equal ext "mp3") mode))
             (mp4           (member ext '("mp4" "m4a")))
             tags)
        ;; Disk number.
        (and (or mp4 mp3) (not (string-equal old-disk new-disk))
             (push (wtag-cons 'disk new-disk) tags))
        ;; Release year.
        (and (not (string-equal old-year new-year)) (push (wtag-cons 'year new-year) tags))
        ;; Album artist.
        (and (or mp4 mp3) (not (string-equal old-aartist new-aartist))
             (push (wtag-cons 'a-artist new-aartist) tags))
        ;; Track number.
        (and (not (string-equal old-track new-track)) (push (wtag-cons 'track new-track) tags))
        ;; Performer (AKA Artist)
        (when (not (string-equal old-performer new-performer))
          (push (wtag-cons 'artist new-performer) tags)
          (push (wtag-cons 'a-artist new-aartist) tags)
          (and sfunc (not mp3)
               (push (wtag-cons 's-a-artist (funcall sfunc new-aartist)) tags)
               (push (wtag-cons 's-artist (funcall sfunc new-performer)) tags)))
        ;; Music name.
        (when (not (string-equal new-title old-title))
          (push (wtag-cons 'title new-title) tags)
          (and sfunc (not mp3)
               (push (wtag-cons 's-title (funcall sfunc new-title)) tags)))
        ;; Album name.
        (when (not (string-equal new-album old-album))
          (push (wtag-cons 'album new-album) tags)
          (and sfunc (not mp3)
               (push (wtag-cons 's-album (funcall sfunc new-album)) tags)))
        ;; Genre name.
        (and (not (string-equal new-genre old-genre)) (push (wtag-cons 'genre new-genre) tags))
        ;; Album cover artwork.
        (and (wtag-image-filename-exist)
             (push (wtag-cons 'cover (wtag-image-filename-exist)) tags))
        ;; File re-write.
        (when tags
          (wtag-message "wtag re-write tags: \"%s\" %s" filename tags)
          (condition-case err
              (and (null wtag-test) (mf-tag-write filename tags no-backup))
            (wtag-message "File error: %s" filename)))
        (forward-line)))
    (and (get-buffer (wtag-artwork-buffer-name (buffer-name)))
         (kill-buffer (wtag-artwork-buffer-name (buffer-name))))
    (setq buffer-read-only  nil
          inhibit-read-only t)
    (erase-buffer)
    (setq result (wtag-directory-files-list directory))
    (wtag-insert-index result directory)
    (rename-buffer (wtag-get-common-property-value 'old-album))
    (setq buffer (current-buffer))
    (set-buffer-modified-p nil)
    (goto-char (point-min))
    (wtag-view-mode)
    (and (setq obj (nth 10 (car result)))
         (wtag-artwork-load obj (wtag-artwork-buffer-name (buffer-name)) 'no-disp t))
    (and obj (pop-to-buffer (wtag-artwork-buffer-name (buffer-name))))
    (pop-to-buffer buffer)))

(defcustom wtag-log-buffer "*wtag log*"
  "*ログバッファ名."
  :type  'string
  :group 'wtag)

(defcustom wtag-message    nil
  "*NON-NILならログ出力をエコーにも出力."
  :type 'boolean
  :group 'wtag)

(defcustom wtag-log-file-name "~/wtag-%Y%m%d%H%M%S.log"
  "wtag log file name."
  :type  'string
  :group 'wtag)

(defun wtag-message (&rest args)
  "念のためログを記録しておくための関数. セーブはされない."
  (with-current-buffer (get-buffer-create wtag-log-buffer)
    (goto-char (point-max))
    (if (= (length args) 1)
        (progn 
          (and wtag-message (message (car args)))
          (insert  (car args) "\n"))
      (and wtag-message (apply #'message args))
      (insert (apply #'format args) "\n"))))

(defun wtag-log-save ()
  "Emacs 終了コマンドのフックで実行するためのログセーブ関数."
  (interactive)
  (let ((file   (format-time-string wtag-log-file-name))
        (buffer wtag-log-buffer))
    (when (get-buffer buffer)
      (with-current-buffer buffer
        (write-region (point-min) (point-max) file nil 'silent)
        (kill-buffer)))))

(add-hook 'kill-emacs-hook 'wtag-log-save)

(defun wtag-beginning-of-line ()
  "wtag 用 beginning-of-line.
一旦編集ブロックの先頭で止まるが更に押すと前の編集ブロックへ移動."
  (interactive)
  (let ((limit (wtag-beg-limit)))
    (if (get-text-property (1- (point)) 'read-only)
        (progn
          (goto-char (previous-single-property-change (point) 'read-only nil limit))
          (goto-char (previous-single-property-change (point) 'read-only nil limit)))
      (goto-char (previous-single-property-change (point) 'read-only nil limit)))))

(defun wtag-end-of-line ()
  "wtag 用 end-of-line.
一旦編集ブロックの終端で止まるが更に押すと次の編集ブロックへ移動."
  (interactive)
  (let ((limit (line-end-position)))
    (if (get-text-property (point) 'read-only)
        (progn
          (forward-char)
          (goto-char (next-single-property-change (point) 'read-only nil limit))
          (skip-chars-backward " "))
      (goto-char (next-single-property-change (point) 'read-only nil limit)))))

(defun wtag-next-tag (&optional arg)
  "次の編集ブロックへ移動."
  (interactive "p")
  (condition-case nil
      (dotimes (i (or arg 1))
        (goto-char (next-single-property-change (point) 'read-only))
        (while (get-text-property (point) 'read-only) (forward-char)))
    (error (progn
             (goto-char (point-max))
             (while (get-text-property (point) 'read-only)
               (backward-char))))))
           
(defun wtag-previous-tag (&optional arg)
  "前の編集ブロックへ移動."
  (interactive "p")
  (condition-case nil
      (dotimes (i (or arg 1))
        (while (not (get-text-property (point) 'read-only)) (backward-char))
        (while (get-text-property (point) 'read-only) (backward-char))
        (while (not (get-text-property (point) 'read-only)) (backward-char))
        (forward-char))
    (error (progn
             (goto-char (point-min))
             (while (get-text-property (point) 'read-only)
               (forward-char))))))

(defun wtag-kill-line ()
  "編集ブロックを削除. 内容はキルリングに残るのでヤンクできる."
  (interactive)
  (kill-region (point) (next-single-property-change (point) 'read-only)))

(defun wtag-transpose-lines (&optional arg)
  "カーソル行と上の行を入れ替えリナンバーもする."
  (interactive "*p")
  (let ((inhibit-read-only t)
        (line     (count-lines (point-min) (if (eobp) (point) (1+ (point))))))
    (if (or (< line 4) (eobp))
        (error "Out of range")
      (transpose-lines arg)
      (wtag-renumber-tracks))))

(defun wtag-renumber-tracks ()
  "バッファのトラックナンバーを書き換え昇順にリナンバーする."
  (let (max-line form beg end (c 1))
    (save-excursion
      (goto-char (point-min))
      (forward-line 2)
      (setq max-line (count-lines (point) (point-max)))
      (while (not (eobp))
        (setq beg (wtag-move-to-property 'old-track)
              end (wtag-move-to-property 'end-track))
        (setq form
              (if (string-match "/" (buffer-substring-no-properties beg end))
                  `("%5s" ,(concat (number-to-string c) "/" (number-to-string max-line)))
                `("%2s" ,(number-to-string c))))
        (delete-region beg end)
        (insert (apply #'format form))
        (setq c (1+ c))
        (forward-line)))))

(defcustom wtag-artistname-copy-all-without-query t
  "*NON-NIL なら`wtag-artistname-copy-all' で問い合わせない."
  :type  'boolean
  :group 'wtag)

(defun wtag-artistname-copy-all ()
  "バッファのアルバムアーティストをバッファのアーティストすべてにコピー."
  (interactive)
  (let (beg end album-artist)
    (when (or (null wtag-artistname-copy-all-without-query)
              (y-or-n-p "Album artis name copy all?"))
      (save-excursion
        (goto-char (point-min))
        (setq album-artist
              (buffer-substring-no-properties
               (progn (wtag-move-to-end-property 'old-aartist) (point))
               (progn (wtag-move-to-property     'end-aartist) (point))))
        (forward-line 2)
        (while (not (eobp))
          (setq beg (wtag-move-to-end-property 'old-performer)
                end (wtag-move-to-property     'end-performer))
          (delete-region beg end)
          (insert album-artist)
          (forward-line))))
    (message nil)))

(defun wtag-point-file-name ()
  "ポイントの曲に対応するファイル名をエコーエリアに表示.
対応ファイルがなければ読み込みしたカレントディレクトリを表示."
  (interactive)
  (message
   "%s"
   (or (wtag-get-property-value 'file-name)
       (wtag-get-common-property-value 'directory))))

(defun wtag-mouse-load (event)
  "画像ファイルをマウス左ボタンで Emacs にドラッグ&ドロップ.
MP3 も M4A(MP4) もPNG 対応しているようだが JPEG を推奨."
  (interactive "e")
  (and (eq (mf-first event) 'drag-n-drop)
       (not (eq major-mode 'wtag-view-mode))
       (wtag-artwork-load (car (mf-third event)))))

(defun wtag-artwork-load (file-or-object &optional name no-disp no-modified)
  "ファイルまたはバイナリをカレントバッファから生成した名前の画像バッファに表示する.
既に画像バッファがあるときは読み込んでいいか通常問い合わせをするが
`wtag-load-without-query' が NON-NIL だと確認をしない.
NAME があればその名前そのものでバッファを作る.
NO-DISP が NON-NIL なら load 後再表示を試みない.
NO-MODIFIED が NON-NIL なら表示後に立つモデファイフラグをクリアする."
  (interactive "fImage: ")
  (let ((buffer (or name (wtag-artwork-buffer-name (buffer-name)))))
    (if (or (not (get-buffer buffer))
            wtag-load-without-query
            (y-or-n-p "Change artwork?"))
        (progn
          (with-current-buffer (get-buffer-create buffer)
            (fundamental-mode)
            (set-buffer-multibyte nil)        
            (setq buffer-read-only nil)
            (erase-buffer)
            (if (file-exists-p file-or-object)
                (progn
                  (insert-file-contents-literally file-or-object)
                  (setq wtag-image-filename (expand-file-name file-or-object)))
              (insert file-or-object)
              (setq wtag-image-filename nil))
            (and no-modified (set-buffer-modified-p nil))
            (wtag-image-mode))
          (and (null (get-buffer-window buffer)) (not no-disp) (display-buffer buffer)))
      (message nil))))

(defun wtag-recovery-artwork (cover)
  "COVER 画像をバッファに復帰する.
紐づけされていたファイル名もクリアされる."
  (let ((buffer (wtag-artwork-buffer-name (buffer-name))))
    (with-current-buffer (get-buffer-create buffer)
      (setq wtag-image-filename nil)      
      (fundamental-mode)
      (setq buffer-read-only nil)
      (erase-buffer)
      (insert cover)
      (set-buffer-multibyte nil)
      (set-buffer-modified-p nil)
      (wtag-image-mode))))

(defun wtag-image-filename-exist ()
  (let ((buffer (wtag-artwork-buffer-name (buffer-name))))
    (and (get-buffer buffer)
         (with-current-buffer  buffer
           wtag-image-filename))))

(defun wtag-open-frame ()
  (interactive)
  (set-buffer (wtag-artwork-buffer-name (buffer-name)))
  (set (make-local-variable 'wtag-frame) (make-frame)))

(defun wtag-popup-artwark ()
  (interactive)
  (let ((buffer  (current-buffer))
        (abuffer (wtag-artwork-buffer-name (buffer-name))))
    (and (get-buffer abuffer) (pop-to-buffer abuffer) (pop-to-buffer buffer))))

(defun wtag-quit ()
  (interactive)
  (if (and (boundp 'wtag-frame) wtag-frame)
      (progn
        (setq wtag-frame nil)
        (delete-frame wtag-frame))
    (quit-window)))

(defun wtag-exit ()
  (interactive)
  (let* ((buf (current-buffer))
         (art (wtag-artwork-buffer-name (buffer-name buf))))
    (when (y-or-n-p "Exit wtag?")
      (and (get-buffer art) (kill-buffer art))
      (kill-buffer))
    (message nil)))

(defun wtag-music-play ()
  "PATH を通しておくのと(推奨)
プロセス文字コードのセットが必要(日本語ファイル名もOKになる)
 (modify-coding-system-alist 'process \"wmplayer\" '(undecided . sjis-dos))"
  (interactive)
  (let* ((file (wtag-get-property-value  'file-name))
         (name " *wtag process*")
         (com  wtag-music-player)
         (opts (append wtag-music-opts (list file)))
         (code wtag-music-coding)
         (process-coding-system-alist
          (cons `(,com undecided . ,code) process-coding-system-alist)))
    (when file
      (message "Play file: %s." file)
      (setq wtag-ps (apply #'start-process name name com opts)))))

(defun wtag-kill-process ()
  (interactive)
  (kill-process wtag-ps))

(defun wtag-get-mark-files ()
  "mark があればマーク行のファイル名を list で返し、
さもなくばポイント行のファイル名を list で返す."
  (interactive)
  (let (display result)
    (save-excursion
      (setq display  (next-single-property-change (point-min) 'display))
      (if display
          (progn
            (goto-char display)
            (while (not (eobp))
              (if (wtag-get-property-value 'display)
                  (setq result (cons (wtag-get-property-value 'file-name) result)))
              (forward-line)))
        (setq result (list (wtag-get-property-value 'file-name)))))
    (if (null (car result)) nil result)))

(defun wtag-point-mark-file ()
  "point のファイルをマークする."
  (let ((inhibit-read-only t))
    (when (wtag-get-property-value 'file-name)
      (beginning-of-line)
      (put-text-property
       (point) (1+ (point)) 'display (propertize "*" 'face 'wtag-mark-face))
      (set-buffer-modified-p nil))))

(defun wtag-point-unmark-file ()
  "point のファイルのマークを解除する."
  (let ((inhibit-read-only t))
    (when (wtag-get-property-value 'display)
      (beginning-of-line)
      (when (wtag-get-property-value 'display)
        (remove-text-properties (point) (1+ (point)) '(display nil))
        (set-buffer-modified-p nil)))))

(defun wtag-mark-file ()
  "point のファイルをマークしてポイントを1行進める.
point が 1行目ならすべてマークする."
  (interactive)
  (if (= 1 (line-number-at-pos))
      (save-excursion
        (while (not (eobp))
          (forward-line)
          (wtag-point-mark-file)))
    (wtag-point-mark-file))
  (forward-line))
  
(defun wtag-unmark-file ()
  "point のファイルのマークを解除してポイントを1行進める."
  (interactive)
  (wtag-point-unmark-file)
  (forward-line))

(defun wtag-unmark-previous-file ()
  "point のファイルのマークを解除してポイントを1行進める."
  (interactive)
  (wtag-point-unmark-file)
  (forward-line -1))

(defun wtag-unmark-all-file ()
  (interactive)
  (let ((inhibit-read-only t))
    (save-excursion
      (goto-char (point-min))
      (while (not (eobp))
        (and (wtag-get-property-value 'display) (wtag-point-unmark-file))
        (forward-line))
      (set-buffer-modified-p nil))))

(put 'wtag-music-copy 'ido 'ignore)

(defun wtag-music-copy ()
  "マークされているか point にある曲を次のウインドウのバッファの default-directory にコピー.
コピー先も wtag mode ならタイトルタグをコピー先のものに書き換え、さもなくば単純にコピーする.
BUG: Album artist や Disk number 等他共有タグも
本当は書き換えなくてはいけないがそこまでしてない."
  (interactive)
  (let* ((src-files   (wtag-get-mark-files))
         (next-buffer (window-buffer (next-window)))
         (sfunc wtag-make-sort-string-function)
         dst-dir dst-album dst-mode not-mp3 tmp)
    (setq tmp (with-current-buffer next-buffer (cons major-mode default-directory)))
    (setq dst-mode (car tmp)
          dst-dir  (cdr tmp))
    (setq dst-dir (file-name-as-directory (read-file-name "Copy to: " dst-dir)))
    (if (not (memq dst-mode '(wtag-view-mode 'wtag-writable-mode)))
        (dolist (f src-files)
          (copy-file f dst-dir 0))
      (setq tmp (wtag-get-common-properties next-buffer))
      (setq dst-album (list
                       (cons 'album    (cdr (assq 'old-album   tmp)))
                       (cons 'a-artist (cdr (assq 'old-aartist tmp)))
                       (cons 'genre    (cdr (assq 'old-genre   tmp)))
                       (cons 'year     (cdr (assq 'old-year    tmp)))))
      (setq not-mp3
            (and sfunc
                 (list (cons 's-album    (funcall sfunc (cdr (assq 'old-album   tmp ))))
                       (cons 's-a-artist (funcall sfunc (cdr (assq 'old-aartist tmp)))))))
      (dolist (f src-files)
        (mf-tag-write f
                      (if (string-match "mp3\\'" (file-name-extension f))
                          (append not-mp3 dst-album)
                        dst-album)
                      (concat dst-dir (file-name-nondirectory f))))
      (with-current-buffer next-buffer
        (and (get-buffer (wtag-artwork-buffer-name (buffer-name)))
             (kill-buffer (wtag-artwork-buffer-name (buffer-name))))
        (setq buffer-read-only  nil
              inhibit-read-only t)
        (erase-buffer)
        (wtag-insert-index (wtag-directory-files-list dst-dir) dst-dir)
        (set-buffer-modified-p nil)
        (goto-char (point-min))
        (wtag-view-mode)))))

(defun wtag-truncate-lines ()
  (interactive)
  (setq truncate-lines (not truncate-lines)))

(defun wtag-writable-tag-cancel ()
  "行なったタグの書き換えを破棄する.
タグバッファも画像バッファも編集前のものに復帰する."
  (interactive)
  (when (or (and (not (wtag-image-filename-exist)) (not (buffer-modified-p)))
            (y-or-n-p "Cancel?"))
    (save-excursion
      (buffer-disable-undo)
      (and (boundp 'wtag-old-cover) wtag-old-cover (wtag-recovery-artwork wtag-old-cover))
      (setq inhibit-read-only t)
      (erase-buffer)
      (insert wtag-old-content)
      (set-buffer-modified-p nil)
      (setq buffer-read-only  t
            inhibit-read-only nil)
      (wtag-view-mode)))
  (message nil))

(require 'japan-util)
(defun wtag-make-sort-string (str)
  "STR を sort tag 用の文字列にして返す."
  (let ((inhibit-read-only t))
    (when (string-match "\\`\\(?1:The \\)\\(?2:.+\\)" str)
      (setq str (match-string-no-properties 2 str)))
    (if wtag-kakashi
        (wtag-kakashi (japanese-zenkaku str))
      str)))

(defun wtag-kakashi (str)
  "STR をカナ読みに展開. 要 kakasi & nkf.
nkf は完全にあることが前提でノーチェックです."
  (let ((process-coding-system-alist '(("bash\\|cmd" undecided . sjis-dos)))
        (exe wtag-kakashi)
        (dic (if (boundp 'wtag-kakashi-usrdic) wtag-kakashi-usrdic ""))
        ret)
    (setq ret (shell-command-to-string
               (format "echo %s | nkf | %s -JK -HK %s" str exe dic)))
    (substring-no-properties ret 0 (1- (length ret)))))

(defvar wtag-writable-mode-map nil "`wtag-writable-mode' 用キーマップ.")
(if wtag-writable-mode-map
    nil
  (setq wtag-writable-mode-map
        (let ((map (make-sparse-keymap))
              (menu-map (make-sparse-keymap "WTAG")))
          (define-key map [remap move-beginning-of-line] 'wtag-beginning-of-line)
          (define-key map [remap move-end-of-line]       'wtag-end-of-line)
          (define-key map [remap kill-line]              'wtag-kill-line)
          (define-key map "\C-i"          'wtag-next-tag)
          (define-key map (kbd "<S-tab>") 'wtag-previous-tag)
          (define-key map "\C-j"          'ignore)
          (define-key map "\C-m"          'wtag-next-line-tag)
          (define-key map "\C-x\C-t"      'wtag-transpose-lines)
          (define-key map "\C-c\C-c"      'wtag-flush-tag-ask)
          (define-key map "\C-c\C-l"      'wtag-truncate-lines)
          (define-key map "\C-c\C-a"      'wtag-artistname-copy-all)
          (define-key map "\C-c="         'wtag-point-file-name)
          (define-key map "\C-x\C-q"      'wtag-writable-tag-cancel)
          (define-key map "\C-c\C-q"      'wtag-writable-tag-cancel)
          (define-key map "\C-x\C-k"      'wtag-writable-tag-cancel)
          (define-key map "\C-c\C-k"      'wtag-writable-tag-cancel)
          (define-key map "\C-c\C-i"      'wtag-artwork-load)
          (define-key map "\C-c\C-f"      'wtag-open-frame)
          (define-key map "\C-cP"         'wtag-at-property)
          (define-key map [drag-n-drop]   'wtag-mouse-load)
          (define-key map [menu-bar wtag] (cons "Wtag" menu-map))
          ;; (define-key menu-map [vis-read-only] '("Visualyse rad-only text" . vis-read-only))
          (define-key menu-map [wtag-point-file-name]
            '("Point File name" . wtag-point-file-name))
          (define-key menu-map [wtag-truncate-lines]
            '("Truncate lines" . wtag-truncate-lines))
          (define-key menu-map [wtag-open-frame]
            '("Artwork on Other frame" . wtag-open-frame))
          (define-key menu-map [wtag-artwork-load]
            '("Artwork image load" . wtag-artwork-load))          
          (define-key menu-map [wtag-artistname-copy-all]
            '("Album artist copy all" . wtag-artistname-copy-all))
          (define-key menu-map [wtag-flush-tag-ask]
            '("Write and Quit" . wtag-flush-tag-ask))
          (define-key menu-map [wtag-writable-tag-cancel]
            '("Cancel" . wtag-writable-tag-cancel))
          map)))

(define-derived-mode wtag-writable-mode text-mode "Editable Tag"
  "Music file writable tag mode.
\\{wtag-writable-mode-map}"
  (set (make-local-variable 'wtag-old-content)
       (buffer-substring (point-min) (point-max)))
  (let ((inhibit-read-only t))
    (remove-text-properties (point-min) (point-max) '(face nil))
    (wtag-read-only-visualiz))
  (and (get-buffer (wtag-artwork-buffer-name (buffer-name)))
       (set (make-local-variable 'wtag-old-cover)
            (with-current-buffer (wtag-artwork-buffer-name (buffer-name))
              (buffer-substring (point-min) (point-max)))))
  (set (make-local-variable 'wtag-old-point) (point))
  (set (make-local-variable 'query-replace-skip-read-only) t)
  (setq-local truncate-lines wtag-truncate-lines))

(defvar wtag-view-mode-map nil "`wtag-view-mode' 用キーマップ.")
(if wtag-view-mode-map
    nil
  (setq wtag-view-mode-map
	(let ((map (make-sparse-keymap))
              (menu-map (make-sparse-keymap "WTAG")))
	  (define-key map " "               'next-line)
	  (define-key map (kbd "<tab>")     'next-line)
	  (define-key map (kbd "<backtab>") 'previous-line)
          (define-key map [?\S- ]           'previous-line)
	  (define-key map "\C-m"            'next-line)
	  (define-key map "n"               'next-line)
	  (define-key map "p"               'previous-line)
	  (define-key map "\C-c\C-l"        'wtag-truncate-lines)
          (define-key map "\C-c="           'wtag-point-file-name)
          (define-key map "F"               'wtag-open-frame)
          (define-key map "\C-c\C-a"        'wtag-popup-artwark)
          (define-key map "m"               'wtag-mark-file)
          (define-key map "u"               'wtag-unmark-file)
          (define-key map [backspace]       'wtag-unmark-previous-file)
          (define-key map "U"               'wtag-unmark-all-file)
          (define-key map "C"               'wtag-music-copy)
          (define-key map "P"               'wtag-music-play)
          (define-key map "\C-c\C-c"        'wtag-kill-process)          
	  (define-key map "q"               'quit-window)
	  (define-key map "Q"               'wtag-exit)
          (define-key map [drag-n-drop]     'ignore)
	  (define-key map "\C-x\C-q"        'wtag-writable-tag)
          (define-key map "\C-cP"           'wtag-at-property)
          (define-key map [menu-bar wtag] (cons "Wtag" menu-map))
          (define-key menu-map [wtag-point-file-name]
            '("Point File name" . wtag-point-file-name))
          (define-key menu-map [wtag-truncate-lines] '("Truncate lines" . wtag-truncate-lines))
          (define-key menu-map [wtag-music-copy] '("Copy point file" . wtag-music-copy))
          (define-key menu-map [wtag-kill-process] '("Kill paly process" . wtag-kill-process))
          (define-key menu-map [wtag-music-play] '("Play point file" . wtag-music-play))
          (define-key menu-map [wtag-popup-artwark] '("Popup artwork" . wtag-popup-artwark))
          (define-key menu-map [wtag-open-frame] '("Artwork on other frame" . wtag-open-frame))
          (define-key menu-map [wtag-writable-tag] '("Writable tag" . wtag-writable-tag))
          (define-key menu-map [wtag-exit] '("Kill wtag buffer" . wtag-exit))
          (define-key menu-map [quit-window] '("Quit" . quit-window))
	  map)))

(define-derived-mode wtag-view-mode text-mode "Wtag"
  "Music file tag view mode.
\\{wtag-view-mode-map}"
  (setq buffer-read-only  t
        inhibit-read-only nil)
  (setq-local truncate-lines wtag-truncate-lines)
  (setq-local default-directory (wtag-get-common-property-value 'directory)))

(defvar wtag-image-mode-map nil "`wtag-image-mode' 用キーマップ.")
(if wtag-image-mode-map
    nil
  (setq wtag-image-mode-map
        (let ((map (make-sparse-keymap))
              (menu-map (make-sparse-keymap "WTAG")))
          (define-key map "\C-c\C-i"      'wtag-artwork-load)
          (define-key map "\C-cP"         'wtag-at-property)
          (define-key map "q"             'wtag-quit)
          (define-key map [drag-n-drop]   'wtag-mouse-load)
          (define-key map [menu-bar wtag] (cons "Wtag" menu-map))
          (define-key menu-map [wtag-artwork-load] '("Artwork load" . wtag-artwork-load))
          map)))

(define-derived-mode wtag-image-mode image-mode "wtag-image"
  "Music file tag image mode.
\\{wtag-image-mode-map}")

(provide 'wtag)
;; fine.
