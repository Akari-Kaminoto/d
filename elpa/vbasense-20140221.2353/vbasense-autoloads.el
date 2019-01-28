;;; vbasense-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "vbasense" "vbasense.el" (0 0 0 0))
;;; Generated autoloads from vbasense.el

(autoload 'vbasense-load-library "vbasense" "\
Load library in `vbasense-cache-directory'.

These file are created by getTLI.bat from `vbasense-tli-files' if nesesarry.

\(fn)" t nil)

(autoload 'vbasense-remake-tli-cache "vbasense" "\
Remake library of TLIFILE.

TLIFILE is the path of TypeLibInfo file.

\(fn TLIFILE)" t nil)

(autoload 'vbasense-remake-progid-cache "vbasense" "\
Remake information of ProgID.

ProgID is a identifier of the library which is installed to Windows.

\(fn)" t nil)

(autoload 'vbasense-delete-all-cache "vbasense" "\
Delete `vbasense-cache-directory'.

\(fn)" t nil)

(autoload 'vbasense-load-file "vbasense" "\
Load user file.

\(fn FILE &key DELAY NOT-UPDATE-CACHE)" t nil)

(autoload 'vbasense-load-directory "vbasense" "\
Load user file in directory.

\(fn DIR)" t nil)

(autoload 'vbasense-load-recently "vbasense" "\
Load user file in recentf.

\(fn)" t nil)

(autoload 'vbasense-load-project "vbasense" "\
Load user file in project.

The project is detected by `anything-project'.

\(fn)" t nil)

(autoload 'vbasense-reload-current-buffer "vbasense" "\
Reload user file of current buffer.

\(fn)" t nil)

(autoload 'vbasense-popup-help "vbasense" "\
Popup help about something at point.

\(fn)" t nil)

(autoload 'vbasense-jump-to-definition "vbasense" "\
Jump to definition at point.

\(fn)" t nil)

(autoload 'vbasense-setup-current-buffer "vbasense" "\
Do setup for using vbasense in current buffer.

\(fn)" t nil)

(autoload 'vbasense-config-default "vbasense" "\
Do setting a recommemded configuration.

\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vbasense" '("vbasense-" "ac-source-vbasense-")))

;;;***

;;;### (autoloads nil nil ("vbasense-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; vbasense-autoloads.el ends here
