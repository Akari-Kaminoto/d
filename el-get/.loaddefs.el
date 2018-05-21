;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ac-php-core-eldoc-setup) "ac-php/ac-php-core"
;;;;;;  "ac-php/ac-php-core.el" (23265 37906 166581 0))
;;; Generated autoloads from ac-php/ac-php-core.el

(autoload 'ac-php-core-eldoc-setup "ac-php/ac-php-core" "\
Set up eldoc function and enable eldoc-mode.

\(fn)" t nil)

;;;***

;;;### (autoloads (company-ac-php-backend) "ac-php/company-php" "ac-php/company-php.el"
;;;;;;  (23265 37906 170581 0))
;;; Generated autoloads from ac-php/company-php.el

(autoload 'company-ac-php-backend "ac-php/company-php" "\


\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads (helm-ac-php-apropos-at-point helm-ac-php-apropos)
;;;;;;  "ac-php/helm-ac-php-apropros" "ac-php/helm-ac-php-apropros.el"
;;;;;;  (23265 37906 170581 0))
;;; Generated autoloads from ac-php/helm-ac-php-apropros.el

(autoload 'helm-ac-php-apropos "ac-php/helm-ac-php-apropros" "\


\(fn)" t nil)

(autoload 'helm-ac-php-apropos-at-point "ac-php/helm-ac-php-apropros" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (ace-window-display-mode ace-window ace-delete-other-windows
;;;;;;  ace-swap-window ace-delete-window ace-select-window) "ace-window/ace-window"
;;;;;;  "ace-window/ace-window.el" (23298 29437 95521 68000))
;;; Generated autoloads from ace-window/ace-window.el

