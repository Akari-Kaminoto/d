;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "../auto-highlight-symbol/auto-highlight-symbol"
;;;;;;  "../auto-highlight-symbol/auto-highlight-symbol.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from ../auto-highlight-symbol/auto-highlight-symbol.el

(defvar global-auto-highlight-symbol-mode nil "\
Non-nil if Global Auto-Highlight-Symbol mode is enabled.
See the `global-auto-highlight-symbol-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-auto-highlight-symbol-mode'.")

(custom-autoload 'global-auto-highlight-symbol-mode "../auto-highlight-symbol/auto-highlight-symbol" nil)

(autoload 'global-auto-highlight-symbol-mode "../auto-highlight-symbol/auto-highlight-symbol" "\
Toggle Auto-Highlight-Symbol mode in all buffers.
With prefix ARG, enable Global Auto-Highlight-Symbol mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Auto-Highlight-Symbol mode is enabled in all buffers where
`ahs-mode-maybe' would do it.
See `auto-highlight-symbol-mode' for more information on Auto-Highlight-Symbol mode.

\(fn &optional ARG)" t nil)

(autoload 'auto-highlight-symbol-mode "../auto-highlight-symbol/auto-highlight-symbol" "\
Toggle Auto Highlight Symbol Mode

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../auto-highlight-symbol/auto-highlight-symbol" '("auto-highlight-symbol-mode" "ahs-")))

;;;***

;;;### (autoloads nil "../neotree/neotree" "../neotree/neotree.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../neotree/neotree.el

(autoload 'neotree-find "../neotree/neotree" "\
Quick select node which specified PATH in NeoTree.
If path is nil and no buffer file name, then use DEFAULT-PATH,

\(fn &optional PATH DEFAULT-PATH)" t nil)

(autoload 'neotree-projectile-action "../neotree/neotree" "\
Integration with `Projectile'.

Usage:
    (setq projectile-switch-project-action 'neotree-projectile-action).

When running `projectile-switch-project' (C-c p p), `neotree' will change root
automatically.

\(fn)" t nil)

(autoload 'neotree-toggle "../neotree/neotree" "\
Toggle show the NeoTree window.

\(fn)" t nil)

(autoload 'neotree-show "../neotree/neotree" "\
Show the NeoTree window.

\(fn)" t nil)

(autoload 'neotree-hide "../neotree/neotree" "\
Close the NeoTree window.

\(fn)" t nil)

(autoload 'neotree-dir "../neotree/neotree" "\
Show the NeoTree window, and change root to PATH.

\(fn PATH)" t nil)

(defalias 'neotree 'neotree-show "\
Show the NeoTree window.")

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "../neotree/neotree" '("neo" "off-p")))

;;;***

;;;### (autoloads nil "c-eldoc/c-eldoc" "c-eldoc/c-eldoc.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from c-eldoc/c-eldoc.el

(autoload 'c-turn-on-eldoc-mode "c-eldoc/c-eldoc" "\
Enable c-eldoc-mode

\(fn)" t nil)

(autoload 'c-eldoc-print-current-symbol-info "c-eldoc/c-eldoc" "\
Returns documentation string for the current symbol.

\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "c-eldoc/c-eldoc" '("call-c-eldoc-cleanup" "c-eldoc-")))

;;;***

;;;### (autoloads nil "calendar+/calendar+" "calendar+/calendar+.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from calendar+/calendar+.el

(autoload 'calendar-mouse-3-menu "calendar+/calendar+" "\
Pop up menu for Mouse-3 in the calendar window.

\(fn EVENT)" t nil)

(defvar diary-entry-marker (if (not window-system) "+" (require 'faces) (make-face 'diary-face) (if (x-display-color-p) (set-face-foreground 'diary-face "Red") (copy-face 'bold 'diary-face)) 'diary-face) "\
*Used to mark dates that have diary entries.
Can be either a single-character string or a face.")

(custom-autoload 'diary-entry-marker "calendar+/calendar+" t)

(defvar calendar-region-marker (if (not window-system) "X" (require 'faces) (make-face 'calendar-region-face) (if (x-display-color-p) (set-face-background 'calendar-region-face "LightGray") (copy-face 'bold 'calendar-region-face)) 'calendar-region-face) "\
*Used to mark days in calendar region.
Can be either a single-character string or a face.")

(custom-autoload 'calendar-region-marker "calendar+/calendar+" t)

(defvar calendar-local-holiday-marker (if (not window-system) "*" (require 'faces) (make-face 'local-holiday-face) (if (x-display-color-p) (set-face-background 'local-holiday-face "Pink") (set-face-background 'local-holiday-face "Black") (set-face-foreground 'local-holiday-face "White")) 'local-holiday-face) "\
*Used to mark local holidays in the calendar.
Can be either a single-character string or a face.")

(custom-autoload 'calendar-local-holiday-marker "calendar+/calendar+" t)

(autoload 'show-calendar "calendar+/calendar+" "\
Show *Calendar* buffer, generating it if not already present.
If the calendar has already been generated, then, unlike the command
`calendar', this does not activate hooks that do things like display
your diary, appointments, holidays etc.

\(fn)" t nil)

(autoload 'calendar-basic-setup "calendar+/calendar+" "\
Display a three-month calendar in another window.
The three months appear side by side, with the current month in the
middle surrounded by the previous and next months.  The cursor is put
on today's date (unless prefix ARG---see below).

Optional prefix argument ARG controls what 3-month period is used---
that is, what month takes the place of the current month.  Whenever a
different month is used in place of the current, the cursor is placed
on the first day of that month.

If called with an explicit numerical ARG (e.g. `\\[universal-argument] 2'), the calendar
is displayed ARG months in the future (ARG > 0) or in the past (< 0).
If called with just `\\[universal-argument]', without an explicit number (so that ARG is
a consp), then `calendar' prompts for the month (and year) to use in
place of the current month.

This function is suitable for execution in your `~/.emacs' file.
Appropriate setting of the variable `view-diary-entries-initially'
causes the diary entries for today's date to be displayed in another
window.  The value of the variable `number-of-diary-entries' controls
the number of days of diary entries displayed upon initial display of
the calendar.

Once in the calendar window, future or past months can be moved into
view.  Arbitrary months can be displayed, or the calendar can be
scrolled forward or backward.

The cursor can be moved forward or backward by a day, a week, a month,
or a year.  All such commands take prefix arguments which, when
negative, cause movement in the opposite direction.  The digit keys
\(0-9) and the minus sign (-) are automatically prefixes.  The window
is redisplayed as necessary to show the desired date.

Diary entries can be marked (i.e. highlighted) on the calendar, or
shown in another window.

Use `\\[describe-mode]' for details of key bindings in the calendar window.

The Gregorian calendar is assumed.

After loading calendar, the hooks in `calendar-load-hook' are run.
This is the place to add key bindings to the `calendar-mode-map'.

After preparing the calendar window initially, the hooks given by
`initial-calendar-window-hook' are run.

The hooks given by variable `today-visible-calendar-hook' are run
every time the calendar window gets scrolled, provided today's date is
visible in the window.  If it is not visible, the hooks given by the
variable `today-invisible-calendar-hook' are run instead.  Thus, for
example, setting `today-visible-calendar-hook' to `calendar-star-date'
will cause today's date to be replaced by asterisks whenever it is in
the window.

\(fn &optional ARG)" t nil)

(autoload 'insert-diary-entry "calendar+/calendar+" "\
Insert a diary entry for the date indicated by point.
Prefix ARG makes the entry nonmarking.

\(fn ARG)" t nil)

(autoload 'calendar-count-days-region "calendar+/calendar+" "\
Count days between point and mark (inclusive).  Weekdays if prefix.
If WEEKDAYS-ONLY-P arg is non-nil, only weekdays (Mon-Fri) are counted.
Mark the days in the calendar region, provided it is entirely visible.
Return the number of days in the calendar region, in any case.

\(fn &optional WEEKDAYS-ONLY-P)" t nil)

(autoload 'calendar-count-weekdays-region "calendar+/calendar+" "\
Count the weekdays between the point and the mark (inclusive).
Mark the days in the calendar region, provided it is entirely visible.
Return the number of weekdays in the calendar region, in any case.

\(fn)" t nil)

(autoload 'calendar-mouse-drag-region "calendar+/calendar+" "\
Like `mouse-drag-region', and marks days if dragged or multi-clicked.
Double click marks the day under pointer.  Triple click marks the week.
Dragging marks the days dragged over.

\(fn EVENT)" t nil)

(autoload 'set-calendar-region-from-region "calendar+/calendar+" "\
Set the calendar region to include the days in the region.

\(fn)" t nil)

(autoload 'mark-local-holidays "calendar+/calendar+" "\
Mark local holidays in the calendar window.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "calendar+/calendar+" '("mark-visible-calendar-date" "monday-after-easter" "cal" "solar-sunrise-sunset-string" "generate-calendar-month" "new-diary-file-doc" "weekend-face")))

;;;***

;;;### (autoloads nil "el-get/el-get" "el-get/el-get.el" (0 0 0 0))
;;; Generated autoloads from el-get/el-get.el

(autoload 'el-get-version "el-get/el-get" "\
Message the current el-get version

\(fn)" t nil)

(autoload 'el-get-install "el-get/el-get" "\
Cause the named PACKAGE to be installed after all of its
dependencies (if any).

PACKAGE may be either a string or the corresponding symbol.

\(fn PACKAGE)" t nil)

(autoload 'el-get-update "el-get/el-get" "\
Update PACKAGE.

\(fn PACKAGE)" t nil)

(autoload 'el-get-update-all "el-get/el-get" "\
Performs update of all installed packages.

\(fn &optional NO-PROMPT)" t nil)

(autoload 'el-get-update-packages-of-type "el-get/el-get" "\
Update all installed packages of type TYPE.

\(fn TYPE)" t nil)

(autoload 'el-get-self-update "el-get/el-get" "\
Update el-get itself.  The standard recipe takes care of reloading the code.

\(fn)" t nil)

(autoload 'el-get-remove "el-get/el-get" "\
Remove any PACKAGE that is know to be installed or required.

\(fn PACKAGE)" t nil)

(autoload 'el-get-reinstall "el-get/el-get" "\
Remove PACKAGE and then install it again.

\(fn PACKAGE)" t nil)

(autoload 'el-get-cd "el-get/el-get" "\
Open dired in the package directory.

\(fn PACKAGE)" t nil)

(autoload 'el-get-make-recipes "el-get/el-get" "\
Loop over `el-get-sources' and write a recipe file for each
entry which is not a symbol and is not already a known recipe.

\(fn &optional DIR)" t nil)

(autoload 'el-get-checksum "el-get/el-get" "\
Compute the checksum of the given package, and put it in the kill-ring

\(fn PACKAGE)" t nil)

(autoload 'el-get-self-checksum "el-get/el-get" "\
Compute the checksum of the running version of el-get itself.

Also put the checksum in the kill-ring.

\(fn)" t nil)

(autoload 'el-get "el-get/el-get" "\
Ensure that packages have been downloaded once and init them as needed.

This will not update the sources by using `apt-get install' or
`git pull', but it will ensure that:

* the packages have been installed
* load-path is set so their elisp files can be found
* Info-directory-list is set so their info files can be found
* Autoloads have been prepared and evaluated for each package
* Any post-installation setup (e.g. `(require 'feature)') happens

When SYNC is nil (the default), all installations run
concurrently, in the background.

When SYNC is 'sync, each package will be installed synchronously,
and any error will stop it all.

Please note that the `el-get-init' part of `el-get' is always
done synchronously. There's `byte-compile' support though, and
the packages you use are welcome to use `autoload' too.

PACKAGES is expected to be a list of packages you want to install
or init.  When PACKAGES is omited (the default), the list of
already installed packages is considered.

\(fn &optional SYNC &rest PACKAGES)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-bundle" "el-get/el-get-bundle.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-bundle.el

(autoload 'el-get-bundle-el-get "el-get/el-get-bundle" "\


\(fn SRC SYNC)" nil nil)

(autoload 'el-get-bundle "el-get/el-get-bundle" "\
Install PACKAGE and run initialization FORM.

PACKAGE can be either a simple package name or a package name
with a modifier before the name to specify local recipe source
information:

* `<owner>/' : specifies a Github owner name
* `gist:<id>' : specifies a Gist ID
* `<type>:' : specifies a type of the package source

If `FEATURE in PACKAGE' form is used instead of PACKAGE, then
that FEATURE is `require'd after installing PACKAGE.  You can
also use `el-get-bundle!' macro if FEATURE and PACKAGE are the
same.  If you wish to `require' more than one feature, then use
`:features' property in FORM.

The initialization FORM may start with a property list that
describes a local recipe.  The property list may include the keyword
`:bundle-sync' with a value of either `t' or `nil' to request that
`el-get-bundle' invoke `el-get' synchronously (respectively asynchronously).
The keyword `:bundle-async' is the inverse of `:bundle-sync'.
\(Note that the request to run el-get synchronously may not be respected in all
circumstances: see the definition of `el-get-bundle-el-get' for details.)
The FORM after the property list is treated as initialization code,
which is actually an `:after' property of the local recipe.

A copy of the initialization code is stored in a directory
specified by `el-get-bundle-init-directory' and its byte-compiled
version is used if `el-get-bundle-byte-compile' is non-nil.

\(fn PACKAGE &rest FORM)" nil t)

(function-put 'el-get-bundle 'lisp-indent-function 'defun)

(autoload 'el-get-bundle! "el-get/el-get-bundle" "\
Install PACKAGE and run initialization form.
It is the same as `el-get-bundle' except that PACKAGE is explicitly
required.

\(fn PACKAGE &rest ARGS)" nil t)

(function-put 'el-get-bundle! 'lisp-indent-function 'defun)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-bundle" '("el-get-bundle-")))

;;;***

;;;### (autoloads nil "el-get/el-get-check" "el-get/el-get-check.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-check.el

(autoload 'el-get-check-recipe "el-get/el-get-check" "\
Check the format of the recipe.
Please run this command before sending a pull request.
Usage: M-x el-get-check-recipe RET

You can run this function from checker script like this:
    test/check-recipe.el PATH/TO/RECIPE.rcp

When used as a lisp function, FILE-OR-BUFFER must be a buffer
object or a file path.

\(fn FILE-OR-BUFFER)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-check" '("el-get-check-")))

;;;***

;;;### (autoloads nil "el-get/el-get-list-packages" "el-get/el-get-list-packages.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "el-get/el-get-list-packages" "\
Display a list of packages.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-list-packages" '("el-get-")))

;;;***

;;;### (autoloads nil "undohist/undohist" "undohist/undohist.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from undohist/undohist.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "undohist/undohist" '("undohist-" "make-undohist-file-name")))

;;;***

;;;### (autoloads nil "volatile-highlights/volatile-highlights" "volatile-highlights/volatile-highlights.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from volatile-highlights/volatile-highlights.el

(defvar volatile-highlights-mode nil "\
Non-nil if Volatile-Highlights mode is enabled.
See the `volatile-highlights-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `volatile-highlights-mode'.")

(custom-autoload 'volatile-highlights-mode "volatile-highlights/volatile-highlights" nil)

(autoload 'volatile-highlights-mode "volatile-highlights/volatile-highlights" "\
Minor mode for visual feedback on some operations.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "volatile-highlights/volatile-highlights" '("vhl/" "Vhl/highlight-zero-width-ranges")))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
