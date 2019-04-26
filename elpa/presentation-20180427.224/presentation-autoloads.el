;;; presentation-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "presentation" "presentation.el" (0 0 0 0))
;;; Generated autoloads from presentation.el

(defvar presentation-mode nil "\
Non-nil if Presentation mode is enabled.
See the `presentation-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `presentation-mode'.")

(custom-autoload 'presentation-mode "presentation" nil)

(autoload 'presentation-mode "presentation" "\
Toggle Presentation mode ON or OFF.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "presentation" '("presentation-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; presentation-autoloads.el ends here
