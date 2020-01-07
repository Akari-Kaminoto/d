;;; mf-tag-write.el -- Music file tag write.  -*- coding: utf-8-emacs -*-
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

;; The lib-mp3.el, lib-mp4.el, etc. that actually read and write are required.

;; * Write function.
;; ** It is a front end for music file tag reading and writing functions.
;; (mf-tag-write "file.m4a" '((artist . "NEW ARTIST") (title . "NEW TITLE")))

;; ** If the third argument is NON-NIL, no backup is made. If the file name, write to that file.
;; (mf-tag-write "file.m4a" '((artist . "NEW ARTIST") (title . "NEW TITLE")) "other.m4a")

;; * Read function.
;; ** This is Tag read. A tag is returned in the property list.
;; (mf-tag-read "file.mp3")

;; ** Specify the length to be read as an option.
;;   If this is not enough, re-read the necessary part.
;; (mf-tag-read "file.mp4" 1024)

;; ** If the third argument is NON-NIL, loading the artwork is omitted.
;; (mf-tag-read "file.m4a" 1024 t)

;;; Installation:

;; (require 'mf-tag-write)

;;; Change Log:

;;; Code:

(defgroup music-file nil
  "Music File Utility."
  :group 'multimedia
  :version "26.3"
  :prefix "mf-")

(require 'mf-lib-mp3)
(require 'mf-lib-mp4)

(defconst mf-tag-write-version "1.0")
(defconst mf-tag-write-rcs-version "$Revision: 1.1 $")

(defvar mf-function-list  nil)

(defvar mf-current-file nil "for buffer local variable.")
(defvar mf-current-mode nil "for buffer local variable.")
(defvar mf-current-func nil "for buffer local variable.")

(defgroup mf-tag nil
  "Music file tag edit."
  :group 'multimedia
  :version "26.2")

(defvar mf-id-to-mode
  '(("ID3\1" . id31) ("ID3\2" . id32) ("ID3\3" . id33) ("ID3\4" . id34) ("ea3\3" . oma)
    ("M4A " . m4a) ("mp42" . m4a)))
(defvar mf-id-to-mode-else   'm4a)

(defconst mf-file-tag-list
  '("covr" "APIC" "PIC" "GEOB" "OMG_FENCA1" "OMG_TDFCA" "USLT" "ULT" "\251lyr"))

(defvar mf-file-regexp  "\\.\\(jpg\\|png\\|txt\\)\\'")
(defvar mf-image-regexp "\\.\\(jpg\\|png\\)\\'")
(defvar mf-text-regexp  "\\.\\(txt\\)\\'")

(defun mf-id-to-mode (id)
  (or (cdr (assoc id mf-id-to-mode)) mf-id-to-mode-else))

(defun mf-set-file-tag (mode file alias)
  (cond
   ((string-match mf-image-regexp file)
    (mf-set-image-tag mode file))
   ((string-match mf-text-regexp file)
    (mf-set-text-tag file alias))))

(defun mf-set-text-tag (file alias)
  (list :tag (cdr (assq 'lyric alias))
        :dsc ""
        :type 1
        :data (with-temp-buffer (insert-file-contents file) (buffer-string))))

(defun mf-set-image-tag (mode file)
  "FILE 情報から構築した tag MODE の image tag のリストを返す."
  (let ((ext  (upcase (file-name-extension file)))
        (geob mf-geob-image)
        tag mime type)
    (setq tag (or
               (cdr (assoc mode '(("ID3\2" . "PIC") ("ID3\3" . "APIC") ("ea3\3" . "GEOB"))))
               "covr"))
    (setq mime
          (cond
           ((string-equal mode "ID3\2")
            ext)
           ((string-equal mode "ID3\3")
            (if (string-equal ext "JPG")
                "image/jpeg"
              "image/png"))))
    (setq type
          (if (or (string-equal mode "mp4") (string-equal mode "m4a"))
              (if (string-equal ext "JPG")
                  (car (rassq 'jpeg mf-ilst-data-type))
                (car (rassq 'png mf-ilst-data-type)))
            3))
    (list :tag  tag  :mime mime :type type
          :dsc  (if (string-equal mode "ea3\3") geob nil)
          :file (file-name-nondirectory file)
          :data (with-temp-buffer
                  (insert-file-contents-literally file)
                  (set-buffer-multibyte nil)
                  (buffer-string)))))

(defun mf-file-cell (cell alias)
  "CELL のドットペアリストがイメージかリリックのタグのセットなら非NILを返す."
  (let ((tag (if (symbolp (car cell)) (cdr (assoc (car cell) alias)) (car cell))))
    (and
     (member tag mf-file-tag-list)
     (and (stringp (cdr cell))
          ;; 今はファイルしか受け付けないので (file-exists-p (cdr cell)) が実は正解だが
          ;; 後でオブジェクトでも受けつけるようにするため保留.
          (string-match mf-file-regexp (cdr cell))))))

(defun mf-list-convert (alist)
  "主に手書きで指定するために ALIST を plist に変換.
要素に :tag があれば素通りする.
画像や歌詞のタグの場合ファイル名だけでも OK.
つまり '((\"TAG\" . \"STR\") (\"TAG\" . \"STR\") \"FILE.jpg\" ...) のように指定する.
CDR を NIL とするとそのタグの削除になる."
  (let* ((mode        mf-current-mode)
         (alias       (mf-alias mf-current-func))
         (omg-tags    mf-omg-tags)
         (itunes-tags mf-itunes-tags)
         result tag str)
    (dolist (a alist (reverse result))
      (and (not (plist-get a :tag)) (not (mf-pair-p a)) (listp a) (= 2 (length a))
           (setq a (cons (car a) (cadr a))))
      (unless (stringp a)
        (setq tag (if (symbolp (car a)) (cdr (assoc (car a) alias)) (car a))
              str (if (and (cdr a) (symbolp (cdr a))) (symbol-name (cdr a)) (cdr a)))
        (when (null tag) (error "Bad arg... %s" a)))
      (setq result
            (cons
             (cond
              ((plist-get a :tag)
               a)
              ((mf-pair-p a)
               (cond     
                ((member tag omg-tags)
                 (list :tag "TXXX" :dsc tag :data str))
                ((member tag itunes-tags)
                 (list :tag "----"  :mean "com.apple.iTunes" :type 1 :dsc tag :data str))
                ((mf-file-cell a alias)
                 (mf-set-file-tag mode (cdr a) alias))
                (t
                 (list :tag tag :type (mp4-tag-type tag) :data str)))) ;; mf-lib-mp4.el
              ((and (listp a) (= 1 (length a))) ; Delete tag part.
               (list :tag tag :file nil :data nil))
              ((stringp a)
               (cond
                ((string-match mf-image-regexp a)
                 (mf-set-image-tag mode a))
                ((string-match mf-text-regexp a)
                 (mf-set-text-tag a alias))))
              (t
               (error "Unknown format: %s" a)))
             result)))))

(defun mf-add-tags (org-tags new-tags)
  "ORG-TAGS から NEW-TAGS の要素を削除したリストに NEW-TAGS をアペンドして返す.
整列順は壊れるが最終的に書き出すときに適宜整列するのでここでは無駄に維持していない."
  (let (tag org new)
    (dolist (a org-tags)
      (setq tag (or (plist-get a :dsc) (plist-get a :tag)))
      (unless
          (catch 'break
            (dolist (b new-tags)
              (and (string-equal tag (or (plist-get b :dsc) (plist-get b :tag)))
                   (throw 'break t)))
            (setq org (cons a org)))))
    (dolist (a new-tags)
      (and (plist-get a :data) (setq new (cons a new))))
    (append org new)))

(defun set-make-local-variables (vals)
  (dolist (v vals)
    (make-variable-buffer-local v)))

(defun mf-func-get (file funclist)
  "FILE にマッチする関数セットを FUNCLIST list より取得. 無ければ NIL.
FUNCLIST は '((REGEXP READ-FUNC WRITE-FUNC CV-FUNC ALIAS-LIST ) (...)) といった形式."
  (assoc-default file funclist 'string-match))

;; 引数がまちまちなのでバッファローカル変数化して引数なしにするかも.
(defun mf-rfunc (funclist)
  "FUNCLIST から Read function を返す.
関数の引数は file length no-binary の 3つ."
  (car funclist))

(defun mf-wfunc (funclist)
  "FUNCLIST から Write function を返す.
関数の引数は tag-list no-binary の 2つ."
  (cadr funclist))

(defun mf-cvfunc (funclist)
  "FUNCLIST から Convert function を返す. 引数は list のみ."
  (caddr funclist))

(defun mf-alias (funclist &optional mode)
  "FUNCLIST から mf-current-mode または MODE の alias 設定を得る.
FUNCLIST の中の 第4の値が list なら要素の car が mode に equal の要素を返し
atom なら第4の値をそのまま返す. いずれも eval して返す."
  (let ((alias (cadddr funclist))
        (mode (or mode mf-current-mode)))
    (if (listp alias)
        (eval (assoc-default mode alias))
      (eval alias))))

;;;###autoload
(defun mf-tag-write (file &optional new-tags no-backup time-opt)
  "FILE の既存タグに plist形式の NEW-TAGS が含まれれば置き換え無ければ追加し書き換える.
NO-BACKUP が非NIL なら Backup file を作らない.
NO-BACKUP が文字列ならそのファイルに書き出す。その場合バックアップはされない.
TIME-OPT が非NIL ならタイムスタンプを継承する."
  (interactive "fFile: \nxTags: ")
  (let* ((time-opt (and time-opt (mf-sixth (file-attributes file))))
         (func   (mf-func-get file mf-function-list))
         (wfunc  (mf-wfunc func))
         (cvfunc (mf-cvfunc func))
         tags)
    (unless func (error "Unknow file type %s" file))
    (with-temp-buffer
      (set-make-local-variables '(mf-current-file mf-current-mode mf-current-func))
      (set-buffer-multibyte nil)
      (setq mf-current-func func)
      (setq tags (mf--tag-read file))
      (if (stringp no-backup)
          (setq mf-current-file no-backup)
        (setq mf-current-file file))
      (funcall wfunc (mf-add-tags tags (funcall cvfunc new-tags)) no-backup))
    (and time-opt (symbolp no-backup) (set-file-times file time-opt))))

(defun mf--tag-read (file &optional length no-binary)
  "FILE 名により `mf-read-function-alist' で設定された関数を実行する.
関数はファイルのタグ情報をプロパティリストにして返す関数.
カレントバッファで実行したい場合もあるので分離してある.
LENGTH は読み込む大きさ. NO-BINARY が非NIL だと返り値に画像タグを含まない."
  (let ((func (mf-func-get file mf-function-list)))
    (if func
        (progn
          (setq mf-current-func func)
          (funcall (mf-rfunc func) file length no-binary))
      (error "Unknown music file: %s" file))))

;;;###autoload
(defun mf-tag-read (file &optional length no-binary)
  "temp-buffer を開いて `mf--tag-read' を実行するラッパ."
  (with-temp-buffer
    (set-make-local-variables '(mf-current-file mf-current-mode mf-current-func))
    (mf--tag-read file length no-binary)))

(provide 'mf-tag-write)
