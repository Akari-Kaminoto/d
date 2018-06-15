((ac-anything status "required" recipe
              (:name ac-anything :auto-generated t :type emacswiki :description "Auto Complete with Anything" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/ac-anything.el"))
 (ac-php status "required" recipe
         (:name ac-php :description "Auto complete source for php" :type github :pkgname "xcwen/ac-php" :depends
                (php-mode auto-complete yasnippet xcscope f s)))
 (ace-window status "required" recipe
             (:name ace-window :description "Quickly switch windows using `avy'" :type github :pkgname "abo-abo/ace-window" :depends
                    (avy)))
 (auto-complete status "required" recipe
                (:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
                       (popup fuzzy)
                       :features auto-complete-config :post-init
                       (progn
                         (add-to-list 'ac-dictionary-directories
                                      (expand-file-name "dict" default-directory))
                         (ac-config-default))))
 (auto-highlight-symbol status "required" recipe
                        (:name auto-highlight-symbol :type github :pkgname "emacsmirror/auto-highlight-symbol" :description "Automatic highlighting current symbol minor mode" :website "https://github.com/emacsmirror/auto-highlight-symbol/"))
 (avy status "required" recipe
      (:name avy :description "Jump to things in Emacs tree-style." :type github :pkgname "abo-abo/avy" :depends
             (cl-lib)))
 (bar-cursor status "required" recipe nil)
 (c-eldoc status "installed" recipe
          (:name c-eldoc :description "eldoc-mode plugin for C source code" :type github :pkgname "nflath/c-eldoc" :post-init
                 (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)))
 (calendar+ status "required" recipe
            (:name calendar+ :auto-generated t :type emacswiki :description "Calendar, diary and appointments stuff." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/calendar+.el"))
 (cl-lib status "required" recipe
         (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :website "http://elpa.gnu.org/packages/cl-lib.html"))
 (dash status "required" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (dired+ status "installed" recipe
         (:name dired+ :description "Extensions to Dired" :type emacswiki :features dired+))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
                ("el-get.*\\.el$" "methods/")
                :features el-get :post-init
                (when
                    (memq 'el-get
                          (bound-and-true-p package-activated-list))
                  (message "Deleting melpa bootstrap el-get")
                  (unless package--initialized
                    (package-initialize t))
                  (when
                      (package-installed-p 'el-get)
                    (let
                        ((feats
                          (delete-dups
                           (el-get-package-features
                            (el-get-elpa-package-directory 'el-get)))))
                      (el-get-elpa-delete-package 'el-get)
                      (dolist
                          (feat feats)
                        (unload-feature feat t))))
                  (require 'el-get))))
 (f status "required" recipe
    (:name f :website "https://github.com/rejeep/f.el" :description "Modern API for working with files and directories in Emacs" :depends
           (s dash)
           :type github :pkgname "rejeep/f.el"))
 (fuzzy status "required" recipe
        (:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (linum-ex status "installed" recipe
           (:name linum-ex :description "Display line numbers to the left of buffers" :type emacswiki :features linum-ex))
 (neotree status "installed" recipe
          (:name neotree :after nil :website "https://github.com/jaypei/emacs-neotree" :description "An Emacs tree plugin like NerdTree for Vim." :type github :branch "master" :pkgname "jaypei/emacs-neotree"))
 (php-mode status "required" recipe
           (:name php-mode :description "A PHP mode for GNU Emacs " :type github :pkgname "ejmr/php-mode" :website "https://github.com/ejmr/php-mode"))
 (popup status "required" recipe
        (:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :depends cl-lib :pkgname "auto-complete/popup-el"))
 (rainbow-delimiters status "required" recipe
                     (:name rainbow-delimiters :website "https://github.com/Fanael/rainbow-delimiters#readme" :description "Color nested parentheses, brackets, and braces according to their depth." :type github :pkgname "Fanael/rainbow-delimiters"))
 (s status "required" recipe
    (:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
 (smooth-scroll status "installed" recipe
                (:name smooth-scroll :description "Minor mode for smooth scrolling." :type emacswiki :features smooth-scroll))
 (undohist status "installed" recipe
           (:name undohist :type github :pkgname "m2ym/undohist-el" :description "Record and recover undo history" :website "http://d.hatena.ne.jp/m2ym/20090707/1246933894"))
 (volatile-highlights status "installed" recipe
                      (:name volatile-highlights :description "Minor mode for visual feedback on some operations in Emacs" :type github :pkgname "k-talo/volatile-highlights.el" :features volatile-highlights))
 (xcscope status "required" recipe
          (:name xcscope :description "Cscope interface for (X)Emacs" :type github :pkgname "dkogan/xcscope.el" :prepare
                 (progn
                   (add-hook 'c-mode-hook #'cscope-minor-mode)
                   (add-hook 'c++-mode-hook #'cscope-minor-mode)
                   (add-hook 'dired-mode-hook #'cscope-minor-mode))))
 (yasnippet status "required" recipe
            (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil)))