(autoload 'ace-select-window "ace-window/ace-window" "\
Ace select window.

\(fn)" t nil)

(autoload 'ace-delete-window "ace-window/ace-window" "\
Ace delete window.

\(fn)" t nil)

(autoload 'ace-swap-window "ace-window/ace-window" "\
Ace swap window.

\(fn)" t nil)

(autoload 'ace-delete-other-windows "ace-window/ace-window" "\
Ace delete other windows.

\(fn)" t nil)

(autoload 'ace-window "ace-window/ace-window" "\
Select a window.
Perform an action based on ARG described below.

By default, behaves like extended `other-window'.

Prefixed with one \\[universal-argument], does a swap between the
selected window and the current window, so that the selected
buffer moves to current window (and current buffer moves to
selected window).

Prefixed with two \\[universal-argument]'s, deletes the selected
window.

\(fn ARG)" t nil)

(defvar ace-window-display-mode nil "\
Non-nil if Ace-Window-Display mode is enabled.
See the command `ace-window-display-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `ace-window-display-mode'.")

(custom-autoload 'ace-window-display-mode "ace-window/ace-window" nil)

(autoload 'ace-window-display-mode "ace-window/ace-window" "\
Minor mode for showing the ace window key in the mode line.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (global-auto-complete-mode auto-complete-mode auto-complete)
;;;;;;  "auto-complete/auto-complete" "auto-complete/auto-complete.el"
;;;;;;  (23265 37900 546581 0))
;;; Generated autoloads from auto-complete/auto-complete.el

(autoload 'auto-complete "auto-complete/auto-complete" "\
Start auto-completion at current point.

\(fn &optional SOURCES)" t nil)

(autoload 'auto-complete-mode "auto-complete/auto-complete" "\
AutoComplete mode

\(fn &optional ARG)" t nil)

(defvar global-auto-complete-mode nil "\
Non-nil if Global-Auto-Complete mode is enabled.
See the command `global-auto-complete-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-auto-complete-mode'.")

(custom-autoload 'global-auto-complete-mode "auto-complete/auto-complete" nil)

(autoload 'global-auto-complete-mode "auto-complete/auto-complete" "\
Toggle Auto-Complete mode in all buffers.
With prefix ARG, enable Global-Auto-Complete mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Auto-Complete mode is enabled in all buffers where
`auto-complete-mode-maybe' would do it.
See `auto-complete-mode' for more information on Auto-Complete mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (ac-config-default) "auto-complete/auto-complete-config"
;;;;;;  "auto-complete/auto-complete-config.el" (23265 37900 546581
;;;;;;  0))
;;; Generated autoloads from auto-complete/auto-complete-config.el

(autoload 'ac-config-default "auto-complete/auto-complete-config" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads (avy-goto-char-timer avy-setup-default avy-kill-ring-save-whole-line
;;;;;;  avy-kill-whole-line avy-kill-ring-save-region avy-kill-region
;;;;;;  avy-move-region avy-copy-region avy-move-line avy-copy-line
;;;;;;  avy-goto-line-below avy-goto-line-above avy-goto-line avy-goto-word-or-subword-1
;;;;;;  avy-goto-subword-1 avy-goto-subword-0 avy-goto-symbol-1-below
;;;;;;  avy-goto-symbol-1-above avy-goto-symbol-1 avy-goto-word-1-below
;;;;;;  avy-goto-word-1-above avy-goto-word-1 avy-goto-word-0 avy-isearch
;;;;;;  avy-goto-char-2-below avy-goto-char-2-above avy-goto-char-2
;;;;;;  avy-goto-char-in-line avy-goto-char) "avy/avy" "avy/avy.el"
;;;;;;  (23298 29433 419521 68000))
;;; Generated autoloads from avy/avy.el

(autoload 'avy-goto-char "avy/avy" "\
Jump to the currently visible CHAR.
The window scope is determined by `avy-all-windows' (ARG negates it).

\(fn CHAR &optional ARG)" t nil)

(autoload 'avy-goto-char-in-line "avy/avy" "\
Jump to the currently visible CHAR in the current line.

\(fn CHAR)" t nil)

(autoload 'avy-goto-char-2 "avy/avy" "\
Jump to the currently visible CHAR1 followed by CHAR2.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.
BEG and END narrow the scope where candidates are searched.

\(fn CHAR1 CHAR2 &optional ARG BEG END)" t nil)

(autoload 'avy-goto-char-2-above "avy/avy" "\
Jump to the currently visible CHAR1 followed by CHAR2.
This is a scoped version of `avy-goto-char-2', where the scope is
the visible part of the current buffer up to point.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.

\(fn CHAR1 CHAR2 &optional ARG)" t nil)

(autoload 'avy-goto-char-2-below "avy/avy" "\
Jump to the currently visible CHAR1 followed by CHAR2.
This is a scoped version of `avy-goto-char-2', where the scope is
the visible part of the current buffer following point.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.

\(fn CHAR1 CHAR2 &optional ARG)" t nil)

(autoload 'avy-isearch "avy/avy" "\
Jump to one of the current isearch candidates.

\(fn)" t nil)

(autoload 'avy-goto-word-0 "avy/avy" "\
Jump to a word start.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.
BEG and END narrow the scope where candidates are searched.

\(fn ARG &optional BEG END)" t nil)

(autoload 'avy-goto-word-1 "avy/avy" "\
Jump to the currently visible CHAR at a word start.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.
BEG and END narrow the scope where candidates are searched.
When SYMBOL is non-nil, jump to symbol start instead of word start.

\(fn CHAR &optional ARG BEG END SYMBOL)" t nil)

(autoload 'avy-goto-word-1-above "avy/avy" "\
Jump to the currently visible CHAR at a word start.
This is a scoped version of `avy-goto-word-1', where the scope is
the visible part of the current buffer up to point.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.

\(fn CHAR &optional ARG)" t nil)

(autoload 'avy-goto-word-1-below "avy/avy" "\
Jump to the currently visible CHAR at a word start.
This is a scoped version of `avy-goto-word-1', where the scope is
the visible part of the current buffer following point.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.

\(fn CHAR &optional ARG)" t nil)

(autoload 'avy-goto-symbol-1 "avy/avy" "\
Jump to the currently visible CHAR at a symbol start.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.

\(fn CHAR &optional ARG)" t nil)

(autoload 'avy-goto-symbol-1-above "avy/avy" "\
Jump to the currently visible CHAR at a symbol start.
This is a scoped version of `avy-goto-symbol-1', where the scope is
the visible part of the current buffer up to point.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.

\(fn CHAR &optional ARG)" t nil)

(autoload 'avy-goto-symbol-1-below "avy/avy" "\
Jump to the currently visible CHAR at a symbol start.
This is a scoped version of `avy-goto-symbol-1', where the scope is
the visible part of the current buffer following point.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.

\(fn CHAR &optional ARG)" t nil)

(autoload 'avy-goto-subword-0 "avy/avy" "\
Jump to a word or subword start.

The window scope is determined by `avy-all-windows' (ARG negates it).
BEG and END narrow the scope where candidates are searched.

When PREDICATE is non-nil it's a function of zero parameters that
should return true.

\(fn &optional ARG PREDICATE BEG END)" t nil)

(autoload 'avy-goto-subword-1 "avy/avy" "\
Jump to the currently visible CHAR at a subword start.
The window scope is determined by `avy-all-windows' (ARG negates it).
The case of CHAR is ignored.

\(fn CHAR &optional ARG)" t nil)

(autoload 'avy-goto-word-or-subword-1 "avy/avy" "\
Forward to `avy-goto-subword-1' or `avy-goto-word-1'.
Which one depends on variable `subword-mode'.

\(fn)" t nil)

(autoload 'avy-goto-line "avy/avy" "\
Jump to a line start in current buffer.

When ARG is 1, jump to lines currently visible, with the option
to cancel to `goto-line' by entering a number.

When ARG is 4, negate the window scope determined by
`avy-all-windows'.

Otherwise, forward to `goto-line' with ARG.

\(fn &optional ARG)" t nil)

(autoload 'avy-goto-line-above "avy/avy" "\
Goto visible line above the cursor.

\(fn)" t nil)

(autoload 'avy-goto-line-below "avy/avy" "\
Goto visible line below the cursor.

\(fn)" t nil)

(autoload 'avy-copy-line "avy/avy" "\
Copy a selected line above the current line.
ARG lines can be used.

\(fn ARG)" t nil)

(autoload 'avy-move-line "avy/avy" "\
Move a selected line above the current line.
ARG lines can be used.

\(fn ARG)" t nil)

(autoload 'avy-copy-region "avy/avy" "\
Select two lines and copy the text between them to point.

The window scope is determined by `avy-all-windows' or
`avy-all-windows-alt' when ARG is non-nil.

\(fn ARG)" t nil)

(autoload 'avy-move-region "avy/avy" "\
Select two lines and move the text between them above the current line.

\(fn)" t nil)

(autoload 'avy-kill-region "avy/avy" "\
Select two lines and kill the region between them.

The window scope is determined by `avy-all-windows' or
`avy-all-windows-alt' when ARG is non-nil.

\(fn ARG)" t nil)

(autoload 'avy-kill-ring-save-region "avy/avy" "\
Select two lines and save the region between them to the kill ring.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.

\(fn ARG)" t nil)

(autoload 'avy-kill-whole-line "avy/avy" "\
Select line and kill the whole selected line.

With a numerical prefix ARG, kill ARG line(s) starting from the
selected line.  If ARG is negative, kill backward.

If ARG is zero, kill the selected line but exclude the trailing
newline.

\\[universal-argument] 3 \\[avy-kil-whole-line] kill three lines
starting from the selected line.  \\[universal-argument] -3

\\[avy-kill-whole-line] kill three lines backward including the
selected line.

\(fn ARG)" t nil)

(autoload 'avy-kill-ring-save-whole-line "avy/avy" "\
Select line and save the whole selected line as if killed, but don’t kill it.

This command is similar to `avy-kill-whole-line', except that it
saves the line(s) as if killed, but does not kill it(them).

With a numerical prefix ARG, kill ARG line(s) starting from the
selected line.  If ARG is negative, kill backward.

If ARG is zero, kill the selected line but exclude the trailing
newline.

\(fn ARG)" t nil)

(autoload 'avy-setup-default "avy/avy" "\
Setup the default shortcuts.

\(fn)" nil nil)

(autoload 'avy-goto-char-timer "avy/avy" "\
Read one or many consecutive chars and jump to the first one.
The window scope is determined by `avy-all-windows' (ARG negates it).

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (mark-local-holidays set-calendar-region-from-region
;;;;;;  calendar-mouse-drag-region calendar-count-weekdays-region
;;;;;;  calendar-count-days-region insert-diary-entry calendar-basic-setup
;;;;;;  show-calendar calendar-local-holiday-marker calendar-region-marker
;;;;;;  diary-entry-marker calendar-mouse-3-menu) "calendar+/calendar+"
;;;;;;  "calendar+/calendar+.el" (23298 29538 823521 68000))
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

;;;***

;;;### (autoloads (el-get el-get-self-checksum el-get-checksum el-get-make-recipes
;;;;;;  el-get-cd el-get-reinstall el-get-remove el-get-self-update
;;;;;;  el-get-update-packages-of-type el-get-update-all el-get-update
;;;;;;  el-get-install el-get-version) "el-get/el-get" "el-get/el-get.el"
;;;;;;  (23265 37695 782581 0))
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

;;;***

;;;### (autoloads (el-get-bundle! el-get-bundle el-get-bundle-el-get)
;;;;;;  "el-get/el-get-bundle" "el-get/el-get-bundle.el" (23265 37695
;;;;;;  778581 0))
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

(put 'el-get-bundle 'lisp-indent-function 'defun)

(autoload 'el-get-bundle! "el-get/el-get-bundle" "\
Install PACKAGE and run initialization form.
It is the same as `el-get-bundle' except that PACKAGE is explicitly
required.

\(fn PACKAGE &rest ARGS)" nil t)

(put 'el-get-bundle! 'lisp-indent-function 'defun)

;;;***

;;;### (autoloads (el-get-check-recipe) "el-get/el-get-check" "el-get/el-get-check.el"
;;;;;;  (23265 37695 778581 0))
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

;;;***

;;;### (autoloads (el-get-list-packages) "el-get/el-get-list-packages"
;;;;;;  "el-get/el-get-list-packages.el" (23265 37695 782581 0))
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "el-get/el-get-list-packages" "\
Display a list of packages.

\(fn)" t nil)

;;;***

;;;### (autoloads (php-current-namespace php-current-class php-mode
;;;;;;  php-faces php-extra-constants php) "php-mode/php-mode" "php-mode/php-mode.el"
;;;;;;  (23265 37888 782581 0))
;;; Generated autoloads from php-mode/php-mode.el

(let ((loads (get 'php 'custom-loads))) (if (member '"php-mode/php-mode" loads) nil (put 'php 'custom-loads (cons '"php-mode/php-mode" loads))))

(defvar php-extra-constants 'nil "\
A list of additional strings to treat as PHP constants.")

(custom-autoload 'php-extra-constants "php-mode/php-mode" nil)

(if (version< emacs-version "24.4") (dolist (i '("php" "php5" "php7")) (add-to-list 'interpreter-mode-alist (cons i 'php-mode))) (add-to-list 'interpreter-mode-alist (cons "php\\(?:-?[3457]\\(?:\\.[0-9]+\\)*\\)?" 'php-mode)))

(define-obsolete-variable-alias 'php-available-project-root-files 'php-project-available-root-files "1.19.0")

(let ((loads (get 'php-faces 'custom-loads))) (if (member '"php-mode/php-mode" loads) nil (put 'php-faces 'custom-loads (cons '"php-mode/php-mode" loads))))

(autoload 'php-mode "php-mode/php-mode" "\
Major mode for editing PHP code.

\\{php-mode-map}

\(fn)" t nil)

(autoload 'php-current-class "php-mode/php-mode" "\
Insert current class name if cursor in class context.

\(fn)" t nil)

(autoload 'php-current-namespace "php-mode/php-mode" "\
Insert current namespace if cursor in namespace context.

\(fn)" t nil)

(add-to-list 'auto-mode-alist (cons (eval-when-compile (rx (or (: "." (or (: "php" (32 (in "s345t"))) "amk" "phtml")) (: "/" (or "Amkfile" ".php_cs" ".php_cs.dist"))) string-end)) 'php-mode) t)

;;;***

;;;### (autoloads (php-project-get-root-dir php-project-get-bootstrap-scripts)
;;;;;;  "php-mode/php-project" "php-mode/php-project.el" (23265 37888
;;;;;;  782581 0))
;;; Generated autoloads from php-mode/php-project.el

(defvar php-project-root 'auto "\
Method of searching for the top level directory.

`auto' (default)
      Try to search file in order of `php-project-available-root-files'.

SYMBOL
      Key of `php-project-available-root-files'.

STRING
      A file/directory name of top level marker.
      If the string is an actual directory path, it is set as the absolute path
      of the root directory, not the marker.")

(make-variable-buffer-local 'php-project-root)

(put 'php-project-root 'safe-local-variable #'(lambda (v) (or (stringp v) (assq v php-project-available-root-files))))

(defvar php-project-bootstrap-scripts nil "\
List of path to bootstrap php script file.

The ideal bootstrap file is silent, it only includes dependent files,
defines constants, and sets the class loaders.")

(make-variable-buffer-local 'php-project-bootstrap-scripts)

(put 'php-project-bootstrap-scripts 'safe-local-variable #'php-project--eval-bootstrap-scripts)

(defvar php-project-php-executable nil "\
Path to php executable file.")

(make-variable-buffer-local 'php-project-php-executable)

(put 'php-project-php-executable 'safe-local-variable #'(lambda (v) (and (stringp v) (file-executable-p v))))

(defvar php-project-phan-executable nil "\
Path to phan executable file.")

(make-variable-buffer-local 'php-project-phan-executable)

(put 'php-project-phan-executable 'safe-local-variable #'php-project--eval-bootstrap-scripts)

(defvar php-project-coding-style nil "\
Symbol value of the coding style of the project that PHP major mode refers to.

Typically it is `pear', `drupal', `wordpress', `symfony2' and `psr2'.")

(make-variable-buffer-local 'php-project-coding-style)

(put 'php-project-coding-style 'safe-local-variable #'symbolp)

(autoload 'php-project-get-bootstrap-scripts "php-mode/php-project" "\
Return list of bootstrap script.

\(fn)" nil nil)

(autoload 'php-project-get-root-dir "php-mode/php-project" "\
Return path to current PHP project.

\(fn)" nil nil)

;;;***

;;;### (autoloads (rainbow-delimiters-mode-disable rainbow-delimiters-mode-enable
;;;;;;  rainbow-delimiters-mode) "rainbow-delimiters/rainbow-delimiters"
;;;;;;  "rainbow-delimiters/rainbow-delimiters.el" (23298 29863 855521
;;;;;;  68000))
;;; Generated autoloads from rainbow-delimiters/rainbow-delimiters.el

(autoload 'rainbow-delimiters-mode "rainbow-delimiters/rainbow-delimiters" "\
Highlight nested parentheses, brackets, and braces according to their depth.

\(fn &optional ARG)" t nil)

(autoload 'rainbow-delimiters-mode-enable "rainbow-delimiters/rainbow-delimiters" "\
Enable `rainbow-delimiters-mode'.

\(fn)" nil nil)

(autoload 'rainbow-delimiters-mode-disable "rainbow-delimiters/rainbow-delimiters" "\
Disable `rainbow-delimiters-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (cscope-setup cscope-minor-mode) "xcscope/xcscope"
;;;;;;  "xcscope/xcscope.el" (23265 37893 766581 0))
;;; Generated autoloads from xcscope/xcscope.el

(autoload 'cscope-minor-mode "xcscope/xcscope" "\
This cscope minor mode maps cscope keybindings to make cscope
functions more accessible.

Key bindings:
\\{cscope-minor-mode-keymap}

\(fn &optional ARG)" t nil)

(autoload 'cscope-setup "xcscope/xcscope" "\
Automatically turns on cscope-minor-mode when editing C and
C++ sources

\(fn)" t nil)

;;;***

;;;### (autoloads (yas-global-mode yas-minor-mode) "yasnippet/yasnippet"
;;;;;;  "yasnippet/yasnippet.el" (23265 37893 570581 0))
;;; Generated autoloads from yasnippet/yasnippet.el

(autoload 'yas-minor-mode "yasnippet/yasnippet" "\
Toggle YASnippet mode.

When YASnippet mode is enabled, `yas-expand', normally bound to
the TAB key, expands snippets of code depending on the major
mode.

With no argument, this command toggles the mode.
positive prefix argument turns on the mode.
Negative prefix argument turns off the mode.

Key bindings:
\\{yas-minor-mode-map}

\(fn &optional ARG)" t nil)

(defvar yas-global-mode nil "\
Non-nil if Yas-Global mode is enabled.
See the command `yas-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `yas-global-mode'.")

(custom-autoload 'yas-global-mode "yasnippet/yasnippet" nil)

(autoload 'yas-global-mode "yasnippet/yasnippet" "\
Toggle Yas minor mode in all buffers.
With prefix ARG, enable Yas-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Yas minor mode is enabled in all buffers where
`yas-minor-mode-on' would do it.
See `yas-minor-mode' for more information on Yas minor mode.

\(fn &optional ARG)" t nil)
(autoload 'snippet-mode "yasnippet" "A mode for editing yasnippets" t nil)

;;;***

;;;### (autoloads nil nil ("ac-anything/ac-anything.el" "ac-php/ac-php-comm-tags-data.el"
;;;;;;  "ac-php/ac-php.el" "auto-complete/auto-complete-pkg.el" "avy/avy-test.el"
;;;;;;  "dash/dash-functional.el" "dash/dash.el" "el-get/el-get-autoloading.el"
;;;;;;  "el-get/el-get-build.el" "el-get/el-get-byte-compile.el"
;;;;;;  "el-get/el-get-core.el" "el-get/el-get-custom.el" "el-get/el-get-dependencies.el"
;;;;;;  "el-get/el-get-install.el" "el-get/el-get-methods.el" "el-get/el-get-notify.el"
;;;;;;  "el-get/el-get-recipes.el" "el-get/el-get-status.el" "f/f.el"
;;;;;;  "fuzzy/fuzzy.el" "php-mode/php-mode-test.el" "popup/popup.el"
;;;;;;  "rainbow-delimiters/rainbow-delimiters-test.el" "s/s.el"
;;;;;;  "yasnippet/yasnippet-debug.el" "yasnippet/yasnippet-tests.el")
;;;;;;  (23298 29864 393722 778000))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
