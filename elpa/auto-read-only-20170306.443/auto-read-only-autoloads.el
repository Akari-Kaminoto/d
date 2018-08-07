;;; auto-read-only-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "auto-read-only" "auto-read-only.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from auto-read-only.el

(defvar auto-read-only-mode nil "\
Non-nil if Auto-Read-Only mode is enabled.
See the `auto-read-only-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `auto-read-only-mode'.")

(custom-autoload 'auto-read-only-mode "auto-read-only" nil)

(autoload 'auto-read-only-mode "auto-read-only" "\
Minor mode for appply auto-read-only.

\(fn &optional ARG)" t nil)

(autoload 'auto-read-only "auto-read-only" "\
Apply read-only mode.

\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "auto-read-only" '("auto-read-only-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; auto-read-only-autoloads.el ends here
