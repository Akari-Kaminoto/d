;;; buffer-menu-color.el --- Color for Buffer-menu-mode   -*- lexical-binding: t; -*-

;; Copyright (C) 2017, 2018 fubuki

;; Author: fubuki@*****.org
;; Keywords: tools

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Color buffer-menu-mode.
;; This program also sorts menus from the "," key, and shortcut on "j".

;;; Installation:

;; (require 'buffer-menu-color)

;;; Code:

;;(require 'buff-menu)
(require 'tabulated-list)
(require 'simple)

(defvar buff-menu-man-face
  (copy-face font-lock-variable-name-face 'buff-menu-man-face))        ; Man page
(defvar buff-menu-dired-face
  (copy-face font-lock-function-name-face 'buff-menu-dired-face))      ; Dired
(defvar buff-menu-named-face
  (copy-face font-lock-string-face        'buff-menu-named-face))      ; "*" named buffer
(defvar buff-menu-mew-face
  (copy-face font-lock-constant-face      'buff-menu-mew-face))        ; mew buffer
(defvar buff-menu-read-only-face
  (copy-face font-lock-keyword-face       'buff-menu-read-only-face))  ; "%" Read Only Buffer

(set-face-foreground
 (defvar buff-menu-shell-face    (make-face 'buff-menu-shell-face))    "DodgerBlue")
(set-face-foreground
 (defvar buff-menu-scratch-face  (make-face 'buff-menu-scratch-face))  "DeepPink")
(set-face-foreground
 (defvar buff-menu-modified-face (make-face 'buff-menu-modified-face)) "Red")
(set-face-foreground
 (defvar buff-menu-eww-face      (make-face 'buff-menu-eww-face))      "DarkOrange")

(defcustom buffer-menu-font-lock-keywords
  '(("^....[*]Man .*Man.*"   . buff-menu-man-face)
    ("^.%.*\\([* ]Mew message[* ]\\|Virtual\\|Summary\\).*" . buff-menu-mew-face)
    (".*Dired.*"             . buff-menu-dired-face)
    (".*eww.*"               . buff-menu-eww-face)
    ("^....[*]e?shell.*"     . buff-menu-shell-face)
    (".*[*]scratch[*].*"     . buff-menu-scratch-face)
    ("^....[*].*"            . buff-menu-named-face)
    ("^..[*].*"              . buff-menu-modified-face)
    ("^.%.*"                 . buff-menu-read-only-face))
  "Buffer menu mode font-lock regexp."
  :type '(repeat
	  (choice (cons :tag "cons" regexp face)
		  (list :tag "list" regexp integer face)
		  regexp))
  :group 'Buffer-menu)

(defcustom buffer-menu-sort-order '("R" "M" "Buffer" "Size" "Mode" "File")
  "Buffer menu sort mode symbol."
  :type '(repeat (string))
  :group 'Buffer-menu)

(defcustom buffer-menu-direct-jump-table
  (concat "1234567890wertyuiopasdfghklzxcvbnm!\"#$%&'()=~|\\@"
          "WERTYUIOPASDFGHKLZXCVBNM+*<>?_")
  "`buffer-menu-direct-jump' Table Label."
  :type  'string
  :group 'Buffer-menu)

(defcustom buffer-menu-direct-jump-face '(:foreground "White" :background "DodgerBlue")
  "`buffer-menu-direct-jump' Label coulor."
  :type  '(choice
           (repeat sexp)
           (face))
  :group 'Buffer-menu)

(defcustom buffer-menu-direct-jump-function 'Buffer-menu-this-window
  "`buffer-menu-direct-jump' Execute function."
  :type  'function
  :group 'Buffer-menu)

(defcustom buffer-menu-direct-jump-scroll-keys
  '((?\C-v ?\   tab next down) . (?\M-v ?\S-\  backspace S-tab prior up))
  "`buffer-menu-direct-jump' Scroll keys.
CAR is `scroll-up', CDR is `scroll-down'."
  :type '(cons (repeat :tag "scroll-up" sexp)
               (repeat :tag "scroll-down" sexp))
  :group 'Buffer-menu)

(defvar buffer-menu-direct-jump-buffer)

(add-hook
 'Buffer-menu-mode-hook
 #'(lambda ()
     (set (make-local-variable 'font-lock-defaults)
	  (list buffer-menu-font-lock-keywords nil))))

(advice-add 'Buffer-menu--pretty-name :override
            '(lambda (name) (propertize name 'mouse-face 'highlight)))

(defun buffer-menu-sort-toggle (name)
  "Buffer-menu sort toggle."
  (interactive
   (list (or (car tabulated-list-sort-key) (car buffer-menu-sort-order))))
  (let ((column buffer-menu-sort-order))
    (when (cdr tabulated-list-sort-key)
      (setq name (or (cadr (member name column)) (car column))))
    (tabulated-list--sort-by-column-name name)
    (message "Sort by `%s%s'." name (if (cdr tabulated-list-sort-key) "(R)" ""))
    (revert-buffer)
    (recenter (line-number-at-pos))))

(defun buffer-menu-direct-jump-make-table-list ()
  (buffer-menu-direct-jump-string-to-char-list
   (substring
    buffer-menu-direct-jump-table
    0
    (min (length buffer-menu-direct-jump-table)
         (length tabulated-list-entries)))))

(defun buffer-menu-direct-jump-member-index-number (member list)
  "Returns the MEMBER index number from the LIST."
  (let ((n 1))
    (catch 'break
      (while list
        (if (string-equal member (car list))
            (throw 'break n)
          (setq n (1+ n) list (cdr list)))))
    (and list n)))

(defun buffer-menu-direct-jump-char-to-string (ch)
  (if (char-or-string-p ch) (char-to-string ch) ""))

(defun buffer-menu-direct-jump ()
  "Generate an overlay menu of one stroke key."
  (interactive)
  (let* ((table (buffer-menu-direct-jump-make-table-list))
         (ov (buffer-menu-direct-jump-label-print table))
         pos)
    (unwind-protect
        (progn
          (catch 'break
            (while (setq pos (read-event "JumpTo: "))
              (cond
               ((member pos (cdr buffer-menu-direct-jump-scroll-keys))
                (condition-case nil
                    (scroll-down)
                  (beginning-of-buffer (beep))))
               ((member pos (car buffer-menu-direct-jump-scroll-keys))
                (condition-case nil
                    (scroll-up)
                  (end-of-buffer (beep))))
               ((eq (car-safe pos) 'mouse-1)
                (setq pos
                      (string-to-char
                       (overlay-get
                        (car (overlays-at (posn-point (event-end pos)))) 'display)))
                (throw 'break pos))
               ((eq (car-safe pos) 'down-mouse-1)
                nil)
               (t
                (throw 'break pos)))))
          (setq pos
                (buffer-menu-direct-jump-member-index-number
                 (buffer-menu-direct-jump-char-to-string pos) table)))
      (buffer-menu-direct-jump-label-clear ov))
    (and pos (< (1- pos) (length tabulated-list-entries))
         (progn (goto-line pos)
                (setq buffer-menu-direct-jump-buffer (tabulated-list-get-id))
                (funcall buffer-menu-direct-jump-function)))))

(defun buffer-menu-direct-jump-label-print (table)
  "`buffer-menu-direct-jump' Print overlay."
  (let (ov)
    (save-excursion
      (goto-char (point-min))
      (while (and (not (eobp)) table)
        (setq ov (cons (make-overlay (point) (+ (length (car table)) (point))) ov))
        (overlay-put (car ov) 'display    (car table))
        (overlay-put (car ov) 'face       buffer-menu-direct-jump-face)
        (overlay-put (car ov) 'mouse-face 'highlight)
        (overlay-put (car ov) 'help-echo (format "Jump to `%s'" (tabulated-list-get-id)))
        (setq table (cdr table))
        (forward-line)))
    ov))

(defun buffer-menu-direct-jump-label-clear (ov)
  "`buffer-menu-direct-jump' Clear overlay."
  (dolist (a ov)
    (delete-overlay a)))

(defun buffer-menu-direct-jump-string-to-char-list (string)
  "Decompose the STRING into a list of characters."
  (cond
   ((string-equal "" string) nil)
   (t
    (cons (substring string 0 1)
	  (buffer-menu-direct-jump-string-to-char-list (substring string 1))))))

(defmacro buffer-menu-color-add-menu (event command)
  `(define-key-after
     (lookup-key (current-local-map) [menu-bar Buffer-menu-mode])
     ,event ,command 'by))

(defun buffer-menu-add-keys nil
  (local-set-key "j"             'buffer-menu-direct-jump)
  (local-set-key ","             'buffer-menu-sort-toggle)
  (local-set-key (kbd "<tab>")   'next-line)
  (local-set-key (kbd "<S-tab>") 'previous-line)
  (local-set-key (kbd "S-SPC")   'previous-line)

  (buffer-menu-color-add-menu
   [jump] '(menu-item
            "Direct Jump" buffer-menu-direct-jump
            :help "Direct buffer jump shortcut."))
  (buffer-menu-color-add-menu
   [sort] '(menu-item
            "Sort Toggle" buffer-menu-sort-toggle
            :help "Buffer-menu sort toggle."))
  (buffer-menu-color-add-menu
   [s999] menu-bar-separator))

(global-set-key [remap list-buffers] 'buffer-menu)
(add-hook 'buffer-menu-mode-hook 'buffer-menu-add-keys)

(provide 'buffer-menu-color)
;; fin.
