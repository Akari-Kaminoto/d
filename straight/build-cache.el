
:shash

gnu/bsd

"26.1"

#s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8125 data ("straight" ("2018-07-09 17:47:46+0900" ("emacs") (:type git :host github :repo "raxod502/straight.el" :files ("straight*.el") :branch "master" :package "straight" :local-repo "straight.el")) "use-package" ("2018-07-09 17:46:25+0900" ("emacs" "bind-key") (:type git :files (:defaults (:exclude "bind-key.el" "bind-chord.el" "use-package-chords.el" "use-package-ensure-system-package.el")) :host github :repo "jwiegley/use-package" :package "use-package" :local-repo "use-package")) "bind-key" ("2018-07-09 17:46:23+0900" nil (:files ("bind-key.el") :package "bind-key" :local-repo "use-package" :type git :repo "jwiegley/use-package" :host github)) "rainbow-delimiters" ("2018-07-09 17:46:28+0900" nil (:type git :host github :repo "Fanael/rainbow-delimiters" :package "rainbow-delimiters" :local-repo "rainbow-delimiters")) "neotree" ("2018-07-09 17:46:29+0900" ("cl-lib") (:type git :files (:defaults "icons") :host github :repo "jaypei/emacs-neotree" :package "neotree" :local-repo "emacs-neotree")) "cl-lib" ("2018-07-09 17:46:29+0900" nil (:files ("packages/cl-lib/*.el") :local-repo "elpa" :package "cl-lib" :type git :repo "https://git.savannah.gnu.org/git/emacs/elpa.git")) "volatile-highlights" ("2018-07-09 17:46:29+0900" nil (:type git :host github :repo "k-talo/volatile-highlights.el" :package "volatile-highlights" :local-repo "volatile-highlights.el")) "smooth-scroll" ("2018-07-09 17:46:29+0900" nil (:type git :host github :repo "k-talo/smooth-scroll.el" :package "smooth-scroll" :local-repo "smooth-scroll.el")) "hlinum" ("2018-07-09 17:46:29+0900" ("cl-lib") (:type git :host github :repo "tom-tan/hlinum-mode" :package "hlinum" :local-repo "hlinum-mode")) "undohist" ("2018-07-09 17:46:29+0900" ("cl-lib") (:type git :host github :repo "m2ym/undohist-el" :package "undohist" :local-repo "undohist-el")) "anzu" ("2018-07-09 17:46:30+0900" ("emacs") (:type git :host github :repo "syohex/emacs-anzu" :package "anzu" :local-repo "emacs-anzu")) "shell-pop" ("2018-07-09 17:46:30+0900" ("emacs" "cl-lib") (:type git :host github :repo "kyagi/shell-pop-el" :package "shell-pop" :local-repo "shell-pop-el")) "web-mode" ("2018-07-09 17:46:30+0900" ("emacs") (:type git :host github :repo "fxbois/web-mode" :package "web-mode" :local-repo "web-mode")) "beacon" ("2018-07-09 17:46:31+0900" ("seq") (:type git :host github :repo "Malabarba/beacon" :package "beacon" :local-repo "beacon")) "seq" ("2018-07-09 17:46:31+0900" nil (:files ("packages/seq/*.el") :local-repo "elpa" :package "seq" :type git :repo "https://git.savannah.gnu.org/git/emacs/elpa.git")) "mozc" ("2018-07-09 17:46:31+0900" nil (:type git :files ("src/unix/emacs/mozc.el") :host github :repo "google/mozc" :package "mozc" :local-repo "mozc")) "helm" ("2018-07-09 17:48:00+0900" ("emacs" "async" "popup" "helm-core") (:type git :files ("*.el" "emacs-helm.sh" (:exclude "helm.el" "helm-lib.el" "helm-source.el" "helm-multi-match.el" "helm-core-pkg.el")) :host github :repo "emacs-helm/helm" :package "helm" :local-repo "helm")) "async" ("2018-07-09 17:47:51+0900" nil (:type git :host github :repo "jwiegley/emacs-async" :package "async" :local-repo "emacs-async")) "popup" ("2018-07-09 17:47:51+0900" ("cl-lib") (:type git :files ("popup.el") :host github :repo "auto-complete/popup-el" :package "popup" :local-repo "popup-el")) "helm-core" ("2018-07-09 17:47:52+0900" ("emacs" "async") (:files ("helm-core-pkg.el" "helm.el" "helm-lib.el" "helm-source.el" "helm-multi-match.el") :package "helm-core" :local-repo "helm" :type git :repo "emacs-helm/helm" :host github)) "flycheck" ("2018-07-09 17:48:03+0900" ("dash" "pkg-info" "let-alist" "seq" "emacs") (:type git :host github :repo "flycheck/flycheck" :package "flycheck" :local-repo "flycheck")) "dash" ("2018-07-09 17:48:01+0900" nil (:type git :files ("dash.el") :host github :repo "magnars/dash.el" :package "dash" :local-repo "dash.el")) "pkg-info" ("2018-07-09 17:48:02+0900" ("epl") (:type git :host github :repo "lunaryorn/pkg-info.el" :package "pkg-info" :local-repo "pkg-info.el")) "epl" ("2018-07-09 17:48:02+0900" ("cl-lib") (:type git :host github :repo "cask/epl" :package "epl" :local-repo "epl")) "ace-isearch" ("2018-07-09 17:48:03+0900" ("emacs") (:type git :host github :repo "tam17aki/ace-isearch" :package "ace-isearch" :local-repo "ace-isearch")) "dired-du" ("2018-07-09 17:48:04+0900" ("emacs" "cl-lib") (:files ("packages/dired-du/*.el") :local-repo "elpa" :package "dired-du" :type git :repo "https://git.savannah.gnu.org/git/emacs/elpa.git"))))

#s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8125 data ("straight" ((straight straight-compat straight-x straight-autoloads) (autoload (quote straight-get-recipe) "straight" "Interactively select a recipe from one of the recipe repositories.
All recipe repositories in `straight-recipe-repositories' will
first be cloned. After the recipe is selected, it will be copied
to the kill ring. With a prefix argument, first prompt for a
recipe repository to search. Only that repository will be
cloned.

From Lisp code, SOURCES should be a subset of the symbols in
`straight-recipe-repositories'. Only those recipe repositories
are cloned and searched. If it is nil or omitted, then the value
of `straight-recipe-repositories' is used. If SOURCES is the
symbol `interactive', then the user is prompted to select a
recipe repository, and a list containing that recipe repository
is used for the value of SOURCES. ACTION may be `copy' (copy
recipe to the kill ring), `insert' (insert at point), or nil (no
action, just return it).

(fn &optional SOURCES ACTION)" t nil) (autoload (quote straight-use-package) "straight" "Register, clone, build, and activate a package and its dependencies.
This is the main entry point to the functionality of straight.el.

MELPA-STYLE-RECIPE is either a symbol naming a package, or a list
whose car is a symbol naming a package and whose cdr is a
property list containing e.g. `:type', `:local-repo', `:files',
and VC backend specific keywords.

First, the package recipe is registered with straight.el. If
NO-CLONE is a function, then it is called with two arguments: the
package name as a string, and a boolean value indicating whether
the local repository for the package is available. In that case,
the return value of the function is used as the value of NO-CLONE
instead. In any case, if NO-CLONE is non-nil, then processing
stops here.

Otherwise, the repository is cloned, if it is missing. If
NO-BUILD is a function, then it is called with one argument: the
package name as a string. In that case, the return value of the
function is used as the value of NO-BUILD instead. In any case,
if NO-BUILD is non-nil, then processing halts here. Otherwise,
the package is built and activated. Note that if the package
recipe has a non-nil `:no-build' entry, then NO-BUILD is ignored
and processing always stops before building and activation
occurs.

CAUSE is a string explaining the reason why
`straight-use-package' has been called. It is for internal use
only, and is used to construct progress messages. INTERACTIVE is
non-nil if the function has been called interactively. It is for
internal use only, and is used to determine whether to show a
hint about how to install the package permanently.

Return non-nil if package was actually installed, and nil
otherwise (this can only happen if NO-CLONE is non-nil).

(fn MELPA-STYLE-RECIPE &optional NO-CLONE NO-BUILD CAUSE INTERACTIVE)" t nil) (autoload (quote straight-register-package) "straight" "Register a package without cloning, building, or activating it.
This function is equivalent to calling `straight-use-package'
with a non-nil argument for NO-CLONE. It is provided for
convenience. MELPA-STYLE-RECIPE is as for
`straight-use-package'.

(fn MELPA-STYLE-RECIPE)" nil nil) (autoload (quote straight-use-package-no-build) "straight" "Register and clone a package without building it.
This function is equivalent to calling `straight-use-package'
with nil for NO-CLONE but a non-nil argument for NO-BUILD. It is
provided for convenience. MELPA-STYLE-RECIPE is as for
`straight-use-package'.

(fn MELPA-STYLE-RECIPE)" nil nil) (autoload (quote straight-use-package-lazy) "straight" "Register, build, and activate a package if it is already cloned.
This function is equivalent to calling `straight-use-package'
with symbol `lazy' for NO-CLONE. It is provided for convenience.
MELPA-STYLE-RECIPE is as for `straight-use-package'.

(fn MELPA-STYLE-RECIPE)" nil nil) (autoload (quote straight-use-recipes) "straight" "Register a recipe repository using MELPA-STYLE-RECIPE.
This registers the recipe and builds it if it is already cloned.
Note that you probably want the recipe for a recipe repository to
include a non-nil `:no-build' property, to unconditionally
inhibit the build phase.

This function also adds the recipe repository to
`straight-recipe-repositories', at the end of the list.

(fn MELPA-STYLE-RECIPE)" nil nil) (autoload (quote straight-override-recipe) "straight" "Register MELPA-STYLE-RECIPE as a recipe override.
This puts it in `straight-recipe-overrides', depending on the
value of `straight-current-profile'.

(fn MELPA-STYLE-RECIPE)" nil nil) (autoload (quote straight-check-package) "straight" "Rebuild a PACKAGE if it has been modified.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. See also `straight-rebuild-package' and
`straight-check-all'.

(fn PACKAGE)" t nil) (autoload (quote straight-check-all) "straight" "Rebuild any packages that have been modified.
See also `straight-rebuild-all' and `straight-check-package'.
This function should not be called during init.

(fn)" t nil) (autoload (quote straight-rebuild-package) "straight" "Rebuild a PACKAGE.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument RECURSIVE, rebuild
all dependencies as well. See also `straight-check-package' and
`straight-rebuild-all'.

(fn PACKAGE &optional RECURSIVE)" t nil) (autoload (quote straight-rebuild-all) "straight" "Rebuild all packages.
See also `straight-check-all' and `straight-rebuild-package'.

(fn)" t nil) (autoload (quote straight-prune-build-cache) "straight" "Prune the build cache.
This means that only packages that were built in the last init
run and subsequent interactive session will remain; other
packages will have their build mtime information and any cached
autoloads discarded.

(fn)" nil nil) (autoload (quote straight-prune-build-directory) "straight" "Prune the build directory.
This means that only packages that were built in the last init
run and subsequent interactive session will remain; other
packages will have their build directories deleted.

(fn)" nil nil) (autoload (quote straight-prune-build) "straight" "Prune the build cache and build directory.
This means that only packages that were built in the last init
run and subsequent interactive session will remain; other
packages will have their build mtime information discarded and
their build directories deleted.

(fn)" t nil) (autoload (quote straight-normalize-package) "straight" "Normalize a PACKAGE's local repository to its recipe's configuration.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'.

