;;;Last Updated:<2018/12/21 10:15:39 from ryuichi-VirtualBox by ryuichi>


;;; ロゴの設定
(setq fancy-splash-image (expand-file-name "~/.emacs.d/genm.png"))

;;; theme select:
(load-theme 'leuven t)


;;; PROXY設定
;;; いらない場合はコメントアウトすること

;;; Proxy設定
;; (setq url-proxy-services
;; 	'(("http" . "proxy-auth.xxxxxx.com:8050")
;; 	  ("https" . "proxy-auth.xxxxxx.com:8050")))

;; (setq url-http-proxy-basic-auth-storage
;; 	'(("proxy-auth.ntt-el.com:8050" ("Proxy" . "NjY1MTpha2FyaTNrYW1p"))))

;; ここまで

;; 予約語を色分けする
(global-font-lock-mode t)

;; カーソルカラーを緑に
(set-cursor-color "green")

;;;seq.el emacs v25 over
(require 'seq)

;;; load-path 追加
;; load-pathを追加する関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリ以下をload-pathに追加
(add-to-load-path "el-get" "elpa" "etc-el" "etc-el/polymode-master" )



;;; package系を使うための設定

;;; windowsの場合gitのpath設定など先に追加しておく
(when (eq system-type 'windows-nt) ; Windows
  ;;magit &git
  (setq magit-git-executable "C:/Program Files/Git/bin/git.exe")
  
  (add-to-list 'exec-path "C:/Program Files/Git/bin")
  )

;;
;; straight.el
;;

;; straight.el自身のインストールと初期設定を行ってくれる
(let ((bootstrap-file (concat user-emacs-directory "straight/repos/straight.el/bootstrap.el"))
      (bootstrap-version 3))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; use-packageをインストールする
(straight-use-package 'use-package)

;; オプションなしで自動的にuse-packageをstraight.elにフォールバックする
;; 本来は
;;(use-package hoge
;;    :straight t)
;;のように書く必要がある
(setq straight-use-package-by-default t)

;;; use-package 設定
;; use-package を require の代わりに使う
(if (require 'use-package nil t)
    (setq use-package-verbose t)
  (message "Use-package is unavailable!")
  (defmacro use-package (&rest _args)))

(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

(require 'use-package)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;;; el-get

;; load-path で ~/.emacs.d とか書かなくてよくなる
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; el-get
(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(require 'el-get)

;;; paradox
(use-package paradox
  :config
  (paradox-enable))

;;; package系終わり

;;;
;;; FILE CODE設定
;;;
(when (equal emacs-major-version 21) (require 'un-define))
;(set-language-environment "Japanese") ;; コメントアウトしないとdired化ける
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq default-file-name-coding-system 'japanese-shift-jis-dos) ;dired用

;;; hjsonが何故かSJISで開かれてしまうので追加
(modify-coding-system-alist 'file "\\.*json\\'" 'utf-8) 
(add-to-list 'auto-mode-alist '("\\.*json\\'" . json-mode))

;;; Makefileが何故かSJISで開かれてしまうので追加
(modify-coding-system-alist 'file "\\Makefile.*\\'" 'utf-8) 
(add-to-list 'auto-mode-alist '("\\Makefile*\\'" . makefile-mode))

;;; README.mdが何故かSJISで開かれてしまうので追加
(modify-coding-system-alist 'file "\\README.md\\'" 'utf-8)
(add-to-list 'auto-mode-alist '("\\ReadME.md\\'" . markdown-mode))

;;;
;;; CUI/GUIで分ける設定
;;;

;;
;; CUI時の設定
;;
(if (not window-system) (progn
  ;; 現在行をアンダーライン
  (setq hl-line-face 'underline)     ; 現在行をアンダーライン
  (global-hl-line-mode)

))
;;
;; GUI時の設定
;;
(if window-system (progn
  ;; 現在行に色をつける
  (global-hl-line-mode t)            ;現在行に色をつける
;;(set-face-background 'hl-line "spring green")

  ;; 初期フレームの設定
  (setq initial-frame-alist
          '((width . 100) (height . 40)))

  ;; 新規フレームのデフォルト設定
  (setq default-frame-alist
          '((width . 100) (height . 40)))

  ;;; gui時のみ speedbar
  (global-set-key (kbd "C-c m") 'speedbar)

  ;;; gui時のみマウススクロールでページアップダウン
  (require 'mouse)
    (xterm-mouse-mode t)
    (global-set-key [mouse-4] (lambda ()
                                (interactive)
                                (scroll-down 10)))
    (global-set-key [mouse-5] (lambda ()
                                (interactive)
                                (scroll-up 10)))
    (defun track-mouse (e))
    (setq mouse-sel-mode t)
  
    ))
;;; 共通のhi-line設定
(defvar global-hl-line-timer-exclude-modes '(todotxt-mode))
(defun global-hl-line-timer-function ()
  (unless (memq major-mode global-hl-line-timer-exclude-modes)
    (global-hl-line-unhighlight-all)
    (let ((global-hl-line-mode t))
      (global-hl-line-highlight))))
(setq global-hl-line-timer
      (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))
;;;
;;; CUI/GUIで分ける設定ここまで
;;;

;;; インデント設定

(setq-default c-basic-offset 4     ;;基本インデント量
              tab-width 4          ;;タブ幅
              indent-tabs-mode nil)  ;;インデントをタブでするかスペースでするか

;;; C,C++の設定
; ヘッダファイル(.h)をc++モードで開く
; cファイルもC++モードで開く
(setq auto-mode-alist
      (append '(("\\.[ch]$" . c++-mode))
              auto-mode-alist))

;; 自分の書き方にあわせて調整
(add-hook 'c++-mode-hook
          '(lambda ()
             ;;(setq tab-width 32)
             (setq tab-width 4)
             (setq c-basic-offset 4)
             ;; 以下 *:*1 -:*-1 ++:*2 --:*-2 *:*0.5 /:*-0.5
             (setq c++-auto-newline nil)
             (setq c++-tab-always-indent t)
             (c-set-offset 'access-label '/)
             (c-set-offset 'arglist-close 0)
             (c-set-offset 'arglist-cont 0)
             (c-set-offset 'arglist-cont-nonempty '++)
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'block-close 0)
             (c-set-offset 'block-open 0)
             (c-set-offset 'brace-entry-open 0)
             (c-set-offset 'brace-list-close 0)
             (c-set-offset 'brace-list-entry 0)
             (c-set-offset 'brace-list-intro '+)
             (c-set-offset 'brace-list-open 0)
             (c-set-offset 'c 1)
             (c-set-offset 'case-label '*)
             (c-set-offset 'catch-clause 0)
             (c-set-offset 'class-close '-)
             (c-set-offset 'class-open '-)
             (c-set-offset 'comment-intro 0)
             (c-set-offset 'cpp-macro 0)
             (c-set-offset 'cpp-macro-cont '+)
             (c-set-offset 'defun-block-intro '+)
             (c-set-offset 'defun-close '-)
             (c-set-offset 'defun-open '-)
             (c-set-offset 'do-while-closure 0)
             (c-set-offset 'else-clause 0)
             (c-set-offset 'extern-lang-close '+)
             (c-set-offset 'extern-lang-open '+)
             (c-set-offset 'friend 0)
             (c-set-offset 'func-decl-cont '+)
             (c-set-offset 'inclass '+)
             (c-set-offset 'inextern-lang '+)
             (c-set-offset 'inexpr-statement 0)
             (c-set-offset 'inexpr-class '+)
             (c-set-offset 'inher-cont '+)
             (c-set-offset 'inher-intro '+)
             (c-set-offset 'inline-close 0)
             (c-set-offset 'inline-open '+)
             (c-set-offset 'innamespace '+)
             (c-set-offset 'label 0)
             (c-set-offset 'member-init-cont 0)
             (c-set-offset 'member-init-intro 0)
             (c-set-offset 'namespace-close 0)
             (c-set-offset 'namespace-open 0)
             (c-set-offset 'statement 0)
             (c-set-offset 'statement-block-intro '+)
             (c-set-offset 'statement-case-intro '*)
             (c-set-offset 'statement-case-open '*)
             (c-set-offset 'statement-cont '+)
             (c-set-offset 'stream-op '+)
             (c-set-offset 'string 0)
             (c-set-offset 'substatement '*)
             (c-set-offset 'substatement-open 0)
             (c-set-offset 'template-args-cont '+)
             (c-set-offset 'topmost-intro 0)
             (c-set-offset 'topmost-intro-cont 0)
             ))

(defun my-c-mode-common-conf ()
  ; ";"や"{"などをを入力した場合現在の行を自動インデントを有効にする
  (c-toggle-electric-state 1)
  ; カッコを強調表示する  
  (show-paren-mode t)
  ; (自動インデント) 改行をしたら次の行を自動でインデントしてくれる
  (c-toggle-auto-newline 1)
  ; 他のエディタなどがファイルを書き換えたらすぐにそれを反映する
  (auto-revert-mode)
  )

;; c言語系全部にフックを設定する
(add-hook 'c-mode-common-hook 'my-c-mode-common-conf)

;;; デフォルトで勝手に作られるbackupファイルの保存先を任意箇所にする
(setq backup-directory-alist
  (cons (cons ".*" (expand-file-name "~/.emacs.d/backup-file"))
        backup-directory-alist))

;;; 番号付けによる複数保存
 (setq version-control     t)  ;; 実行の有無
 (setq kept-new-versions   5)  ;; 最新の保持数
 (setq kept-old-versions   1)  ;; 最古の保持数
 (setq delete-old-versions t)  ;; 範囲外を削除

;;; 編集中の異常終了の際などに作られるauto-saveファイルの保存先を
;;; 任意箇所にする
(setq auto-save-file-name-transforms
  `((".*", (expand-file-name "~/.emacs.d/auto-save-file") t)))

;; 終了時にauto-saveファイルを削除する
(setq delete-auto-save-files t)

;;;
;;; face
;;;

;;; ツールバーを非表示
(tool-bar-mode -1)

;;; メニューバーを非表示
(menu-bar-mode -1)

;;; focusがあたっている時と外れている時でモードラインの色を変える

;; EmacsにFocusが外れている際のFace
(defun my-out-focused-mode-line()
  (set-face-background 'mode-line
                       "red"))

;; EmacsにFocusが当たっている際のFace
(defun my-in-focused-mode-line()
  (set-face-background 'mode-line
                       "#0022bb")) 


;; ForcusでFaceが変わるようにHookする
(add-hook 'focus-out-hook 'my-out-focused-mode-line)
(add-hook 'focus-in-hook 'my-in-focused-mode-line)


;;----
;; 行番号表示
;;----
(global-linum-mode t)

;; whitespace-modeで半角SPCを表示している時に行番号表示欄では表示しない
;; 何故か現在行表示がおかしくなるが仕方ない
 
;; Custom face/function to pad the line number in a way that does not conflict with whitespace-mode
(defface linum-padding
  `((t :inherit 'linum
       :foreground ,(face-attribute 'linum :background nil t)))
  "Face for displaying leading zeroes for line numbers in display margin."
  :group 'linum)

(defun linum-format-func (line)
  (let ((w (length
            (number-to-string (count-lines (point-min) (point-max))))))
    (concat
     (propertize " " 'face 'linum-padding)
     (propertize (make-string (- w (length (number-to-string line))) ?0)
                 'face 'linum-padding)
     (propertize (number-to-string line) 'face 'linum)
     (propertize " " 'face 'linum-padding)
     )))

(setq linum-format 'linum-format-func)
;;(setq linum-format "%5d ")

;;----
;; カラム番号
;;----
(column-number-mode t)
 
;;----
;; ビープ音を消す
;;----
(setq ring-bell-function 'ignore)
  
;;----
;; 対応する括弧を強調表示
;;----
(show-paren-mode t)
 
;;----
;; 時計表示
;;----
;; 不採用    (display-time)
;(setq display-time-day-and-date t)  ;; 曜日・月・日
(setq display-time-24hr-format t)   ;; 24時表示
(display-time-mode t)

;; モードラインの割合表示を総行数表示
(defvar my-lines-page-mode t)
(defvar my-mode-line-format)

(when my-lines-page-mode
  (setq my-mode-line-format "%d")
  (if size-indication-mode
      (setq my-mode-line-format (concat my-mode-line-format " of %%I")))
  (cond ((and (eq line-number-mode t) (eq column-number-mode t))
         (setq my-mode-line-format (concat my-mode-line-format " (%%l,%%c)")))
        ((eq line-number-mode t)
         (setq my-mode-line-format (concat my-mode-line-format " L%%l")))
        ((eq column-number-mode t)
         (setq my-mode-line-format (concat my-mode-line-format " C%%c"))))

  (setq mode-line-position
        '(:eval (format my-mode-line-format
                        (count-lines (point-max) (point-min))))))

;;----
;; TABの表示幅
;;----

;; タブをスペースで扱う
(setq-default indent-tabs-mode nil)
;;(setq-default tab-width 4)
(setq-default tab-width 2)

;;----
;; ファイルサイズ表示
;;----
(size-indication-mode t)
  
;;----
;; タイトルバーにフルパス表示
;;----
(setq frame-title-format "%f")

;;----
;; カラーテーマ(未使用）
;;----
;(load-theme 'deeper-blue t)

;; 行間を開ける量、これを調整することでかなり見え方が変わる
(setq-default line-spacing 2)

;;; #!/bin/shなどで始まるファイルに自動的に実行属性をつける
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)


;;===========================================
;; キーボード操作系
;;===========================================
;;----
;; キーの入れ替えの例
;;----
;; global-set-keyはdefine-keyのラッパーなので、どっちを使ってもOK
;; (define-key global-map (kbd "C-t") 'other-window)
;; (global-set-key (kbd "<C-tab>") 'other-window)

(global-set-key (kbd "C-c g") 'goto-line) 
 
;;----
;; 折り返しトグルコマンド
;;----
(global-set-key (kbd "C-c j") 'toggle-truncate-lines)
 
;;----
;; バックスペースをC-hにする
;; デフォルトでは<backspace>は内部的に<del>として扱われている
;; C-hを<del>のキーシーケンスに上書きする
;;----
(keyboard-translate ?\C-h ?\C-?)

;;; マウスの設定
;; スクロールは1行ごとに
;(setq mouse-wheel-scroll-amount '(1 ((shift) . 5)))
;; スクロールの加速をやめる
;setq mouse-wheel-progressive-speed nil)


;;; GDB 関連
;;; 有用なバッファを開くモード
(setq gdb-many-windows t)
;;; 変数の上にマウスカーソルを置くと値を表示
(add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t)))
;;; I/O バッファを表示
(setq gdb-use-separate-io-buffer t)
;;; t にすると mini buffer に値が表示される
(setq gud-tooltip-echo-area nil)

;;; C-C eでinit.elを開く
(defun my-find-file-init-el ()
  "init.elを開く"
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-c e") 'my-find-file-init-el)

;;; C-C u でpackage-listを出す(updateのため)
(global-set-key (kbd "C-c u") 'package-list-packages)

;;; フレーム間移動を個別定義(本来はC-x 5 o)
(global-set-key (kbd "C-c o") 'other-frame)

;;; recent
(setq recentf-max-saved-items 2000) ;; 2000ファイルまで履歴保存する
(setq recentf-auto-cleanup 'never)  ;; 存在しないファイルは消さない
(setq recentf-exclude '("/recentf" "COMMIT_EDITMSG" "/.?TAGS" "^/sudo:" "/\\.emacs\\.d/games/*-scores" "/\\.emacs\\.d/\\.cask/"))
(setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))

(recentf-mode 1)
(bind-key "C-c r" 'helm-recentf)

;;-------------;;
;; org-mode    ;;
;;-------------;;
;; 画像をインラインで表示
(setq org-startup-with-inline-images t)

;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)

;; LOGBOOK drawerに時間を格納する
(setq org-clock-into-drawer t)

;; .orgファイルは自動的にorg-mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; org-directory内のファイルすべてからagendaを作成する
(setq my-org-agenda-dir "~/org/")
(setq org-agenda-files (list my-org-agenda-dir))

;; TODO状態
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "NOTE(n)"  "|" "DONE(d)" "SOMEDAY(s)" "CANCEL(c)")))

;; DONEの時刻を記録
(setq org-log-done 'time)

;; ショートカットキー
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)


;;;;; ココらへんからパッケージの話 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 最終更新日の自動挿入
(use-package time-stamp
  :config
  (add-hook 'before-save-hook 'time-stamp)
  (setq time-stamp-active t)
  (setq time-stamp-start "[lL]ast[ -][uU]pdated[ \t]*:[ \t]*<")
  (setq time-stamp-format "%:y/%02m/%02d %02H:%02M:%02S from %s by %u")
  (setq time-stamp-end ">")
  (setq time-stamp-line-limit 20))

;;;
;;; helm
;;;

;;; helm本体
(use-package helm
  :init
  (helm-mode t)

  :config
  ;;; M-yでkill-ringを回す
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  
  ;; C-hで前の文字削除
  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
  
  ;; TABとC-zを入れ替える
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)   ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)       ; make TAB work in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action)            ; list actions using C-z
  (global-set-key "\C-c\C-r" 'helm-recentf)
  (define-key global-map (kbd "C-x b")   'helm-buffers-list)
                                        ;(define-key global-map (kbd "C-x b") 'helm-for-files)
  (define-key global-map (kbd "C-x C-f") 'helm-find-files)
  (define-key global-map (kbd "M-x")     'helm-M-x)
  (define-key global-map (kbd "M-y")     'helm-show-kill-ring)
  ;;fine-fileのみTAB補完
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (add-hook 'helm-after-initialize-hook
            #'(lambda ()
                ;; EmacsのデフォルトのC-kの動作に戻す
                (define-key helm-map (kbd "C-k") 'kill-line)
                )))

;;;  helm-gtags
(use-package helm-gtags
  :commands
  (helm-gtags)
  :config
  (helm-gtags-mode t)
  (setq helm-gtags-mode-hook
        '(lambda ()
                                        ; 文脈から判断してジャンプ
           ;;;(define-key global-map (kbd "C-c C-t") 'helm-gtags-dwim)
                                        ; 定義元へ
           (define-key global-map (kbd "C-c C-t") 'helm-gtags-find-tag)
                                        ; 参照元へ
           (define-key global-map (kbd "C-c C-r") 'helm-gtags-find-rtag)
                                        ; 変数の定義元/参照先へ
           (define-key global-map (kbd "C-c C-s") 'helm-gtags-find-symbol)
                                        ; 前のバッファへ
           (define-key global-map (kbd "C-c C-p") 'helm-gtags-previous-history)
                                        ; 次のバッファへ
           (define-key global-map (kbd "C-c C-n") 'helm-gtags-next-history)
                                        ; ファイルへ
           (define-key global-map (kbd "C-c C-f") 'helm-gtags-find-file)
           ))
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode))

;;; helm-git-grep
;;; autoload扱い
(use-package helm-git-grep
  :commands (helm-git-grep)
  :config
  (global-set-key (kbd "C-c C-g") 'helm-git-grep)
  ;; Invoke `helm-git-grep' from isearch.
  (define-key isearch-mode-map (kbd "C-c C-g") 'helm-git-grep-from-isearch)
  ;; Invoke `helm-git-grep' from other helm.
  (eval-after-load 'helm
    '(define-key helm-map (kbd "C-c C-g") 'helm-git-grep-from-helm)))


;;;helm descbinds
;;; autoload扱い
(use-package helm-descbinds
  :commands (helm-descbinds)
  :config
  (helm-descbinds-mode))

;;;
;;; helm系終わり
;;;


;;
;; rainbow-delimiter
;; 括弧の色を色分けする設定
;;
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'c-mode-common-hook #'rainbow-delimiters-mode)

  ;; 括弧の色を強調する設定
  (require 'cl-lib)
  (require 'color)
  (defun rainbow-delimiters-using-stronger-colors ()
    (interactive)
    (cl-loop
     for index from 1 to rainbow-delimiters-max-face-count
     do
     (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
       (cl-callf color-saturate-name (face-foreground face) 30))))
  (add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors))

;;----
;; 全角空白とタブを可視化
;; 参考：http://d.hatena.ne.jp/t_ume_tky/20120906/1346943019
;;----
;; whitespace-mode の 色設定
;;http://ergoemacs.org/emacs/whitespace-mode.html
(use-package whitespace
  :config
  (setq whitespace-style 
        '(face tabs tab-mark spaces space-mark newline newline-mark trailng))
  (setq whitespace-display-mappings
        '(
          (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t]);タブ
          (space-mark ?\u3000 [?□])        ; 全角スペース
          (space-mark ?\u0020 [?.])  ; 半角スペース
          (newline-mark ?\n   [?$ ?\n])     ; 改行記号
          ) )
  (setq whitespace-space-regexp "\\([\x0020\x3000]+\\)" )
  ;;正規表現に関する文書。 Emacs Lispには、正規表現リテラルがないことへの言及
  ;;http://www.mew.org/~kazu/doc/elisp/regexp.html
  ;;
  ;;なぜか、全体をグループ化 \(\) しておかないと、うまくマッチしなかった罠
  ;;
  (set-face-foreground 'whitespace-space "#CEDDEF")
  (set-face-background 'whitespace-space 'nil)
;;  (set-face-bold-p 'whitespace-space t)
  
  (set-face-foreground 'whitespace-tab "LightSkyBlue")
  (set-face-background 'whitespace-tab 'nil)
  
  (set-face-foreground 'whitespace-newline  "#CEEDFF")
  (set-face-background 'whitespace-newline 'nil)

  ;; タブや全角空白などを強調表示
  ;;(global-whitespace-mode 1)
  
  ;;C-cwで切り替え
  (define-key global-map (kbd "\C-cw") 'whitespace-mode)
  ;; 保存前に自動でクリーンアップ
  (setq whitespace-action '(auto-cleanup))
)

;;;yasnippet

(use-package yasnippet
  :config
  (define-key yas-keymap (kbd "<tab>") nil)
     (yas-global-mode 1))

;;;
;;;company
;;; ironyと合わせて自動補完を行う。
;;;
(use-package company
  :init
  (setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こう とすると一番上に
  (setq company-minimum-prefix-length 2) ; デフォルトは4
  ;; (setq company-idle-delay nil) ; 自動補完をしない
  :bind
  (:map company-active-map
        ;; ("C-M-i" . company-complete)
        ;; ("<tab>" . company-complete-selection)
        ("M-n" . nil)
        ("M-p" . nil)
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous)
        ("C-h" . nil))  
  :config
  (global-company-mode 1)

  (defun company--insert-candidate2 (candidate)
    (when (> (length candidate) 0)
      (setq candidate (substring-no-properties candidate))
      (if (eq (company-call-backend 'ignore-case) 'keep-prefix)
          (insert (company-strip-prefix candidate))
        (if (equal company-prefix candidate)
          (company-select-next)
          (delete-region (- (point) (length company-prefix)) (point))
          (insert candidate))
        )))
  
  (defun company-complete-common2 ()
    (interactive)
    (when (company-manual-begin)
      (if (and (not (cdr company-candidates))
               (equal company-common (car company-candidates)))
          (company-complete-selection)
        (company--insert-candidate2 company-common))))
  
  (define-key company-active-map [tab] 'company-complete-common2)
  (define-key company-active-map [backtab] 'company-select-previous))

;;;irony
  
(eval-after-load "irony"
  '(progn
     (custom-set-variables '(irony-additional-clang-options '("-std=c++11")))
     (add-to-list 'company-backends 'company-irony)
     (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
     (add-hook 'c-mode-common-hook 'irony-mode)))
;;;
;;; neotree
;;; 左側にファイルツリーバッファを作る
;;;
(use-package neotree
  :init
  ;; C-c tでnetreee-windowが開くようにする
  (global-set-key (kbd "C-c t") 'neotree-toggle)
  ;; neotreeでファイルを新規作成した場合のそのファイルを開く
  (setq neo-create-file-auto-open t)
  ;; delete-other-window で neotree ウィンドウを消さない
  (setq neo-persist-show t)
  :config
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   ))

;;; volatile-highlight
;;; yank や undoした時のリージョンをハイライト表示
(use-package volatile-highlights
  :init
  (volatile-highlights-mode t)
  :config
  ;; ふわっとエフェクトの追加（ペースト時の色 => カーソル色 => 本来色）
         (defun my:vhl-change-color ()
           (let
               ((next 0.2)
                (reset 0.5)
                (colors '("#F8D3D7" "#F2DAE1" "#EBE0EB" "#E5E7F5" "#DEEDFF")))
             (dolist (color colors)
               (run-at-time next nil
                            'set-face-attribute
                            'vhl/default-face
                            nil :foreground "#FF3333" :background color)
               (setq next (+ 0.05 next)))
             (run-at-time reset nil 'vhl/clear-all))
           (set-face-attribute 'vhl/default-face
                               nil :foreground "#FF3333"
                               :background "#FFCDCD"))

         (defun my:yank (&optional ARG)
           (interactive)
           (yank ARG)
           (my:vhl-change-color))
         (global-set-key (kbd "M-v") 'my:yank)
         (global-set-key (kbd "C-y") 'my:yank)

         (with-eval-after-load "org"
           (define-key org-mode-map (kbd "C-y")
             '(lambda () (interactive)
                (org-yank)
                (my:vhl-change-color)))))

;;; smoooth-scroll
;;; スクロールをスムーズに
(use-package smooth-scroll
  :config
  (smooth-scroll-mode t))

;;;hlinum
(use-package hlinum
  :config
  (hlinum-activate))

;;;ctags 共用設定
;;; (ctags-global-auto-update-mode nil)
;;;  ;; M-.で移動してM-*で戻るはずが戻れないのでC-c u に再定義
;;;  ;; C-x 4 . C-x 5 .も使えるがなんかいまいち
;;;  (define-key global-map (kbd "\C-cu") 'pop-tag-mark)

;;; undohist
(use-package undohist
  :config
  (undohist-initialize))

;;; anzu
;;; 検索文字が何個あるか表示
(use-package anzu
  :init
  (global-anzu-mode +1))

;;; shell-pop
;;; ちっちゃいシェルウインドウを開いたり閉じたりする
(use-package shell-pop
  :init
  ;;(setq shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell))))
  (setq shell-pop-shell-type '("shell" "*shell*" (lambda () (shell))))
  ;; (setq shell-pop-shell-type '("terminal" "*terminal*" (lambda () (term shell-pop-term-shell))))
  ;; (setq shell-pop-shell-type '("ansi-term" "*ansi-term*" (lambda () (ansi-term shell-pop-term-shell))))
  (global-set-key (kbd "C-c s") 'shell-pop))
  
;;; web mode
;;; HTMLモードではhtmlの中のjavascriptなどが色分けされないので導入
;;; http://web-mode.org/
;;; http://yanmoo.blogspot.jp/2013/06/html5web-mode.html
(use-package web-mode
  :mode
  (("\\.html?\\'" . web-mode)
   ("\\.jsp\\'"   . web-mode)
   ("\\.ctp\\'"   . web-mode)
   ("\\.gsp\\'"   . web-mode))
  :config
  (defun web-mode-hook ()
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-engines-alist
          '(("php"    . "\\.ctp\\'"))
          )
    )
  ;; auto tag closing
  ;;0=no auto-closing
  ;;1=auto-close with </
  ;;2=auto-close with > and </
  (setq web-mode-tag-auto-close-style 2)
  (add-hook 'web-mode-hook  'web-mode-hook))


;;; beacon
;;; 現在行のカーソルをバッファ移動のたびにわかるようにする
(use-package beacon
  :init
  (beacon-mode 1)
  (setq beacon-push-mark 35)
  (setq beacon-color "#F5DE34")
  (setq beacon-size 400)
  (setq beacon-blink-when-focused t)
  (setq beacon-blink-duration 1))

;;;saveplace: 前回の修正位置を記憶する.
(use-package saveplace
  :config
  (save-place-mode 1)
  (setq save-place-file (concat "~/.emacs.d/tmp/emacs-places")))

;;; japanese-holidays 日本語カレンダー

(use-package japanese-holidays
  :ensure t
  :init
  (add-hook 'calendar-today-visible-hook   'japanese-holiday-mark-weekend)
  (add-hook 'calendar-today-invisible-hook 'japanese-holiday-mark-weekend)
  (add-hook 'calendar-today-visible-hook   'calendar-mark-today)
  :config 
  (setq calendar-holidays               ; とりあえず日本のみを表示
        (append japanese-holidays holiday-local-holidays)
        mark-holidays-in-calendar t     ; 祝日をカレンダーに表示
        calendar-month-name-array       ; 月と曜日の表示調整
        ["01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12" ]
        calendar-day-name-array
        ["日" "月" "火" "水" "木" "金" "土"]
        calendar-day-header-array
        ["日" "月" "火" "水" "木" "金" "土"]
        calendar-date-style 'iso         ; ISO format (YYYY/MM/DD) に変更
        japanese-holiday-weekend '(0 6)  ; 土曜日・日曜日を祝日として表示
        japanese-holiday-weekend-marker
        '(holiday nil nil nil nil nil japanese-holiday-saturday)
        ;; 月曜開始
        calendar-week-start-day 1)
  (calendar-set-date-style 'iso)
  )

;;; rainbow-mode:#RRGGBB のカラーコードに勝手に色が付く

(use-package rainbow-mode
  :config
  (setq rainbow-html-colors t)
  (setq rainbow-x-colors t)
  (setq rainbow-latex-colors t)
  (setq rainbow-ansi-colors t)
  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-mode)
  (add-hook 'less-mode-hook 'rainbow-mode)
  (add-hook 'web-mode-hook 'rainbow-mode)
  (add-hook 'html-mode-hook 'rainbow-mode)
  :diminish rainbow-mode
  )

;;; popup-kill-ring
(use-package popup-kill-ring
  :config
  (global-set-key "\M-y" 'popup-kill-ring))

;;; popup-switcher
(use-package popup-switcher
  :config
  (global-set-key (kbd "\C-x b") 'psw-switch-buffer)
  (global-set-key [f3] 'psw-switch-function)
  (setq psw-popup-menu-max-length 15))

;;; darkroom
;;; 集中してもの書く時用に
;;; 余計なモード行とかが消えて文字が大きくなる
;;; M-x darkroom-modeでOn/OFFを切り替える
;;; autoload扱い
(use-package darkroom
  :commands (darkroom))

;;; undo-tree

(use-package undo-tree
  :config
  (global-undo-tree-mode))

;;; markdown-mode
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;;; poly-markdown-mode
(use-package polymode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode)))

;;; markdown-preview-mode
;;;autoload扱い
(use-package markdown-preview-mode
  :commands (markdown-preview-mode))

;;; markdown-preview-eww
;;;autoload扱い
(use-package markdown-preview-eww
  :commands (markdown-preview-eww))

;;; easy-kill
(use-package easy-kill
  :config
  (global-set-key [remap kill-ring-save] 'easy-kill))

;;; clang-format
(use-package clang-format
  :commands
  (clang-format))

;;; emojify
(use-package emojify
  :config
  (global-emojify-mode))

;;; Sky-color-clock
;;; モードラインに今の外の天気と明るさを表示するエリアを１つ作る
;;; GitHub: https://github.com/zk-phi/sky-color-clock
(require 'sky-color-clock)      ; パッケージをロード
(sky-color-clock-initialize 35) ; 東京（例）の緯度で初期化

(sky-color-clock-initialize-openweathermap-client "29f05637d7c752d82783da6ddc756cf5" 5384214) ; 東京の City ID
;; デフォルトの mode-line-format の先頭に sky-color-clock を追加
(push '(:eval (sky-color-clock)) (default-value 'mode-line-format))
(setq sky-color-clock-format "%m/%d %H:%M")
(setq sky-color-clock-enable-emoji-icon t)

(sky-color-clock-initialize-openweathermap-client "29f05637d7c752d82783da6ddc756cf5" 1850144) ;天気取得
(setq sky-color-clock-enable-temperature-indicator t)


;;; focus-autosave-mode
(use-package focus-autosave-mode
  :config
  (focus-autosave-mode))

;;; buffer-menu-color
(require 'buffer-menu-color)

;; ;;; open-junk-file
;; ;;; auto-load扱い
;; (use-package open-junk-file
;;   :commands (open-junk-file)
;;   :config
;;   (setq open-junk-file-format "~/Documents/junk/%Y-%m%d-%H%M%S.")
;;   (global-set-key "\C-xj" 'open-junk-file))


;;; 非アクティブウインドウの背景色を変更
(use-package hiwin
  :config
  (hiwin-activate)
  (set-face-background 'hiwin-face "#eeeef0"))

;;; google翻訳
(use-package google-translate
  :config
  ;; キーバインドの設定（お好みで）
  (global-set-key (kbd "C-c T") 'google-translate-at-point)

  ;; 翻訳のデフォルト値を設定（en -> ja）
  (custom-set-variables
   '(google-translate-default-source-language "en")
   '(google-translate-default-target-language "ja"))
  ;; Fix error of "Failed to search TKK"
  (defun google-translate--get-b-d1 ()
    ;; TKK='427110.1469889687'
    (list 427110 1469889687)))

;;;shackle
;;; helm等分割エリアの割合、位置を指定する
(use-package shackle
  :config
  (setq shackle-rules
        '(;; *compilation*は下部に2割の大きさで表示
          (compilation-mode :align below :ratio 0.2)
          ;; ヘルプバッファは右側に表示
          ("*Help*" :align right)
          ;; 補完バッファは下部に3割の大きさで表示
          ("*Completions*" :align below :ratio 0.3)
          ;; google翻訳バッファは下部に3割の大きさで表示
          ("*Google Translate*" :align below :ratio 0.3)
          ;; M-x helm-miniは下部に7割の大きさで表示
          ("*helm mini*" :align below :ratio 0.7)
          ;; 他のhelmコマンドは右側に表示 (バッファ名の正規表現マッチ)
          ("\*helm" :regexp t :align right)
          ;; 上部に表示
          ("foo" :align above)
          ;; 別フレームで表示
          ("neotree" :frame t)
          ;; 別フレームで表示
          ;; ("bar" :frame t)
          ;; 同じウィンドウで表示
          ;; ("baz" :same t)
          ;; ポップアップで表示
          ;;  ("hoge" :popup t)
          ;; 選択する
          ;;  ("abc" :select t)
          ))
  (shackle-mode 1)
  (setq shackle-lighter "")
  
;;; C-zで直前のウィンドウ構成に戻す
  (winner-mode 1)
  (global-set-key (kbd "C-c z") 'winner-undo))

;;; org-bullets
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;;; org-preview-html-mode
(use-package org-preview-html
  :commands (org-preview-html-mode))


;;; context-coloring( not C langeage;;)
(use-package context-coloring
  :config
  ;; JavaScript:
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-hook 'js2-mode-hook #'context-coloring-mode)

  ;; Emacs Lisp:
  (add-hook 'emacs-lisp-mode-hook #'context-coloring-mode)

  ;; eval-expression:
  (add-hook 'eval-expression-minibuffer-setup-hook #'context-coloring-mode) ; 24.4+
  ;;;(add-hook 'minibuffer-setup-hook #'context-coloring-mode)                 ; 24.3

  (custom-theme-set-faces
   'leuven
   '(context-coloring-level-0-face  ((t :foreground "#839496")))
   '(context-coloring-level-1-face  ((t :foreground "#268bd2")))
   '(context-coloring-level-2-face  ((t :foreground "#2aa198")))
   '(context-coloring-level-3-face  ((t :foreground "#859900")))
   '(context-coloring-level-4-face  ((t :foreground "#b58900")))
   '(context-coloring-level-5-face  ((t :foreground "#cb4b16")))
   '(context-coloring-level-6-face  ((t :foreground "#dc322f")))
   '(context-coloring-level-7-face  ((t :foreground "#d33682")))
   '(context-coloring-level-8-face  ((t :foreground "#6c71c4")))
   '(context-coloring-level-9-face  ((t :foreground "#69b7f0")))
   '(context-coloring-level-10-face ((t :foreground "#69cabf")))
   '(context-coloring-level-11-face ((t :foreground "#b4c342")))
   '(context-coloring-level-12-face ((t :foreground "#deb542")))
   '(context-coloring-level-13-face ((t :foreground "#f2804f")))
   '(context-coloring-level-14-face ((t :foreground "#ff6e64")))
   '(context-coloring-level-15-face ((t :foreground "#f771ac")))
   '(context-coloring-level-16-face ((t :foreground "#9ea0e5"))))
  )


(use-package eshell-git-prompt
  :config
  (eshell-git-prompt-use-theme 'git-radar))

;; doxymacs mode
(require 'doxymacs)
;; usage
;; M-x doxymacs-mode
;;
;; C-c d i	ファイルへのコメントを挿入
;; C-c d f	カーソルの下にある関数へのコメントを挿入
;; C-c d ;	メンバへのコメントを挿入
;; C-c d m	複数行の空コメントを挿入
;; C-c d s	一行の空コメントを挿入
;; custom c-mode hook for doxymacs
(defun doxy-custom-c-mode-hook ()
  (doxymacs-mode 1)
  (setq doxymacs-doxygen-style "Qt")
  (setq doxymacs-command-character "@")

  (add-hook 'c-mode-common-hook 'doxy-custom-c-mode-hook)
  )

;;; projectile
(use-package projectile
  :config
  (projectile-global-mode))

;;;helm-projectile
(use-package helm-projectile
  :config
  (helm-projectile-on))

;;; Python

;;; python-mode
(use-package python-mode
    :config
    (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
    (add-to-list 'interpreter-mode-alist '("python" . python-mode)))

;;; company-jedi
(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  :config
  (use-package company-jedi
   :ensure t
   :init
   (add-hook 'python-mode-hook (lambda () (add-to-list 'company-backends 'company-jedi)))
   (setq  company-jedi-python-bin "python")))

(use-package py-yapf
  :config
  (add-hook 'python-mode-hook 'py-yapf-enable-on-save))

;;
;; linux 初回起動時のみ $ sudo apt-get install virtualenv
;; M-x jedi:install-server RETが必要
;;

;;; py-autopep8
(use-package py-autopep8
  :config
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
  (setq py-autopep8-options '("--max-line-length=100")))


;;; dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  ;; set title 
  (setq dashboard-banner-logo-title "Welcome to Emacs Genm Dashboard!!!")
  ;; Set the banner
  (setq dashboard-startup-banner "~/.emacs.d/genm.png")
  (setq dashboard-items '((recents  . 8)
                          (bookmarks . 3))))





;;;---------パッケージ毎の設定終わり end of package setting

;;;
;;; OS によって設定を切り替える部分
;;;

;;;
;;; for Windows (NTEmacs)
;;; 
(when (eq system-type 'windows-nt) ; Windows

;;;
;;; IME関連の設定
;;;
  
;;;** 標準IMEの設定
(when (locate-library "w32-ime")
  (progn

    (setq default-input-method "W32-IME")
    
;;;** IMEの初期化
    (w32-ime-initialize)
    
;;;** IME状態のモードライン表示
    (setq-default w32-ime-mode-line-state-indicator "[--]")
    (setq w32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
    
;;;** IME OFF時の初期カーソルカラー
    (set-cursor-color "green")
    
;;;** IME ON/OFF時のカーソルカラー
    (add-hook 'input-method-activate-hook
              (lambda() (set-cursor-color "red")))
    (add-hook 'input-method-inactivate-hook
              (lambda() (set-cursor-color "green")))
   
;;;** バッファ切り替え時にIME状態を引き継ぐ
    (setq w32-ime-buffer-switch-p nil)
  )
)

   
;;;
;;; フォント関連の設定
;;;
   
;;
;; プログラミング用フォント Myrica
;; https://myrica.estable.jp/
;; 固定等幅フォント
(set-face-attribute 'default nil
                    :family "Myrica M"
                    :height 140)
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("Myrica M" . "unicode-bmp")
                  )

(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  '("Myrica M" . "unicode-bmp")
                  )


;;;ctags windows用設定
;;;  (setq ctags-update-command "~/.emacs.d/bin/ctags.exe")
(setq gtags-update-command "~/.emacs.d/bin/gtags.exe")

;;sky-color-clockで絵文字を出さない
(setq sky-color-clock-enable-emoji-icon nil)
 
;;; Windows markdownビューワの指定
(setq markdown-open-command "~/.emacs.d/etc/markcat.bat")
  
;;
;; 環境変数でgitのPATHを通しておくのを忘れずに
;;

);;; ここまでwindows用

;;;
;;; for Linux/Unix
;;; 

(when (eq system-type 'gnu/linux) ; Unix

  ;; font
  ;(set-fontset-font t 'japanese-jisx0208 "TakaoPGothic")
  ;(add-to-list 'face-font-rescale-alist '(".*Takao P.*" . 0.85)) 

  ;;rictyfont
  ;; $ cp  ~/.emacs.d/RictyFont/ ~/.fonts/
  ;; $ sudo fc-cache -vfでインストール
  (set-frame-font "ricty-12")
    (add-to-list 'default-frame-alist '(font . "ricty-12"))
  
  ;;;;;;;;;;;;;;;;;;;;
  ;; Dired 
  ;;;;;;;;;;;;;;;;;;;;
  
  ;; Dired のリストフォーマット設定 (ls へのオプション)
  ;; (setq dired-listing-switches "-aoFLt")
  ;; ls の出力を英語にする(ls を LANG=C で実行)
  (add-hook 'dired-mode-hook
            '(lambda ()
               (setenv "LANG" "C")))

  ;;;ctags unix用設定

  ;;; 注意！exuberant-ctagsを指定する必要がある
  ;;; Emacs標準のctagsでは動作しない！！
  ;;;  (setq ctags-update-command "/usr/bin/ctags")

  ;;;
  ;;; mozc
  ;;;
  (require 'mozc)
  ;;(set-language-environment "Japanese")
  (setq default-input-method "japanese-mozc")
    
  ;; GUIの候補選択ウィンドウをカーソルの直下にぶら下げる（デフォルト）
  (setq mozc-candidate-style 'overlay)

  (set-cursor-color "red")  
  ;; mozcのon/offでカーソルの色を変える(うまく動いていない）
  ;; on
  (add-hook 'input-method-activate-hook
            (lambda() (set-cursor-color "green")))
  ;; off
  (add-hook 'input-method-inactivate-hook
            (lambda() (set-cursor-color "red")))
  
  ;; FLYCHECK
  (use-package flycheck
    :config
    (global-flycheck-mode)
    
    (define-key global-map (kbd "\C-cn") 'flycheck-next-error)
    (define-key global-map (kbd "\C-cp") 'flycheck-previous-error)
    (define-key global-map (kbd "\C-cd") 'flycheck-list-errors)
    
    (eval-after-load 'flycheck
      '(custom-set-variables
        '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
  
  
  (add-hook 'c++-mode-hook (lambda()
                             (setq flycheck-gcc-language-standard "c++11")
                             (setq flycheck-clang-language-standard "c++11"))))
  
  ;; ace-isearch
  (use-package ace-isearch
   :config
   (global-ace-isearch-mode +1)
   (custom-set-variables
    '(ace-isearch-jump-delay 1.00)
     '(ace-isearch-function 'avy-goto-char)    
    '(ace-isearch-use-jump 'printing-char))
     (define-key isearch-mode-map (kbd "M-o") 'helm-multi-swoop-all-from-isearch))

  ;; dired-du
  (use-package dired-du
    :config
    (add-hook 'dired-mode-hook #'dired-du-mode))

  ;; git-complete
  (require 'git-complete)
  (global-set-key (kbd "C-c C-G") 'git-complete)

  ;; elpy
  (use-package elpy
    :ensure t
    :init (with-eval-after-load `python (elpy-enable))
    :config
    (progn
      ;; Use Flycheck instead of Flymake
      (when (require 'flycheck nil t)
        (remove-hook 'elpy-modules 'elpy-module-flymake)
        (remove-hook 'elpy-modules 'elpy-module-yasnippet)
        (remove-hook 'elpy-mode-hook 'elpy-module-highlight-indentation)
        (add-hook 'elpy-mode-hook 'flycheck-mode))
      (elpy-enable)
      ;; jedi is great
      (setq elpy-rpc-python-command "python3")
      (setq python-shell-interpreter "ipython3")
      (setq python-shell-interpreter-args "-i --simple-prompt")
      (setq elpy-rpc-backend "jedi")))

);;;ここまでUNIX用

;;;
;;; for MacOS-X
;;;

(when (equal system-type 'darwin)
;;;なし

);;; ここまでMACOS用

;;;
;;; モードラインに表示しない
;;;
(setq my/hidden-minor-modes
      '(undo-tree-mode
        anzu-mode
        flycheck-mode
        vhdl-mode
        rainbow-mode
        scroll-all-mode
        ace-isearch-mode
        global-whitespace-mode
        volatile-highlights-mode
        smooth-scroll-mode
        beacon-mode
        company-mode
        auto-revert-mode
        eldoc-mode
        auto-complete-mode
        magit-auto-revert-mode
        abbrev-mode
        focus-autosave-mode
        yas-minor-mode
        helm-gtags-mode
        helm-mode))

(mapc (lambda (mode)
          (setq minor-mode-alist
                (cons (list mode "") (assq-delete-all mode minor-mode-alist))))
        my/hidden-minor-modes)



;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ace-isearch-function (quote avy-goto-char))
 '(ace-isearch-use-jump (quote printing-char))
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(irony-additional-clang-options (quote ("-std=c++11")))
 '(package-selected-packages
   (quote
    (neotree flylisp dired-du beacon company-math flycheck-pos-tip csv-mode shell-pop leuven-theme web-mode helm-swoop ace-jump-mode anzu ace-isearch ctags-update w3 use-package-el-get smooth-scroll rainbow-mode rainbow-delimiters package-utils mozc melpa-upstream-visit magit irony hlinum helm fuzzy forecast flycheck company auto-read-only auto-complete anti-zenburn-theme)))
 '(paradox-github-token t)
 '(yas-trigger-key "TAB"))

(provide 'init)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
