;;; emoji-fontset-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "emoji-fontset" "emoji-fontset.el" (0 0 0 0))
;;; Generated autoloads from emoji-fontset.el

(define-obsolete-function-alias 'emoji-fontset/turn-on 'emoji-fontset-enable "0.1.0")

(autoload 'emoji-fontset-enable "emoji-fontset" "\
Be enable Emoji Font face by `FONT-FAMILY'.

\(fn &optional FONT-FAMILY)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "emoji-fontset" '("emoji-fontset-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; emoji-fontset-autoloads.el ends here