(fn PACKAGE)" t nil) (autoload (quote straight-normalize-all) "straight" "Normalize all packages. See `straight-normalize-package'.
Return a list of recipes for packages that were not successfully
normalized. If multiple packages come from the same local
repository, only one is normalized.

PREDICATE, if provided, filters the packages that are normalized.
It is called with the package name as a string, and should return
non-nil if the package should actually be normalized.

(fn &optional PREDICATE)" t nil) (autoload (quote straight-fetch-package) "straight" "Try to fetch a PACKAGE from the primary remote.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument FROM-UPSTREAM,
fetch not just from primary remote but also from configured
upstream.

(fn PACKAGE &optional FROM-UPSTREAM)" t nil) (autoload (quote straight-fetch-all) "straight" "Try to fetch all packages from their primary remotes.
With prefix argument FROM-UPSTREAM, fetch not just from primary
remotes but also from configured upstreams.

Return a list of recipes for packages that were not successfully
fetched. If multiple packages come from the same local
repository, only one is fetched.

PREDICATE, if provided, filters the packages that are fetched. It
is called with the package name as a string, and should return
non-nil if the package should actually be fetched.

(fn &optional FROM-UPSTREAM PREDICATE)" t nil) (autoload (quote straight-merge-package) "straight" "Try to merge a PACKAGE from the primary remote.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument FROM-UPSTREAM,
merge not just from primary remote but also from configured
upstream.

(fn PACKAGE &optional FROM-UPSTREAM)" t nil) (autoload (quote straight-merge-all) "straight" "Try to merge all packages from their primary remotes.
With prefix argument FROM-UPSTREAM, merge not just from primary
remotes but also from configured upstreams.

Return a list of recipes for packages that were not successfully
merged. If multiple packages come from the same local
repository, only one is merged.

PREDICATE, if provided, filters the packages that are merged. It
is called with the package name as a string, and should return
non-nil if the package should actually be merged.

(fn &optional FROM-UPSTREAM PREDICATE)" t nil) (autoload (quote straight-pull-package) "straight" "Try to pull a PACKAGE from the primary remote.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument FROM-UPSTREAM, pull
not just from primary remote but also from configured upstream.

(fn PACKAGE &optional FROM-UPSTREAM)" t nil) (autoload (quote straight-pull-all) "straight" "Try to pull all packages from their primary remotes.
With prefix argument FROM-UPSTREAM, pull not just from primary
remotes but also from configured upstreams.

Return a list of recipes for packages that were not successfully
pulled. If multiple packages come from the same local repository,
only one is pulled.

PREDICATE, if provided, filters the packages that are pulled. It
is called with the package name as a string, and should return
non-nil if the package should actually be pulled.

(fn &optional FROM-UPSTREAM PREDICATE)" t nil) (autoload (quote straight-push-package) "straight" "Push a PACKAGE to its primary remote, if necessary.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'.

(fn PACKAGE)" t nil) (autoload (quote straight-push-all) "straight" "Try to push all packages to their primary remotes.

Return a list of recipes for packages that were not successfully
pushed. If multiple packages come from the same local repository,
only one is pushed.

PREDICATE, if provided, filters the packages that are normalized.
It is called with the package name as a string, and should return
non-nil if the package should actually be normalized.

(fn &optional PREDICATE)" t nil) (autoload (quote straight-freeze-versions) "straight" "Write version lockfiles for currently activated packages.
This implies first pushing all packages that have unpushed local
changes. If the package management system has been used since the
last time the init-file was reloaded, offer to fix the situation
by reloading the init-file again. If FORCE is
non-nil (interactively, if a prefix argument is provided), skip
all checks and write the lockfile anyway.

Multiple lockfiles may be written (one for each profile),
according to the value of `straight-profiles'.

