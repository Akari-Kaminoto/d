;;; font-lock-studio-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "font-lock-studio" "font-lock-studio.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from font-lock-studio.el

(autoload 'font-lock-studio "font-lock-studio" "\
Interactively debug the font-lock keywords of the current buffer.

With \\[universal-argument] prefix, create a new, unique, interface buffer.

\(fn &optional ARG)" t nil)

(autoload 'font-lock-studio-region "font-lock-studio" "\
Interactively debug the font-lock keywords in the region.

With \\[universal-argument] prefix, create a new, unique, interface buffer.

\(fn BEG END &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "font-lock-studio" '("font-lock-studio-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; font-lock-studio-autoloads.el ends here
