
((digest . "7fe7c8d7b898d8ede1b3fcf199de072b") (undo-list ("
;;;### (autoloads nil \"neotree/neotree\" \"neotree/neotree.el\" (0 0
;;;;;;  0 0))
;;; Generated autoloads from neotree/neotree.el

(autoload 'neotree-find \"neotree/neotree\" \"\\
Quick select node which specified PATH in NeoTree.
If path is nil and no buffer file name, then use DEFAULT-PATH,

\\(fn &optional PATH DEFAULT-PATH)\" t nil)

(autoload 'neotree-projectile-action \"neotree/neotree\" \"\\
Integration with `Projectile'.

Usage:
    (setq projectile-switch-project-action 'neotree-projectile-action).

When running `projectile-switch-project' (C-c p p), `neotree' will change root
automatically.

\\(fn)\" t nil)

(autoload 'neotree-toggle \"neotree/neotree\" \"\\
Toggle show the NeoTree window.

\\(fn)\" t nil)

(autoload 'neotree-show \"neotree/neotree\" \"\\
Show the NeoTree window.

\\(fn)\" t nil)

(autoload 'neotree-hide \"neotree/neotree\" \"\\
Close the NeoTree window.

\\(fn)\" t nil)

(autoload 'neotree-dir \"neotree/neotree\" \"\\
Show the NeoTree window, and change root to PATH.

\\(fn PATH)\" t nil)

(defalias 'neotree 'neotree-show \"\\
Show the NeoTree window.\")

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes \"neotree/neotree\" '(\"neo\" \"off-p\")))

;;;***
" . -15626) (t 23329 11974 0 0)))