(fn &optional FORCE)" t nil) (autoload (quote straight-thaw-versions) "straight" "Read version lockfiles and restore package versions to those listed.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "straight" (quote ("straight-")))) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "straight-x" (quote ("straight-x-")))) (provide (quote straight-autoloads))) "bind-key" ((bind-key-autoloads bind-key) (autoload (quote bind-key) "bind-key" "Bind KEY-NAME to COMMAND in KEYMAP (`global-map' if not passed).

KEY-NAME may be a vector, in which case it is passed straight to
`define-key'. Or it may be a string to be interpreted as
spelled-out keystrokes, e.g., \"C-c C-z\". See documentation of
`edmacro-mode' for details.

COMMAND must be an interactive function or lambda form.

KEYMAP, if present, should be a keymap and not a quoted symbol.
For example:

  (bind-key \"M-h\" #'some-interactive-function my-mode-map)

If PREDICATE is non-nil, it is a form evaluated to determine when
a key should be bound. It must return non-nil in such cases.
Emacs can evaluate this form at any time that it does redisplay
or operates on menu data structures, so you should write it so it
can safely be called at any time.

(fn KEY-NAME COMMAND &optional KEYMAP PREDICATE)" nil t) (autoload (quote unbind-key) "bind-key" "Unbind the given KEY-NAME, within the KEYMAP (if specified).
See `bind-key' for more details.

(fn KEY-NAME &optional KEYMAP)" nil t) (autoload (quote bind-key*) "bind-key" "Similar to `bind-key', but overrides any mode-specific bindings.

(fn KEY-NAME COMMAND &optional PREDICATE)" nil t) (autoload (quote bind-keys) "bind-key" "Bind multiple keys at once.

Accepts keyword arguments:
:map MAP               - a keymap into which the keybindings should be
                         added
:prefix KEY            - prefix key for these bindings
:prefix-map MAP        - name of the prefix map that should be created
                         for these bindings
:prefix-docstring STR  - docstring for the prefix-map variable
:menu-name NAME        - optional menu string for prefix map
:filter FORM           - optional form to determine when bindings apply

The rest of the arguments are conses of keybinding string and a
function symbol (unquoted).

(fn &rest ARGS)" nil t) (autoload (quote bind-keys*) "bind-key" "

(fn &rest ARGS)" nil t) (autoload (quote describe-personal-keybindings) "bind-key" "Display all the personal keybindings defined by `bind-key'.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "bind-key" (quote ("compare-keybindings" "get-binding-description" "bind-key" "personal-keybindings" "override-global-m")))) (provide (quote bind-key-autoloads))) "use-package" ((use-package-lint use-package-delight use-package-autoloads use-package use-package-diminish use-package-core use-package-bind-key use-package-jump use-package-ensure) (autoload (quote use-package-autoload-keymap) "use-package-bind-key" "Loads PACKAGE and then binds the key sequence used to invoke
this function to KEYMAP-SYMBOL. It then simulates pressing the
same key sequence a again, so that the next key pressed is routed
to the newly loaded keymap.

This function supports use-package's :bind-keymap keyword. It
works by binding the given key sequence to an invocation of this
function for a particular keymap. The keymap is expected to be
defined by the package. In this way, loading the package is
deferred until the prefix key sequence is pressed.

(fn KEYMAP-SYMBOL PACKAGE OVERRIDE)" nil nil) (autoload (quote use-package-normalize-binder) "use-package-bind-key" "

(fn NAME KEYWORD ARGS)" nil nil) (defalias (quote use-package-normalize/:bind) (quote use-package-normalize-binder)) (defalias (quote use-package-normalize/:bind*) (quote use-package-normalize-binder)) (defalias (quote use-package-autoloads/:bind) (quote use-package-autoloads-mode)) (defalias (quote use-package-autoloads/:bind*) (quote use-package-autoloads-mode)) (autoload (quote use-package-handler/:bind) "use-package-bind-key" "

(fn NAME KEYWORD ARGS REST STATE &optional BIND-MACRO)" nil nil) (defalias (quote use-package-normalize/:bind-keymap) (quote use-package-normalize-binder)) (defalias (quote use-package-normalize/:bind-keymap*) (quote use-package-normalize-binder)) (autoload (quote use-package-handler/:bind-keymap) "use-package-bind-key" "

(fn NAME KEYWORD ARGS REST STATE &optional OVERRIDE)" nil nil) (autoload (quote use-package-handler/:bind-keymap*) "use-package-bind-key" "

(fn NAME KEYWORD ARG REST STATE)" nil nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "use-package-bind-key" (quote ("use-package-handler/:bind*")))) (autoload (quote use-package) "use-package-core" "Declare an Emacs package by specifying a group of configuration options.

For full documentation, please see the README file that came with
this file.  Usage:

  (use-package package-name
     [:keyword [option]]...)

:init            Code to run before PACKAGE-NAME has been loaded.
:config          Code to run after PACKAGE-NAME has been loaded.  Note that
                 if loading is deferred for any reason, this code does not
                 execute until the lazy load has occurred.
:preface         Code to be run before everything except `:disabled'; this
                 can be used to define functions for use in `:if', or that
                 should be seen by the byte-compiler.

:mode            Form to be added to `auto-mode-alist'.
:magic           Form to be added to `magic-mode-alist'.
:magic-fallback  Form to be added to `magic-fallback-mode-alist'.
:interpreter     Form to be added to `interpreter-mode-alist'.

:commands        Define autoloads for commands that will be defined by the
                 package.  This is useful if the package is being lazily
                 loaded, and you wish to conditionally call functions in your
                 `:init' block that are defined in the package.

:bind            Bind keys, and define autoloads for the bound commands.
:bind*           Bind keys, and define autoloads for the bound commands,
                 *overriding all minor mode bindings*.
:bind-keymap     Bind a key prefix to an auto-loaded keymap defined in the
                 package.  This is like `:bind', but for keymaps.
:bind-keymap*    Like `:bind-keymap', but overrides all minor mode bindings

:defer           Defer loading of a package -- this is implied when using
                 `:commands', `:bind', `:bind*', `:mode', `:magic',
                 `:magic-fallback', or `:interpreter'.  This can be an integer,
                 to force loading after N seconds of idle time, if the package
                 has not already been loaded.
:after           Defer loading of a package until after any of the named
                 features are loaded.
:demand          Prevent deferred loading in all cases.

:if EXPR         Initialize and load only if EXPR evaluates to a non-nil value.
:disabled        The package is ignored completely if this keyword is present.
:defines         Declare certain variables to silence the byte-compiler.
:functions       Declare certain functions to silence the byte-compiler.
:load-path       Add to the `load-path' before attempting to load the package.
:diminish        Support for diminish.el (if installed).
:delight         Support for delight.el (if installed).
:custom          Call `customize-set-variable' with each variable definition.
:custom-face     Call `customize-set-faces' with each face definition.
:ensure          Loads the package using package.el if necessary.
:pin             Pin the package to an archive.

(fn NAME &rest ARGS)" nil t) (function-put (quote use-package) (quote lisp-indent-function) (quote 1)) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "use-package-core" (quote ("use-package-")))) (autoload (quote use-package-normalize/:delight) "use-package-delight" "Normalize arguments to delight.

(fn NAME KEYWORD ARGS)" nil nil) (autoload (quote use-package-handler/:delight) "use-package-delight" "

(fn NAME KEYWORD ARGS REST STATE)" nil nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "use-package-delight" (quote ("use-package-normalize-delight")))) (autoload (quote use-package-normalize/:diminish) "use-package-diminish" "

(fn NAME KEYWORD ARGS)" nil nil) (autoload (quote use-package-handler/:diminish) "use-package-diminish" "

(fn NAME KEYWORD ARG REST STATE)" nil nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "use-package-diminish" (quote ("use-package-normalize-diminish")))) (autoload (quote use-package-normalize/:ensure) "use-package-ensure" "

(fn NAME KEYWORD ARGS)" nil nil) (autoload (quote use-package-handler/:ensure) "use-package-ensure" "

(fn NAME KEYWORD ENSURE REST STATE)" nil nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "use-package-ensure" (quote ("use-package-")))) (autoload (quote use-package-jump-to-package-form) "use-package-jump" "Attempt to find and jump to the `use-package' form that loaded
PACKAGE. This will only find the form if that form actually
required PACKAGE. If PACKAGE was previously required then this
function will jump to the file that originally required PACKAGE
instead.

(fn PACKAGE)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "use-package-jump" (quote ("use-package-find-require")))) (autoload (quote use-package-lint) "use-package-lint" "Check for errors in use-package declarations.
For example, if the module's `:if' condition is met, but even
with the specified `:load-path' the module cannot be found.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "use-package-lint" (quote ("use-package-lint-declaration")))) (provide (quote use-package-autoloads))) "rainbow-delimiters" ((rainbow-delimiters rainbow-delimiters-autoloads) (autoload (quote rainbow-delimiters-mode) "rainbow-delimiters" "Highlight nested parentheses, brackets, and braces according to their depth.

(fn &optional ARG)" t nil) (autoload (quote rainbow-delimiters-mode-enable) "rainbow-delimiters" "Enable `rainbow-delimiters-mode'.

(fn)" nil nil) (autoload (quote rainbow-delimiters-mode-disable) "rainbow-delimiters" "Disable `rainbow-delimiters-mode'.

(fn)" nil nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "rainbow-delimiters" (quote ("rainbow-delimiters-")))) (provide (quote rainbow-delimiters-autoloads))) "cl-lib" ((cl-lib-autoloads cl-lib) (let ((d (file-name-directory "/home/tsubasa/.emacs.d/straight/build/cl-lib/cl-lib-autoloads.el"))) (when (member d load-path) (setq load-path (append (remove d load-path) (list d))))) (provide (quote cl-lib-autoloads))) "neotree" ((neotree neotree-autoloads) (autoload (quote neotree-find) "neotree" "Quick select node which specified PATH in NeoTree.
If path is nil and no buffer file name, then use DEFAULT-PATH,

(fn &optional PATH DEFAULT-PATH)" t nil) (autoload (quote neotree-projectile-action) "neotree" "Integration with `Projectile'.

Usage:
    (setq projectile-switch-project-action 'neotree-projectile-action).

When running `projectile-switch-project' (C-c p p), `neotree' will change root
automatically.

(fn)" t nil) (autoload (quote neotree-toggle) "neotree" "Toggle show the NeoTree window.

(fn)" t nil) (autoload (quote neotree-show) "neotree" "Show the NeoTree window.

(fn)" t nil) (autoload (quote neotree-hide) "neotree" "Close the NeoTree window.

(fn)" t nil) (autoload (quote neotree-dir) "neotree" "Show the NeoTree window, and change root to PATH.

(fn PATH)" t nil) (defalias (quote neotree) (quote neotree-show) "Show the NeoTree window.") (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "neotree" (quote ("neo" "off-p")))) (provide (quote neotree-autoloads))) "volatile-highlights" ((volatile-highlights-autoloads volatile-highlights) (defvar volatile-highlights-mode nil "Non-nil if Volatile-Highlights mode is enabled.
See the `volatile-highlights-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `volatile-highlights-mode'.") (custom-autoload (quote volatile-highlights-mode) "volatile-highlights" nil) (autoload (quote volatile-highlights-mode) "volatile-highlights" "Minor mode for visual feedback on some operations.

(fn &optional ARG)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "volatile-highlights" (quote ("vhl/" "Vhl/highlight-zero-width-ranges")))) (provide (quote volatile-highlights-autoloads))) "smooth-scroll" ((smooth-scroll-autoloads smooth-scroll) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "smooth-scroll" (quote ("scroll-" "smooth-scroll/")))) (provide (quote smooth-scroll-autoloads))) "hlinum" ((hlinum-autoloads hlinum) (autoload (quote hlinum-activate) "hlinum" "Enable highlighting current line number.

(fn)" t nil) (autoload (quote hlinum-deactivate) "hlinum" "Disable highlighting current line number.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "hlinum" (quote ("hlinum-" "linum-highlight-in-all-buffersp")))) (provide (quote hlinum-autoloads))) "undohist" ((undohist-autoloads undohist) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "undohist" (quote ("undohist-" "make-undohist-file-name")))) (provide (quote undohist-autoloads))) "anzu" ((anzu-autoloads anzu) (autoload (quote anzu-mode) "anzu" "minor-mode which display search information in mode-line.

(fn &optional ARG)" t nil) (defvar global-anzu-mode nil "Non-nil if Global Anzu mode is enabled.
See the `global-anzu-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-anzu-mode'.") (custom-autoload (quote global-anzu-mode) "anzu" nil) (autoload (quote global-anzu-mode) "anzu" "Toggle Anzu mode in all buffers.
With prefix ARG, enable Global Anzu mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Anzu mode is enabled in all buffers where
`anzu--turn-on' would do it.
See `anzu-mode' for more information on Anzu mode.

(fn &optional ARG)" t nil) (autoload (quote anzu-query-replace-at-cursor) "anzu" "Replace symbol at cursor with to-string.

(fn)" t nil) (autoload (quote anzu-query-replace-at-cursor-thing) "anzu" "Replace symbol at cursor within `anzu-replace-at-cursor-thing' area.

(fn)" t nil) (autoload (quote anzu-query-replace) "anzu" "anzu version of `query-replace'.

(fn ARG)" t nil) (autoload (quote anzu-query-replace-regexp) "anzu" "anzu version of `query-replace-regexp'.

(fn ARG)" t nil) (autoload (quote anzu-replace-at-cursor-thing) "anzu" "anzu-query-replace-at-cursor-thing without query.

(fn)" t nil) (autoload (quote anzu-isearch-query-replace) "anzu" "anzu version of `isearch-query-replace'.

(fn ARG)" t nil) (autoload (quote anzu-isearch-query-replace-regexp) "anzu" "anzu version of `isearch-query-replace-regexp'.

(fn ARG)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "anzu" (quote ("anzu-")))) (provide (quote anzu-autoloads))) "shell-pop" ((shell-pop shell-pop-autoloads) (defvar shell-pop-universal-key nil "Key binding used to pop in and out of the shell.

The input format is the same as that of `kbd'.") (custom-autoload (quote shell-pop-universal-key) "shell-pop" nil) (autoload (quote shell-pop) "shell-pop" "

(fn ARG)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "shell-pop" (quote ("shell-pop-")))) (provide (quote shell-pop-autoloads))) "web-mode" ((web-mode web-mode-autoloads) (autoload (quote web-mode) "web-mode" "Major mode for editing web templates.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "web-mode" (quote ("web-mode-")))) (provide (quote web-mode-autoloads))) "seq" ((seq seq-24 seq-25 seq-autoloads) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "seq-24" (quote ("seq")))) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "seq-25" (quote ("seq--when-emacs-25-p")))) (provide (quote seq-autoloads))) "beacon" ((beacon-autoloads beacon) (autoload (quote beacon-blink) "beacon" "Blink the beacon at the position of the cursor.
Unlike `beacon-blink-automated', the beacon will blink
unconditionally (even if `beacon-mode' is disabled), and this can
be invoked as a user command or called from lisp code.

(fn)" t nil) (defvar beacon-mode nil "Non-nil if Beacon mode is enabled.
See the `beacon-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `beacon-mode'.") (custom-autoload (quote beacon-mode) "beacon" nil) (autoload (quote beacon-mode) "beacon" "Toggle Beacon mode on or off.
With a prefix argument ARG, enable Beacon mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.
\\{beacon-mode-map}

(fn &optional ARG)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "beacon" (quote ("beacon-")))) (provide (quote beacon-autoloads))) "mozc" ((mozc mozc-autoloads) (defvar mozc-mode-map (let ((map (make-sparse-keymap))) (prog1 map (mapc (lambda (command) (mapc (lambda (key-sequence) (and (= (length key-sequence) 1) (integerp (aref key-sequence 0)) (define-key map key-sequence command))) (where-is-internal command global-map))) (quote (execute-extended-command toggle-input-method))) (mapc (lambda (event) (define-key map (vector event) nil)) (quote (delete-frame iconify-frame make-frame-visible select-window switch-frame))) (define-key map [t] (function mozc-handle-event)))) "Keymap for function `mozc-mode'.") (defvar mozc-mode nil "Mode variable of function `mozc-mode'.
Non-nil means function `mozc-mode' is enabled.") (autoload (quote mozc-mode) "mozc" "Minor mode to input Japanese text with Mozc.
Toggle the mode if ARG is not given, or enable/disable the mode
according to ARG.

Hooks in `mozc-mode-hook' are run when the mode gets enabled.

Return non-nil when enabled, otherwise nil.


Tips for customizations

By the design policy, Mozc maintains most of user settings on
the server side.  Clients, including mozc.el, of Mozc do not
have many user settings on their side.

You can change a variety of user settings through a GUI command
line tool 'mozc_tool' which must be shipped with the mozc server.
The command line tool may be installed to /usr/lib/mozc or /usr/lib
directory.
You need a command line option '--mode=config_dialog' as the
following.

  $ /usr/lib/mozc/mozc_tool --mode=config_dialog

Then, it shows a GUI dialog to edit your user settings.

Note these settings are effective for all the clients of Mozc,
not limited to mozc.el.

Only the customizable item on mozc.el side is the key map for kana
input.  When you've chosen kana input rather than roman input,
a kana key map is effective, and you can customize it.

There are two built-in kana key maps, one for 106 JP keyboards and
one for 101 US keyboards.  You can choose one of them by setting
`mozc-keymap-kana' variable.

  ;; for 106 JP keyboards
  (setq mozc-keymap-kana mozc-keymap-kana-106jp)

  ;; for 101 US keyboards
  (setq mozc-keymap-kana mozc-keymap-kana-101us)

For advanced users, there are APIs for more detailed customization
or even creating your own key map.
See `mozc-keymap-get-entry', `mozc-keymap-put-entry',
`mozc-keymap-remove-entry', and `mozc-keymap-make-keymap' and
`mozc-keymap-make-keymap-from-flat-list'.

(fn &optional ARG)" t nil) (autoload (quote mozc-keymap-make-keymap) "mozc" "Create a new empty keymap and return it.

(fn)" nil nil) (autoload (quote mozc-keymap-make-keymap-from-flat-list) "mozc" "Create a new keymap and fill it with entries in LIST.
LIST must be a flat list which contains keys and mapped strings alternately.

(fn LIST)" nil nil) (autoload (quote mozc-keymap-fill-entries-from-flat-list) "mozc" "Fill KEYMAP with entries in LIST and return KEYMAP.
KEYMAP must be a key table from keycodes to mapped strings.
LIST must be a flat list which contains keys and mapped strings alternately.

(fn KEYMAP LIST)" nil nil) (autoload (quote mozc-keymap-get-entry) "mozc" "Return a mapped string if the entry for the keycode exists.
Otherwise, the default value, which must be a string.
KEYMAP must be a key table from keycodes to mapped strings.
KEYCODE must be an integer representing a key code to look up.
DEFAULT is returned if it's a string and no entry for KEYCODE is found.

(fn KEYMAP KEYCODE &optional DEFAULT)" nil nil) (autoload (quote mozc-keymap-put-entry) "mozc" "Add a new key mapping to a keymap.
KEYMAP must be a key table from keycodes to mapped strings.
KEYCODE must be an integer representing a key code.
MAPPED-STRING must be a string representing a preedit string to be inserted.

(fn KEYMAP KEYCODE MAPPED-STRING)" nil nil) (autoload (quote mozc-keymap-remove-entry) "mozc" "Remove an entry from a keymap.  If no entry for keycode exists, do nothing.
KEYMAP must be a key table from keycodes to mapped strings.
KEYCODE must be an integer representing a key code to remove.

(fn KEYMAP KEYCODE)" nil nil) (defvar mozc-keymap-kana-106jp (mozc-keymap-make-keymap-from-flat-list (quote (49 "\343\201\254" 50 "\343\201\265" 51 "\343\201\202" 52 "\343\201\206" 53 "\343\201\210" 54 "\343\201\212" 55 "\343\202\204" 56 "\343\202\206" 57 "\343\202\210" 48 "\343\202\217" 45 "\343\201\273" 94 "\343\201\270" 124 "\343\203\274" 113 "\343\201\237" 119 "\343\201\246" 101 "\343\201\204" 114 "\343\201\231" 116 "\343\201\213" 121 "\343\202\223" 117 "\343\201\252" 105 "\343\201\253" 111 "\343\202\211" 112 "\343\201\233" 64 "\343\202\233" 91 "\343\202\234" 97 "\343\201\241" 115 "\343\201\250" 100 "\343\201\227" 102 "\343\201\257" 103 "\343\201\215" 104 "\343\201\217" 106 "\343\201\276" 107 "\343\201\256" 108 "\343\202\212" 59 "\343\202\214" 58 "\343\201\221" 93 "\343\202\200" 122 "\343\201\244" 120 "\343\201\225" 99 "\343\201\235" 118 "\343\201\262" 98 "\343\201\223" 110 "\343\201\277" 109 "\343\202\202" 44 "\343\201\255" 46 "\343\202\213" 47 "\343\202\201" 92 "\343\202\215" 35 "\343\201\201" 69 "\343\201\203" 36 "\343\201\205" 37 "\343\201\207" 38 "\343\201\211" 39 "\343\202\203" 40 "\343\202\205" 41 "\343\202\207" 126 "\343\202\222" 90 "\343\201\243" 60 "\343\200\201" 62 "\343\200\202" 63 "\343\203\273" 123 "\343\200\214" 125 "\343\200\215" 80 "\343\200\216" 43 "\343\200\217" 95 "\343\202\215" 70 "\343\202\216" 84 "\343\203\265" 42 "\343\203\266"))) "Key mapping from key codes to Kana strings based on 106-JP keyboard.") (defvar mozc-keymap-kana-101us (mozc-keymap-make-keymap-from-flat-list (quote (49 "\343\201\254" 50 "\343\201\265" 51 "\343\201\202" 52 "\343\201\206" 53 "\343\201\210" 54 "\343\201\212" 55 "\343\202\204" 56 "\343\202\206" 57 "\343\202\210" 48 "\343\202\217" 45 "\343\201\273" 61 "\343\201\270" 96 "\343\202\215" 113 "\343\201\237" 119 "\343\201\246" 101 "\343\201\204" 114 "\343\201\231" 116 "\343\201\213" 121 "\343\202\223" 117 "\343\201\252" 105 "\343\201\253" 111 "\343\202\211" 112 "\343\201\233" 91 "\343\202\233" 93 "\343\202\234" 92 "\343\202\200" 97 "\343\201\241" 115 "\343\201\250" 100 "\343\201\227" 102 "\343\201\257" 103 "\343\201\215" 104 "\343\201\217" 106 "\343\201\276" 107 "\343\201\256" 108 "\343\202\212" 59 "\343\202\214" 39 "\343\201\221" 122 "\343\201\244" 120 "\343\201\225" 99 "\343\201\235" 118 "\343\201\262" 98 "\343\201\223" 110 "\343\201\277" 109 "\343\202\202" 44 "\343\201\255" 46 "\343\202\213" 47 "\343\202\201" 35 "\343\201\201" 69 "\343\201\203" 36 "\343\201\205" 37 "\343\201\207" 94 "\343\201\211" 38 "\343\202\203" 42 "\343\202\205" 40 "\343\202\207" 41 "\343\202\222" 90 "\343\201\243" 60 "\343\200\201" 62 "\343\200\202" 63 "\343\203\273" 123 "\343\200\214" 125 "\343\200\215" 80 "\343\200\216" 58 "\343\200\217" 95 "\343\203\274" 124 "\343\203\274" 70 "\343\202\216" 86 "\343\202\220" 43 "\343\202\221" 84 "\343\203\265" 34 "\343\203\266"))) "Key mapping from key codes to Kana strings based on 101-US keyboard.") (defvar mozc-keymap-kana mozc-keymap-kana-106jp "The default key mapping for Kana input method.") (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "mozc" (quote ("mozc-")))) (provide (quote mozc-autoloads))) "async" ((smtpmail-async async-bytecomp async-autoloads async-pkg dired-async async) (autoload (quote async-start-process) "async" "Start the executable PROGRAM asynchronously.  See `async-start'.
PROGRAM is passed PROGRAM-ARGS, calling FINISH-FUNC with the
process object when done.  If FINISH-FUNC is nil, the future
object will return the process object when the program is
finished.  Set DEFAULT-DIRECTORY to change PROGRAM's current
working directory.

(fn NAME PROGRAM FINISH-FUNC &rest PROGRAM-ARGS)" nil nil) (autoload (quote async-start) "async" "Execute START-FUNC (often a lambda) in a subordinate Emacs process.
When done, the return value is passed to FINISH-FUNC.  Example:

    (async-start
       ;; What to do in the child process
       (lambda ()
         (message \"This is a test\")
         (sleep-for 3)
         222)

       ;; What to do when it finishes
       (lambda (result)
         (message \"Async process done, result should be 222: %s\"
                  result)))

If FINISH-FUNC is nil or missing, a future is returned that can
be inspected using `async-get', blocking until the value is
ready.  Example:

    (let ((proc (async-start
                   ;; What to do in the child process
                   (lambda ()
                     (message \"This is a test\")
                     (sleep-for 3)
                     222))))

        (message \"I'm going to do some work here\") ;; ....

        (message \"Waiting on async process, result should be 222: %s\"
                 (async-get proc)))

If you don't want to use a callback, and you don't care about any
return value from the child process, pass the `ignore' symbol as
the second argument (if you don't, and never call `async-get', it
will leave *emacs* process buffers hanging around):

    (async-start
     (lambda ()
       (delete-file \"a remote file on a slow link\" nil))
     'ignore)

Note: Even when FINISH-FUNC is present, a future is still
returned except that it yields no value (since the value is
passed to FINISH-FUNC).  Call `async-get' on such a future always
returns nil.  It can still be useful, however, as an argument to
`async-ready' or `async-wait'.

(fn START-FUNC &optional FINISH-FUNC)" nil nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "async" (quote ("async-")))) (autoload (quote async-byte-recompile-directory) "async-bytecomp" "Compile all *.el files in DIRECTORY asynchronously.
All *.elc files are systematically deleted before proceeding.

(fn DIRECTORY &optional QUIET)" nil nil) (defvar async-bytecomp-package-mode nil "Non-nil if Async-Bytecomp-Package mode is enabled.
See the `async-bytecomp-package-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `async-bytecomp-package-mode'.") (custom-autoload (quote async-bytecomp-package-mode) "async-bytecomp" nil) (autoload (quote async-bytecomp-package-mode) "async-bytecomp" "Byte compile asynchronously packages installed with package.el.
Async compilation of packages can be controlled by
`async-bytecomp-allowed-packages'.

(fn &optional ARG)" t nil) (autoload (quote async-byte-compile-file) "async-bytecomp" "Byte compile Lisp code FILE asynchronously.

Same as `byte-compile-file' but asynchronous.

(fn FILE)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "async-bytecomp" (quote ("async-byte")))) (defvar dired-async-mode nil "Non-nil if Dired-Async mode is enabled.
See the `dired-async-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `dired-async-mode'.") (custom-autoload (quote dired-async-mode) "dired-async" nil) (autoload (quote dired-async-mode) "dired-async" "Do dired actions asynchronously.

(fn &optional ARG)" t nil) (autoload (quote dired-async-do-copy) "dired-async" "Run \342\200\230dired-do-copy\342\200\231 asynchronously.

(fn &optional ARG)" t nil) (autoload (quote dired-async-do-symlink) "dired-async" "Run \342\200\230dired-do-symlink\342\200\231 asynchronously.

(fn &optional ARG)" t nil) (autoload (quote dired-async-do-hardlink) "dired-async" "Run \342\200\230dired-do-hardlink\342\200\231 asynchronously.

(fn &optional ARG)" t nil) (autoload (quote dired-async-do-rename) "dired-async" "Run \342\200\230dired-do-rename\342\200\231 asynchronously.

(fn &optional ARG)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "dired-async" (quote ("dired-async-")))) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "smtpmail-async" (quote ("async-smtpmail-")))) (provide (quote async-autoloads))) "popup" ((popup popup-autoloads) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "popup" (quote ("popup-")))) (provide (quote popup-autoloads))) "helm-core" ((helm-core-autoloads helm-core-pkg helm-multi-match helm-lib helm helm-source) (autoload (quote helm-define-multi-key) "helm" "In KEYMAP, define key sequence KEY for function list FUNCTIONS.
Each function runs sequentially for each KEY press.
If DELAY is specified, switch back to initial function of FUNCTIONS list
after DELAY seconds.
The functions in FUNCTIONS list take no args.
e.g
    (defun foo ()
      (interactive)
      (message \"Run foo\"))
    (defun bar ()
      (interactive)
      (message \"Run bar\"))
    (defun baz ()
      (interactive)
      (message \"Run baz\"))

(helm-define-multi-key global-map (kbd \"<f5> q\") '(foo bar baz) 2)

Each time \"<f5> q\" is pressed, the next function is executed. Waiting
more than 2 seconds between key presses switches back to executing the first
function on the next hit.

(fn KEYMAP KEY FUNCTIONS &optional DELAY)" nil nil) (autoload (quote helm-multi-key-defun) "helm" "Define NAME as a multi-key command running FUNS.
After DELAY seconds, the FUNS list is reinitialized.
See `helm-define-multi-key'.

(fn NAME DOCSTRING FUNS &optional DELAY)" nil t) (function-put (quote helm-multi-key-defun) (quote lisp-indent-function) (quote 2)) (autoload (quote helm-define-key-with-subkeys) "helm" "Defines in MAP a KEY and SUBKEY to COMMAND.

This allows typing KEY to call COMMAND the first time and
type only SUBKEY on subsequent calls.

Arg MAP is the keymap to use, SUBKEY is the initial short key-binding to
call COMMAND.

Arg OTHER-SUBKEYS is an alist specifying other short key-bindings
to use once started e.g:

    (helm-define-key-with-subkeys global-map
       (kbd \"C-x v n\") ?n 'git-gutter:next-hunk '((?p . git-gutter:previous-hunk)))


In this example, `C-x v n' will run `git-gutter:next-hunk'
subsequent \"n\"'s run this command again
and subsequent \"p\"'s run `git-gutter:previous-hunk'.

If specified PROMPT can be displayed in minibuffer to
describe SUBKEY and OTHER-SUBKEYS.
Arg EXIT-FN specifies a function to run on exit.

For any other keys pressed, run their assigned command as defined
in MAP and then exit the loop running EXIT-FN, if specified.

NOTE: SUBKEY and OTHER-SUBKEYS bindings support only char syntax and
vectors, so don't use strings to define them.

(fn MAP KEY SUBKEY COMMAND &optional OTHER-SUBKEYS PROMPT EXIT-FN)" nil nil) (function-put (quote helm-define-key-with-subkeys) (quote lisp-indent-function) (quote 1)) (autoload (quote helm-debug-open-last-log) "helm" "Open helm log file or buffer of last helm session.

(fn)" t nil) (autoload (quote helm) "helm" "Main function to execute helm sources.

PLIST is a list like

(:key1 val1 :key2 val2 ...)

 or

(&optional sources input prompt resume preselect
            buffer keymap default history allow-nest).

** Keywords

Keywords supported:

- :sources
- :input
- :prompt
- :resume
- :preselect
- :buffer
- :keymap
- :default
- :history
- :allow-nest

Extra LOCAL-VARS keywords are supported, see the \"** Other
keywords\" section below.

Basic keywords are the following:

*** :sources

One of the following:

- List of sources
- Symbol whose value is a list of sources
- Alist representing a Helm source.
  - In this case the source has no name and is referenced in
    `helm-sources' as a whole alist.

*** :input

Initial input of minibuffer (temporary value of `helm-pattern')

*** :prompt

Minibuffer prompt. Default value is `helm--prompt'.

*** :resume

If t, allow resumption of the previous session of this Helm
command, skipping initialization.

If 'noresume, this instance of `helm' cannot be resumed.

*** :preselect

Initially selected candidate (string or regexp).

*** :buffer

Buffer name for this Helm session. `helm-buffer' will take this value.

*** :keymap

[Obsolete]

Keymap used at the start of this Helm session.

It is overridden by keymaps specified in sources, and is kept
only for backward compatibility.

Keymaps should be specified in sources using the :keymap slot
instead. See `helm-source'.

This keymap is not restored by `helm-resume'.

*** :default

Default value inserted into the minibuffer with
\\<minibuffer-local-map>\\[next-history-element].

It can be a string or a list of strings, in this case
\\<minibuffer-local-map>\\[next-history-element] cycles through
the list items, starting with the first.

If nil, `thing-at-point' is used.

If `helm--maybe-use-default-as-input' is non-`nil', display is
updated using this value, unless :input is specified, in which
case that value is used instead.

*** :history

Minibuffer input, by default, is pushed to `minibuffer-history'.

When an argument HISTORY is provided, input is pushed to
HISTORY. HISTORY should be a valid symbol.

*** :allow-nest

Allow running this Helm command in a running Helm session.

** Other keywords

Other keywords are interpreted as local variables of this Helm
session. The `helm-' prefix can be omitted. For example,

(helm :sources 'helm-source-buffers-list
       :buffer \"*helm buffers*\"
       :candidate-number-limit 10)

starts a Helm session with the variable
`helm-candidate-number-limit' set to 10.

** Backward compatibility

For backward compatibility, positional parameters are
supported:

(helm sources input prompt resume preselect
       buffer keymap default history allow-nest)

However, the use of non-keyword args is deprecated.

(fn &key SOURCES INPUT PROMPT RESUME PRESELECT BUFFER KEYMAP DEFAULT HISTORY ALLOW-NEST OTHER-LOCAL-VARS)" nil nil) (autoload (quote helm-cycle-resume) "helm" "Cycle in `helm-buffers' list and resume when waiting more than 1.2s.

(fn)" t nil) (autoload (quote helm-other-buffer) "helm" "Simplified `helm' interface with other `helm-buffer'.
Call `helm' only with ANY-SOURCES and ANY-BUFFER as args.

(fn ANY-SOURCES ANY-BUFFER)" nil nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm" (quote ("helm-" "cua-delete-region--advice" "copy-region-as-kill--advice" "with-helm-")))) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-lib" (quote ("helm-" "with-helm-")))) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-multi-match" (quote ("helm-m")))) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-source" (quote ("helm-")))) (provide (quote helm-core-autoloads))) "helm" ((helm-help helm-id-utils helm-net helm-info helm-find helm-mode helm-dabbrev helm-color helm-external helm-semantic helm-for-files helm-bookmark helm-org helm-man helm-eval helm-tags helm-utils helm-elisp-package helm-sys helm-easymenu helm-elisp helm-buffers helm-adaptive helm-locate helm-grep helm-ring helm-imenu helm-files helm-autoloads helm-config helm-eshell helm-types helm-misc helm-pkg helm-x-files helm-regexp helm-font helm-command) (defvar helm-adaptive-mode nil "Non-nil if Helm-Adaptive mode is enabled.
See the `helm-adaptive-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `helm-adaptive-mode'.") (custom-autoload (quote helm-adaptive-mode) "helm-adaptive" nil) (autoload (quote helm-adaptive-mode) "helm-adaptive" "Toggle adaptive sorting in all sources.

(fn &optional ARG)" t nil) (autoload (quote helm-reset-adaptive-history) "helm-adaptive" "Delete all `helm-adaptive-history' and his file.
Useful when you have a old or corrupted `helm-adaptive-history-file'.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-adaptive" (quote ("helm-adapt")))) (autoload (quote helm-bookmarks) "helm-bookmark" "Preconfigured `helm' for bookmarks.

(fn)" t nil) (autoload (quote helm-filtered-bookmarks) "helm-bookmark" "Preconfigured helm for bookmarks (filtered by category).
Optional source `helm-source-bookmark-addressbook' is loaded
only if external addressbook-bookmark package is installed.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-bookmark" (quote ("helm-" "bmkext-jump-" "bookmark")))) (autoload (quote helm-buffers-list) "helm-buffers" "Preconfigured `helm' to list buffers.

(fn)" t nil) (autoload (quote helm-mini) "helm-buffers" "Preconfigured `helm' lightweight version (buffer -> recentf).

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-buffers" (quote ("helm-")))) (autoload (quote helm-colors) "helm-color" "Preconfigured `helm' for color.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-color" (quote ("helm-")))) (autoload (quote helm-M-x) "helm-command" "Preconfigured `helm' for Emacs commands.
It is `helm' replacement of regular `M-x' `execute-extended-command'.

Unlike regular `M-x' emacs vanilla `execute-extended-command' command,
the prefix args if needed, can be passed AFTER starting `helm-M-x'.
When a prefix arg is passed BEFORE starting `helm-M-x', the first `C-u'
while in `helm-M-x' session will disable it.

You can get help on each command by persistent action.

(fn ARG &optional COMMAND-NAME)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-command" (quote ("helm-")))) (autoload (quote helm-configuration) "helm-config" "Customize `helm'.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-config" (quote ("helm-")))) (autoload (quote helm-dabbrev) "helm-dabbrev" "Preconfigured helm for dynamic abbreviations.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-dabbrev" (quote ("helm-dabbrev-")))) (autoload (quote helm-lisp-completion-at-point) "helm-elisp" "Preconfigured helm for lisp symbol completion at point.

(fn)" t nil) (autoload (quote helm-complete-file-name-at-point) "helm-elisp" "Preconfigured helm to complete file name at point.

(fn &optional FORCE)" t nil) (autoload (quote helm-lisp-indent) "helm-elisp" "

(fn)" t nil) (autoload (quote helm-lisp-completion-or-file-name-at-point) "helm-elisp" "Preconfigured helm to complete lisp symbol or filename at point.
Filename completion happen if string start after or between a double quote.

(fn)" t nil) (autoload (quote helm-apropos) "helm-elisp" "Preconfigured helm to describe commands, functions, variables and faces.
In non interactives calls DEFAULT argument should be provided as a string,
i.e the `symbol-name' of any existing symbol.

(fn DEFAULT)" t nil) (autoload (quote helm-manage-advice) "helm-elisp" "Preconfigured `helm' to disable/enable function advices.

(fn)" t nil) (autoload (quote helm-locate-library) "helm-elisp" "Preconfigured helm to locate elisp libraries.

(fn)" t nil) (autoload (quote helm-timers) "helm-elisp" "Preconfigured `helm' for timers.

(fn)" t nil) (autoload (quote helm-complex-command-history) "helm-elisp" "Preconfigured helm for complex command history.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-elisp" (quote ("helm-" "with-helm-show-completion")))) (autoload (quote helm-list-elisp-packages) "helm-elisp-package" "Preconfigured helm for listing and handling emacs packages.

(fn ARG)" t nil) (autoload (quote helm-list-elisp-packages-no-fetch) "helm-elisp-package" "Preconfigured helm for emacs packages.

Same as `helm-list-elisp-packages' but don't fetch packages on remote.
Called with a prefix ARG always fetch packages on remote.

(fn ARG)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-elisp-package" (quote ("helm-")))) (autoload (quote helm-esh-pcomplete) "helm-eshell" "Preconfigured helm to provide helm completion in eshell.

(fn)" t nil) (autoload (quote helm-eshell-history) "helm-eshell" "Preconfigured helm for eshell history.

(fn)" t nil) (autoload (quote helm-eshell-prompts) "helm-eshell" "Pre-configured `helm' to browse the prompts of the current Eshell.

(fn)" t nil) (autoload (quote helm-eshell-prompts-all) "helm-eshell" "Pre-configured `helm' to browse the prompts of all Eshell sessions.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-eshell" (quote ("helm-e")))) (autoload (quote helm-eval-expression) "helm-eval" "Preconfigured helm for `helm-source-evaluation-result'.

(fn ARG)" t nil) (autoload (quote helm-eval-expression-with-eldoc) "helm-eval" "Preconfigured helm for `helm-source-evaluation-result' with `eldoc' support. 

(fn)" t nil) (autoload (quote helm-calcul-expression) "helm-eval" "Preconfigured helm for `helm-source-calculation-result'.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-eval" (quote ("helm-")))) (autoload (quote helm-run-external-command) "helm-external" "Preconfigured `helm' to run External PROGRAM asyncronously from Emacs.
If program is already running exit with error.
You can set your own list of commands with
`helm-external-commands-list'.

(fn PROGRAM)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-external" (quote ("helm-")))) (autoload (quote helm-projects-history) "helm-files" "

(fn)" t nil) (autoload (quote helm-browse-project) "helm-files" "Preconfigured helm to browse projects.
Browse files and see status of project with its vcs.
Only HG and GIT are supported for now.
Fall back to `helm-browse-project-find-files'
if current directory is not under control of one of those vcs.
With a prefix ARG browse files recursively, with two prefix ARG
rebuild the cache.
If the current directory is found in the cache, start
`helm-browse-project-find-files' even with no prefix ARG.
NOTE: The prefix ARG have no effect on the VCS controlled directories.

Needed dependencies for VCS:
<https://github.com/emacs-helm/helm-ls-git>
and
<https://github.com/emacs-helm/helm-ls-hg>.

(fn ARG)" t nil) (autoload (quote helm-find-files) "helm-files" "Preconfigured `helm' for helm implementation of `find-file'.
Called with a prefix arg show history if some.
Don't call it from programs, use `helm-find-files-1' instead.
This is the starting point for nearly all actions you can do on files.

(fn ARG)" t nil) (autoload (quote helm-delete-tramp-connection) "helm-files" "Allow deleting tramp connection or marked tramp connections at once.

This replace `tramp-cleanup-connection' which is partially broken in
emacs < to 25.1.50.1 (See Emacs Bug#24432).

It allows additionally to delete more than one connection at once.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-files" (quote ("helm-" "eshell-command-aliases-list")))) (autoload (quote helm-find) "helm-find" "Preconfigured `helm' for the find shell command.

Recursively find files whose names are matched by all specified
globbing PATTERNs under the current directory using the external
program specified in `find-program' (usually \"find\").  Every
input PATTERN is silently wrapped into two stars: *PATTERN*.

With prefix argument, prompt for a directory to search.

When user option `helm-findutils-search-full-path' is non-nil,
match against complete paths, otherwise, against file names
without directory part.

The (possibly empty) list of globbing PATTERNs can be followed by
the separator \"*\" plus any number of additional arguments that
are passed to \"find\" literally.

(fn ARG)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-find" (quote ("helm-")))) (autoload (quote helm-select-xfont) "helm-font" "Preconfigured `helm' to select Xfont.

(fn)" t nil) (autoload (quote helm-ucs) "helm-font" "Preconfigured helm for `ucs-names'.

Called with a prefix arg force reloading cache.

(fn ARG)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-font" (quote ("helm-")))) (autoload (quote helm-for-files) "helm-for-files" "Preconfigured `helm' for opening files.
Run all sources defined in `helm-for-files-preferred-list'.

(fn)" t nil) (autoload (quote helm-multi-files) "helm-for-files" "Preconfigured helm like `helm-for-files' but running locate only on demand.

Allow toggling back and forth from locate to others sources with
`helm-multi-files-toggle-locate-binding' key.
This avoid launching needlessly locate when what you search is already
found.

(fn)" t nil) (autoload (quote helm-recentf) "helm-for-files" "Preconfigured `helm' for `recentf'.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-for-files" (quote ("helm-")))) (autoload (quote helm-goto-precedent-file) "helm-grep" "Go to precedent file in helm grep/etags buffers.

(fn)" t nil) (autoload (quote helm-goto-next-file) "helm-grep" "Go to precedent file in helm grep/etags buffers.

(fn)" t nil) (autoload (quote helm-do-grep-ag) "helm-grep" "Preconfigured helm for grepping with AG in `default-directory'.
With prefix-arg prompt for type if available with your AG version.

(fn ARG)" t nil) (autoload (quote helm-grep-do-git-grep) "helm-grep" "Preconfigured helm for git-grepping `default-directory'.
With a prefix arg ARG git-grep the whole repository.

(fn ARG)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-grep" (quote ("helm-")))) (autoload (quote helm-documentation) "helm-help" "Preconfigured Helm for Helm documentation.
With a prefix arg refresh the documentation.

Find here the documentation of all documented sources.

(fn)" t nil) (defvar helm-comp-read-mode-line "\\<helm-comp-read-map>C/\\[helm-cr-empty-string]:Empty \\<helm-map>\\[helm-help]:Help \\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend") (defvar helm-read-file-name-mode-line-string "\\<helm-read-file-map>\\[helm-help]:Help C/\\[helm-cr-empty-string]:Empty \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend" "String displayed in mode-line in `helm-source-find-files'.") (defvar helm-top-mode-line "\\<helm-top-map>\\[helm-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend") (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-help" (quote ("helm-")))) (autoload (quote helm-gid) "helm-id-utils" "Preconfigured helm for `gid' command line of `ID-Utils'.
Need A database created with the command `mkid'
above `default-directory'.
Need id-utils as dependency which provide `mkid', `gid' etc...
See <https://www.gnu.org/software/idutils/>.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-id-utils" (quote ("helm-gid-")))) (autoload (quote helm-imenu) "helm-imenu" "Preconfigured `helm' for `imenu'.

(fn)" t nil) (autoload (quote helm-imenu-in-all-buffers) "helm-imenu" "Preconfigured helm for fetching imenu entries in all buffers with similar mode as current.
A mode is similar as current if it is the same, it is derived i.e `derived-mode-p'
or it have an association in `helm-imenu-all-buffer-assoc'.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-imenu" (quote ("helm-")))) (autoload (quote helm-info) "helm-info" "Preconfigured `helm' for searching Info files' indices.

With a prefix argument \\[universal-argument], set REFRESH to non-nil.

Optional parameter REFRESH, when non-nil, reevaluates
`helm-default-info-index-list'.  If the variable has been
customized, set it to its saved value.  If not, set it to its
standard value.  See `custom-reevaluate-setting' for more.

REFRESH is useful when new Info files are installed.  If
`helm-default-info-index-list' has not been customized, the new
Info files are made available.

(fn &optional REFRESH)" t nil) (autoload (quote helm-info-at-point) "helm-info" "Preconfigured `helm' for searching info at point.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-info" (quote ("helm-")))) (autoload (quote helm-projects-find-files) "helm-locate" "Find files with locate in `helm-locate-project-list'.
With a prefix arg refresh the database in each project.

(fn UPDATE)" t nil) (autoload (quote helm-locate) "helm-locate" "Preconfigured `helm' for Locate.
Note: you can add locate options after entering pattern.
See 'man locate' for valid options and also `helm-locate-command'.

You can specify a local database with prefix argument ARG.
With two prefix arg, refresh the current local db or create it
if it doesn't exists.

To create a user specific db, use
\"updatedb -l 0 -o db_path -U directory\".
Where db_path is a filename matched by
`helm-locate-db-file-regexp'.

(fn ARG)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-locate" (quote ("helm-")))) (autoload (quote helm-man-woman) "helm-man" "Preconfigured `helm' for Man and Woman pages.
With a prefix arg reinitialize the cache.

(fn ARG)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-man" (quote ("helm-")))) (autoload (quote helm-world-time) "helm-misc" "Preconfigured `helm' to show world time.
Default action change TZ environment variable locally to emacs.

(fn)" t nil) (autoload (quote helm-insert-latex-math) "helm-misc" "Preconfigured helm for latex math symbols completion.

(fn)" t nil) (autoload (quote helm-ratpoison-commands) "helm-misc" "Preconfigured `helm' to execute ratpoison commands.

(fn)" t nil) (autoload (quote helm-stumpwm-commands) "helm-misc" "Preconfigured helm for stumpwm commands.

(fn)" t nil) (autoload (quote helm-minibuffer-history) "helm-misc" "Preconfigured `helm' for `minibuffer-history'.

(fn)" t nil) (autoload (quote helm-comint-input-ring) "helm-misc" "Preconfigured `helm' that provide completion of `comint' history.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-misc" (quote ("helm-")))) (autoload (quote helm-comp-read) "helm-mode" "Read a string in the minibuffer, with helm completion.

It is helm `completing-read' equivalent.

- PROMPT is the prompt name to use.

- COLLECTION can be a list, vector, obarray or hash-table.
  It can be also a function that receives three arguments:
  the values string, predicate and t. See `all-completions' for more details.

Keys description:

- TEST: A predicate called with one arg i.e candidate.

- INITIAL-INPUT: Same as input arg in `helm'.

- PRESELECT: See preselect arg of `helm'.

- DEFAULT: This option is used only for compatibility with regular
  Emacs `completing-read' (Same as DEFAULT arg of `completing-read').

- BUFFER: Name of helm-buffer.

- MUST-MATCH: Candidate selected must be one of COLLECTION.

- FUZZY: Enable fuzzy matching.

- REVERSE-HISTORY: When non--nil display history source after current
  source completion.

- REQUIRES-PATTERN: Same as helm attribute, default is 0.

- HISTORY: A list containing specific history, default is nil.
  When it is non--nil, all elements of HISTORY are displayed in
  a special source before COLLECTION.

- INPUT-HISTORY: A symbol. the minibuffer input history will be
  stored there, if nil or not provided, `minibuffer-history'
  will be used instead.

- CASE-FOLD: Same as `helm-case-fold-search'.

- DEL-INPUT: Boolean, when non--nil (default) remove the partial
  minibuffer input from HISTORY is present.

- PERSISTENT-ACTION: A function called with one arg i.e candidate.

- PERSISTENT-HELP: A string to document PERSISTENT-ACTION.

- MODE-LINE: A string or list to display in mode line.
  Default is `helm-comp-read-mode-line'.

- KEYMAP: A keymap to use in this `helm-comp-read'.
  (the keymap will be shared with history source)

- NAME: The name related to this local source.

- HEADER-NAME: A function to alter NAME, see `helm'.

- EXEC-WHEN-ONLY-ONE: Bound `helm-execute-action-at-once-if-one'
  to non--nil. (possibles values are t or nil).

- VOLATILE: Use volatile attribute.

- SORT: A predicate to give to `sort' e.g `string-lessp'
  Use this only on small data as it is ineficient.
  If you want to sort faster add a sort function to
  FC-TRANSFORMER.
  Note that FUZZY when enabled is already providing a sort function.

- FC-TRANSFORMER: A `filtered-candidate-transformer' function
  or a list of functions.

- HIST-FC-TRANSFORMER: A `filtered-candidate-transformer'
  function for the history source.

- MARKED-CANDIDATES: If non--nil return candidate or marked candidates as a list.

- NOMARK: When non--nil don't allow marking candidates.

- ALISTP: (default is non--nil) See `helm-comp-read-get-candidates'.

- CANDIDATES-IN-BUFFER: when non--nil use a source build with
  `helm-source-in-buffer' which is much faster.
  Argument VOLATILE have no effect when CANDIDATES-IN-BUFFER is non--nil.

- MATCH-PART: Allow matching only one part of candidate.
  See match-part documentation in `helm-source'.

- ALLOW-NEST: Allow nesting this `helm-comp-read' in a helm session.
  See `helm'.

- MULTILINE: See multiline in `helm-source'.

Any prefix args passed during `helm-comp-read' invocation will be recorded
in `helm-current-prefix-arg', otherwise if prefix args were given before
`helm-comp-read' invocation, the value of `current-prefix-arg' will be used.
That's mean you can pass prefix args before or after calling a command
that use `helm-comp-read' See `helm-M-x' for example.

(fn PROMPT COLLECTION &key TEST INITIAL-INPUT DEFAULT PRESELECT (BUFFER \"*Helm Completions*\") MUST-MATCH FUZZY REVERSE-HISTORY (REQUIRES-PATTERN 0) HISTORY INPUT-HISTORY (CASE-FOLD helm-comp-read-case-fold-search) (DEL-INPUT t) (PERSISTENT-ACTION nil) (PERSISTENT-HELP \"DoNothing\") (MODE-LINE helm-comp-read-mode-line) HELP-MESSAGE (KEYMAP helm-comp-read-map) (NAME \"Helm Completions\") HEADER-NAME CANDIDATES-IN-BUFFER MATCH-PART EXEC-WHEN-ONLY-ONE QUIT-WHEN-NO-CAND (VOLATILE t) SORT FC-TRANSFORMER HIST-FC-TRANSFORMER MARKED-CANDIDATES NOMARK (ALISTP t) (CANDIDATE-NUMBER-LIMIT helm-candidate-number-limit) MULTILINE ALLOW-NEST)" nil nil) (autoload (quote helm-read-file-name) "helm-mode" "Read a file name with helm completion.
It is helm `read-file-name' emulation.

Argument PROMPT is the default prompt to use.

Keys description:

- NAME: Source name, default to \"Read File Name\".

- INITIAL-INPUT: Where to start read file name, default to `default-directory'.

- BUFFER: `helm-buffer' name default to \"*Helm Completions*\".

- TEST: A predicate called with one arg 'candidate'.

- CASE-FOLD: Same as `helm-case-fold-search'.

- PRESELECT: helm preselection.

- HISTORY: Display HISTORY in a special source.

- MUST-MATCH: Can be 'confirm, nil, or t.

- FUZZY: Enable fuzzy matching when non-nil (Enabled by default).

- MARKED-CANDIDATES: When non--nil return a list of marked candidates.

- NOMARK: When non--nil don't allow marking candidates.

- ALISTP: Don't use `all-completions' in history (take effect only on history).

- PERSISTENT-ACTION-IF: a persistent if action function.

- PERSISTENT-HELP: persistent help message.

- MODE-LINE: A mode line message, default is `helm-read-file-name-mode-line-string'.

(fn PROMPT &key (NAME \"Read File Name\") (INITIAL-INPUT default-directory) (BUFFER \"*Helm file completions*\") TEST (CASE-FOLD helm-file-name-case-fold-search) PRESELECT HISTORY MUST-MATCH (FUZZY t) DEFAULT MARKED-CANDIDATES (CANDIDATE-NUMBER-LIMIT helm-ff-candidate-number-limit) NOMARK (ALISTP t) (PERSISTENT-ACTION-IF \\='helm-find-files-persistent-action-if) (PERSISTENT-HELP \"Hit1 Expand Candidate, Hit2 or (C-u) Find file\") (MODE-LINE helm-read-file-name-mode-line-string))" nil nil) (defvar helm-mode nil "Non-nil if Helm mode is enabled.
See the `helm-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `helm-mode'.") (custom-autoload (quote helm-mode) "helm-mode" nil) (autoload (quote helm-mode) "helm-mode" "Toggle generic helm completion.

All functions in Emacs that use `completing-read'
or `read-file-name' and friends will use helm interface
when this mode is turned on.
However you can modify this behavior for functions of your choice
with `helm-completing-read-handlers-alist'.

Called with a positive arg, turn on unconditionally, with a
negative arg turn off.
You can turn it on with `helm-mode'.

Some crap emacs functions may not be supported,
e.g `ffap-alternate-file' and maybe others
You can add such functions to `helm-completing-read-handlers-alist'
with a nil value.

About `ido-mode':
When you are using `helm-mode', DO NOT use `ido-mode', instead if you
want some commands use `ido' add these commands to
`helm-completing-read-handlers-alist' with ido as value.

Note: This mode is incompatible with Emacs23.

(fn &optional ARG)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-mode" (quote ("helm-")))) (autoload (quote helm-browse-url-firefox) "helm-net" "Same as `browse-url-firefox' but detach from emacs.

So when you quit emacs you can keep your firefox session open
and not be prompted to kill firefox process.

NOTE: Probably not supported on some systems (e.g Windows).

(fn URL &optional IGNORE)" t nil) (autoload (quote helm-browse-url-opera) "helm-net" "Browse URL with opera browser and detach from emacs.

So when you quit emacs you can keep your opera session open
and not be prompted to kill opera process.

NOTE: Probably not supported on some systems (e.g Windows).

(fn URL &optional IGNORE)" t nil) (autoload (quote helm-browse-url-chromium) "helm-net" "Browse URL with google chrome browser.

(fn URL &optional IGNORE)" t nil) (autoload (quote helm-browse-url-uzbl) "helm-net" "Browse URL with uzbl browser.

(fn URL &optional IGNORE)" t nil) (autoload (quote helm-browse-url-conkeror) "helm-net" "Browse URL with conkeror browser.

(fn URL &optional IGNORE)" t nil) (autoload (quote helm-surfraw) "helm-net" "Preconfigured `helm' to search PATTERN with search ENGINE.

(fn PATTERN ENGINE)" t nil) (autoload (quote helm-google-suggest) "helm-net" "Preconfigured `helm' for google search with google suggest.

(fn)" t nil) (autoload (quote helm-wikipedia-suggest) "helm-net" "Preconfigured `helm' for Wikipedia lookup with Wikipedia suggest.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-net" (quote ("helm-")))) (autoload (quote helm-org-agenda-files-headings) "helm-org" "Preconfigured helm for org files headings.

(fn)" t nil) (autoload (quote helm-org-in-buffer-headings) "helm-org" "Preconfigured helm for org buffer headings.

(fn)" t nil) (autoload (quote helm-org-parent-headings) "helm-org" "Preconfigured helm for org headings that are parents of the
current heading.

(fn)" t nil) (autoload (quote helm-org-capture-templates) "helm-org" "Preconfigured helm for org templates.

(fn)" t nil) (autoload (quote helm-org-completing-read-tags) "helm-org" "Completing read function for Org tags.

This function is used as a `completing-read' function in
`helm-completing-read-handlers-alist' by `org-set-tags' and
`org-capture'.

NOTE: Org tag completion will work only if you disable org fast tag
selection, see (info \"(org) setting tags\").

(fn PROMPT COLLECTION PRED REQ INITIAL HIST DEF INHERIT-INPUT-METHOD NAME BUFFER)" nil nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-org" (quote ("helm-")))) (autoload (quote helm-moccur-mode) "helm-regexp" "Major mode to provide actions in helm moccur saved buffer.

Special commands:
\\{helm-moccur-mode-map}

(fn)" t nil) (autoload (quote helm-regexp) "helm-regexp" "Preconfigured helm to build regexps.
`query-replace-regexp' can be run from there against found regexp.

(fn)" t nil) (autoload (quote helm-occur) "helm-regexp" "Preconfigured helm for searching lines matching pattern in `current-buffer'.

When `helm-source-occur' is member of
`helm-sources-using-default-as-input' which is the default,
symbol at point is searched at startup.

When a region is marked search only in this region by narrowing.

To search in multiples buffers start from one of the commands listing
buffers (i.e. a helm command using `helm-source-buffers-list' like
`helm-mini') and use the multi occur buffers action.

This is the helm implementation that collect lines matching pattern
like vanilla emacs `occur' but have nothing to do with it, the search
engine beeing completely different.

(fn)" t nil) (autoload (quote helm-occur-from-isearch) "helm-regexp" "Invoke `helm-occur' from isearch.

(fn)" t nil) (autoload (quote helm-multi-occur-from-isearch) "helm-regexp" "Invoke `helm-multi-occur' from isearch.

With a prefix arg, reverse the behavior of
`helm-moccur-always-search-in-current'.
The prefix arg can be set before calling
`helm-multi-occur-from-isearch' or during the buffer selection.

(fn &optional ARG)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-regexp" (quote ("helm-")))) (autoload (quote helm-mark-ring) "helm-ring" "Preconfigured `helm' for `helm-source-mark-ring'.

(fn)" t nil) (autoload (quote helm-global-mark-ring) "helm-ring" "Preconfigured `helm' for `helm-source-global-mark-ring'.

(fn)" t nil) (autoload (quote helm-all-mark-rings) "helm-ring" "Preconfigured `helm' for `helm-source-global-mark-ring' and `helm-source-mark-ring'.

(fn)" t nil) (autoload (quote helm-register) "helm-ring" "Preconfigured `helm' for Emacs registers.

(fn)" t nil) (autoload (quote helm-show-kill-ring) "helm-ring" "Preconfigured `helm' for `kill-ring'.
It is drop-in replacement of `yank-pop'.

First call open the kill-ring browser, next calls move to next line.

(fn)" t nil) (autoload (quote helm-execute-kmacro) "helm-ring" "Preconfigured helm for keyboard macros.
Define your macros with `f3' and `f4'.
See (info \"(emacs) Keyboard Macros\") for detailed infos.
This command is useful when used with persistent action.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-ring" (quote ("helm-")))) (autoload (quote helm-semantic) "helm-semantic" "Preconfigured `helm' for `semantic'.
If ARG is supplied, pre-select symbol at point instead of current

(fn ARG)" t nil) (autoload (quote helm-semantic-or-imenu) "helm-semantic" "Preconfigured helm for `semantic' or `imenu'.
If ARG is supplied, pre-select symbol at point instead of current
semantic tag in scope.

If `semantic-mode' is active in the current buffer, then use
semantic for generating tags, otherwise fall back to `imenu'.
Fill in the symbol at point by default.

(fn ARG)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-semantic" (quote ("helm-s")))) (defvar helm-top-poll-mode nil "Non-nil if Helm-Top-Poll mode is enabled.
See the `helm-top-poll-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `helm-top-poll-mode'.") (custom-autoload (quote helm-top-poll-mode) "helm-sys" nil) (autoload (quote helm-top-poll-mode) "helm-sys" "Refresh automatically helm top buffer once enabled.

(fn &optional ARG)" t nil) (autoload (quote helm-top) "helm-sys" "Preconfigured `helm' for top command.

(fn)" t nil) (autoload (quote helm-list-emacs-process) "helm-sys" "Preconfigured `helm' for emacs process.

(fn)" t nil) (autoload (quote helm-xrandr-set) "helm-sys" "Preconfigured helm for xrandr.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-sys" (quote ("helm-")))) (autoload (quote helm-etags-select) "helm-tags" "Preconfigured helm for etags.
If called with a prefix argument REINIT
or if any of the tag files have been modified, reinitialize cache.

This function aggregates three sources of tag files:

  1) An automatically located file in the parent directories,
     by `helm-etags-get-tag-file'.
  2) `tags-file-name', which is commonly set by `find-tag' command.
  3) `tags-table-list' which is commonly set by `visit-tags-table' command.

(fn REINIT)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-tags" (quote ("helm-")))) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-types" (quote ("helm-")))) (defvar helm-popup-tip-mode nil "Non-nil if Helm-Popup-Tip mode is enabled.
See the `helm-popup-tip-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `helm-popup-tip-mode'.") (custom-autoload (quote helm-popup-tip-mode) "helm-utils" nil) (autoload (quote helm-popup-tip-mode) "helm-utils" "Show help-echo informations in a popup tip at end of line.

(fn &optional ARG)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-utils" (quote ("helm-" "with-helm-display-marked-candidates")))) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "helm-x-files" (quote ("helm-")))) (provide (quote helm-autoloads))) "dash" ((dash-autoloads dash) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "dash" (quote ("dash-" "-keep" "-butlast" "-non" "-only-some" "-zip" "-e" "->" "-a" "-gr" "-when-let" "-d" "-l" "-s" "-p" "-r" "-m" "-i" "-f" "-u" "-value-to-list" "-t" "--" "-c" "!cons" "!cdr")))) (provide (quote dash-autoloads))) "epl" ((epl-autoloads epl) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "epl" (quote ("epl-")))) (provide (quote epl-autoloads))) "pkg-info" ((pkg-info pkg-info-autoloads) (autoload (quote pkg-info-library-original-version) "pkg-info" "Get the original version in the header of LIBRARY.

The original version is stored in the X-Original-Version header.
This header is added by the MELPA package archive to preserve
upstream version numbers.

LIBRARY is either a symbol denoting a named feature, or a library
name as string.

If SHOW is non-nil, show the version in the minibuffer.

Return the version from the header of LIBRARY as list.  Signal an
error if the LIBRARY was not found or had no X-Original-Version
header.

See Info node `(elisp)Library Headers' for more information
about library headers.

(fn LIBRARY &optional SHOW)" t nil) (autoload (quote pkg-info-library-version) "pkg-info" "Get the version in the header of LIBRARY.

LIBRARY is either a symbol denoting a named feature, or a library
name as string.

If SHOW is non-nil, show the version in the minibuffer.

Return the version from the header of LIBRARY as list.  Signal an
error if the LIBRARY was not found or had no proper header.

See Info node `(elisp)Library Headers' for more information
about library headers.

(fn LIBRARY &optional SHOW)" t nil) (autoload (quote pkg-info-defining-library-original-version) "pkg-info" "Get the original version of the library defining FUNCTION.

The original version is stored in the X-Original-Version header.
This header is added by the MELPA package archive to preserve
upstream version numbers.

If SHOW is non-nil, show the version in mini-buffer.

This function is mainly intended to find the version of a major
or minor mode, i.e.

   (pkg-info-defining-library-version 'flycheck-mode)

Return the version of the library defining FUNCTION.  Signal an
error if FUNCTION is not a valid function, if its defining
library was not found, or if the library had no proper version
header.

(fn FUNCTION &optional SHOW)" t nil) (autoload (quote pkg-info-defining-library-version) "pkg-info" "Get the version of the library defining FUNCTION.

If SHOW is non-nil, show the version in mini-buffer.

This function is mainly intended to find the version of a major
or minor mode, i.e.

   (pkg-info-defining-library-version 'flycheck-mode)

Return the version of the library defining FUNCTION.  Signal an
error if FUNCTION is not a valid function, if its defining
library was not found, or if the library had no proper version
header.

(fn FUNCTION &optional SHOW)" t nil) (autoload (quote pkg-info-package-version) "pkg-info" "Get the version of an installed PACKAGE.

If SHOW is non-nil, show the version in the minibuffer.

Return the version as list, or nil if PACKAGE is not installed.

(fn PACKAGE &optional SHOW)" t nil) (autoload (quote pkg-info-version-info) "pkg-info" "Obtain complete version info for LIBRARY and PACKAGE.

LIBRARY is a symbol denoting a named feature, or a library name
as string.  PACKAGE is a symbol denoting an ELPA package.  If
omitted or nil, default to LIBRARY.

If SHOW is non-nil, show the version in the minibuffer.

When called interactively, prompt for LIBRARY.  When called
interactively with prefix argument, prompt for PACKAGE as well.

Return a string with complete version information for LIBRARY.
This version information contains the version from the headers of
LIBRARY, and the version of the installed PACKAGE, the LIBRARY is
part of.  If PACKAGE is not installed, or if the PACKAGE version
is the same as the LIBRARY version, do not include a package
version.

(fn LIBRARY &optional PACKAGE SHOW)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "pkg-info" (quote ("pkg-info-")))) (provide (quote pkg-info-autoloads))) "flycheck" ((flycheck-autoloads flycheck-buttercup flycheck-ert flycheck) (autoload (quote flycheck-manual) "flycheck" "Open the Flycheck manual.

(fn)" t nil) (autoload (quote flycheck-mode) "flycheck" "Minor mode for on-the-fly syntax checking.

When called interactively, toggle `flycheck-mode'.  With prefix
ARG, enable `flycheck-mode' if ARG is positive, otherwise disable
it.

When called from Lisp, enable `flycheck-mode' if ARG is omitted,
nil or positive.  If ARG is `toggle', toggle `flycheck-mode'.
Otherwise behave as if called interactively.

In `flycheck-mode' the buffer is automatically syntax-checked
using the first suitable syntax checker from `flycheck-checkers'.
Use `flycheck-select-checker' to select a checker for the current
buffer manually.

\\{flycheck-mode-map}

(fn &optional ARG)" t nil) (defvar global-flycheck-mode nil "Non-nil if Global Flycheck mode is enabled.
See the `global-flycheck-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-flycheck-mode'.") (custom-autoload (quote global-flycheck-mode) "flycheck" nil) (autoload (quote global-flycheck-mode) "flycheck" "Toggle Flycheck mode in all buffers.
With prefix ARG, enable Global Flycheck mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Flycheck mode is enabled in all buffers where
`flycheck-mode-on-safe' would do it.
See `flycheck-mode' for more information on Flycheck mode.

(fn &optional ARG)" t nil) (autoload (quote flycheck-define-error-level) "flycheck" "Define a new error LEVEL with PROPERTIES.

The following PROPERTIES constitute an error level:

`:severity SEVERITY'
     A number denoting the severity of this level.  The higher
     the number, the more severe is this level compared to other
     levels.  Defaults to 0.

     The severity is used by `flycheck-error-level-<' to
     determine the ordering of errors according to their levels.

`:compilation-level LEVEL'

     A number indicating the broad class of messages that errors
     at this level belong to: one of 0 (info), 1 (warning), or
     2 or nil (error).  Defaults to nil.

     This is used by `flycheck-checker-pattern-to-error-regexp'
     to map error levels into `compilation-mode''s hierarchy and
     to get proper highlighting of errors in `compilation-mode'.

`:overlay-category CATEGORY'
     A symbol denoting the overlay category to use for error
     highlight overlays for this level.  See Info
     node `(elisp)Overlay Properties' for more information about
     overlay categories.

     A category for an error level overlay should at least define
     the `face' property, for error highlighting.  Another useful
     property for error level categories is `priority', to
     influence the stacking of multiple error level overlays.

`:fringe-bitmap BITMAP'
     A fringe bitmap symbol denoting the bitmap to use for fringe
     indicators for this level.  See Info node `(elisp)Fringe
     Bitmaps' for more information about fringe bitmaps,
     including a list of built-in fringe bitmaps.

`:fringe-face FACE'
     A face symbol denoting the face to use for fringe indicators
     for this level.

`:error-list-face FACE'
     A face symbol denoting the face to use for messages of this
     level in the error list.  See `flycheck-list-errors'.

(fn LEVEL &rest PROPERTIES)" nil nil) (function-put (quote flycheck-define-error-level) (quote lisp-indent-function) (quote 1)) (autoload (quote flycheck-define-command-checker) "flycheck" "Define SYMBOL as syntax checker to run a command.

Define SYMBOL as generic syntax checker via
`flycheck-define-generic-checker', which uses an external command
to check the buffer.  SYMBOL and DOCSTRING are the same as for
`flycheck-define-generic-checker'.

In addition to the properties understood by
`flycheck-define-generic-checker', the following PROPERTIES
constitute a command syntax checker.  Unless otherwise noted, all
properties are mandatory.  Note that the default `:error-filter'
of command checkers is `flycheck-sanitize-errors'.

`:command COMMAND'
     The command to run for syntax checking.

     COMMAND is a list of the form `(EXECUTABLE [ARG ...])'.

     EXECUTABLE is a string with the executable of this syntax
     checker.  It can be overridden with the variable
     `flycheck-SYMBOL-executable'.  Note that this variable is
     NOT implicitly defined by this function.  Use
     `flycheck-def-executable-var' to define this variable.

     Each ARG is an argument to the executable, either as string,
     or as special symbol or form for
     `flycheck-substitute-argument', which see.

`:error-patterns PATTERNS'
     A list of patterns to parse the output of the `:command'.

     Each ITEM in PATTERNS is a list `(LEVEL SEXP ...)', where
     LEVEL is a Flycheck error level (see
     `flycheck-define-error-level'), followed by one or more RX
     `SEXP's which parse an error of that level and extract line,
     column, file name and the message.

     See `rx' for general information about RX, and
     `flycheck-rx-to-string' for some special RX forms provided
     by Flycheck.

     All patterns are applied in the order of declaration to the
     whole output of the syntax checker.  Output already matched
     by a pattern will not be matched by subsequent patterns.  In
     other words, the first pattern wins.

     This property is optional.  If omitted, however, an
     `:error-parser' is mandatory.

`:error-parser FUNCTION'
     A function to parse errors with.

     The function shall accept three arguments OUTPUT CHECKER
     BUFFER.  OUTPUT is the syntax checker output as string,
     CHECKER the syntax checker that was used, and BUFFER a
     buffer object representing the checked buffer.  The function
     must return a list of `flycheck-error' objects parsed from
     OUTPUT.

     This property is optional.  If omitted, it defaults to
     `flycheck-parse-with-patterns'.  In this case,
     `:error-patterns' is mandatory.

`:standard-input t'
     Whether to send the buffer contents on standard input.

     If this property is given and has a non-nil value, send the
     contents of the buffer on standard input.

     Defaults to nil.

Note that you may not give `:start', `:interrupt', and
`:print-doc' for a command checker.  You can give a custom
`:verify' function, though, whose results will be appended to the
default `:verify' function of command checkers.

(fn SYMBOL DOCSTRING &rest PROPERTIES)" nil nil) (function-put (quote flycheck-define-command-checker) (quote lisp-indent-function) (quote 1)) (function-put (quote flycheck-define-command-checker) (quote doc-string-elt) (quote 2)) (autoload (quote flycheck-def-config-file-var) "flycheck" "Define SYMBOL as config file variable for CHECKER, with default FILE-NAME.

SYMBOL is declared as customizable variable using `defcustom', to
provide a configuration file for the given syntax CHECKER.
CUSTOM-ARGS are forwarded to `defcustom'.

FILE-NAME is the initial value of the new variable.  If omitted,
the default value is nil.

Use this together with the `config-file' form in the `:command'
argument to `flycheck-define-checker'.

(fn SYMBOL CHECKER &optional FILE-NAME &rest CUSTOM-ARGS)" nil t) (function-put (quote flycheck-def-config-file-var) (quote lisp-indent-function) (quote 3)) (autoload (quote flycheck-def-option-var) "flycheck" "Define SYMBOL as option variable with INIT-VALUE for CHECKER.

SYMBOL is declared as customizable variable using `defcustom', to
provide an option for the given syntax CHECKERS (a checker or a
list of checkers).  INIT-VALUE is the initial value of the
variable, and DOCSTRING is its docstring.  CUSTOM-ARGS are
forwarded to `defcustom'.

Use this together with the `option', `option-list' and
`option-flag' forms in the `:command' argument to
`flycheck-define-checker'.

(fn SYMBOL INIT-VALUE CHECKERS DOCSTRING &rest CUSTOM-ARGS)" nil t) (function-put (quote flycheck-def-option-var) (quote lisp-indent-function) (quote 3)) (function-put (quote flycheck-def-option-var) (quote doc-string-elt) (quote 4)) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "flycheck" (quote ("flycheck-" "list-flycheck-errors" "locate-rebar3-project-root" "contains-rebar-config" "help-flycheck-checker-d" "read-flycheck-")))) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "flycheck-buttercup" (quote ("flycheck-buttercup-format-error-list")))) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "flycheck-ert" (quote ("flycheck-er")))) (provide (quote flycheck-autoloads))) "ace-isearch" ((ace-isearch ace-isearch-autoloads) (autoload (quote ace-isearch-jump-during-isearch) "ace-isearch" "Jump to the one of the current isearch candidates.

(fn)" t nil) (autoload (quote ace-isearch-mode) "ace-isearch" "Minor-mode which combines isearch, ace-jump-mode, avy, helm-swoop and swiper seamlessly.

(fn &optional ARG)" t nil) (defvar global-ace-isearch-mode nil "Non-nil if Global Ace-Isearch mode is enabled.
See the `global-ace-isearch-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-ace-isearch-mode'.") (custom-autoload (quote global-ace-isearch-mode) "ace-isearch" nil) (autoload (quote global-ace-isearch-mode) "ace-isearch" "Toggle Ace-Isearch mode in all buffers.
With prefix ARG, enable Global Ace-Isearch mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Ace-Isearch mode is enabled in all buffers where
`ace-isearch--turn-on' would do it.
See `ace-isearch-mode' for more information on Ace-Isearch mode.

(fn &optional ARG)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "ace-isearch" (quote ("ace-isearch-")))) (provide (quote ace-isearch-autoloads))) "dired-du" ((dired-du-autoloads dired-du dired-du-tests) (autoload (quote dired-du-mode) "dired-du" "Toggle dired-du mode.
Interactively with no argument, this command toggles the mode.
A positive prefix argument enables the mode, any other prefix
argument disables it.  From Lisp, argument omitted or nil enables
the mode, `toggle' toggles the state.

Show the recursive size of directories in Dired buffers.
Once this mode is enabled, every new Dired buffer displays
recursive dir sizes.
The directory size is obtained with `dired-du-used-space-program'.

Note that obtaining the recursive size of all the directories
in a Dired buffer might be slow; thus, it may significantly delay
the time to display a new Dired buffer.

Instead of enabling `dired-du-mode' by default in all Dired buffers
you might prefer to use this mode as a convenient interfaz to
the `du' program: just enable it in the current Dired buffer,
and disable it once you have finished checking the used space.

(fn &optional ARG)" t nil) (autoload (quote dired-du-count-sizes) "dired-du" "Count sizes of files marked with MARK.
If MARK evaluates nil, then use `dired-marker-char'.

Optional arg ALL-MARKS, if non-nil, then accept all mark characters.

Optional arg INCLUDE-DIRS, if non-nil, include the recursive size of the
marked directories.
If called interactively with a prefix, then prompt for previous
args.  Otherwise, all optional arguments but INCLUDE-DIRS are nil, and
INCLUDE-DIRS is set to variable `dired-du-mode'.

Directories '.' '..' are not special: if they are marked, then return
their recursive size.

(fn MARK &optional ALL-MARKS INCLUDE-DIRS)" t nil) (autoload (quote dired-du-insert-marked-dirs) "dired-du" "Insert all marked subdirectories.

(fn)" t nil) (if (fboundp (quote register-definition-prefixes)) (register-definition-prefixes "dired-du" (quote ("dired-du-")))) (provide (quote dired-du-autoloads)))))

("org-elpa" "melpa" "gnu-elpa" "emacsmirror" "straight" "use-package" "bind-key" "helm" "async" "popup" "cl-lib" "helm-core" "rainbow-delimiters" "neotree" "volatile-highlights" "smooth-scroll" "hlinum" "undohist" "anzu" "shell-pop" "web-mode" "beacon" "seq" "mozc" "flycheck" "dash" "pkg-info" "epl" "ace-isearch" "dired-du")

t
