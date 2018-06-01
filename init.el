;;emacs init.el

;; 予約語を色分けする
(global-font-lock-mode t)


;; load-pathを追加する関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリ以下をload-pathに追加
(add-to-load-path "el-get" "elpa")

;; use-package を require の代わりに使う
(if (require 'use-package nil t)
    (setq use-package-verbose t)
  (message "Use-package is unavailable!")
  (defmacro use-package (&rest _args)))


(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))



(require 'use-package)


(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; FILE CODE設定
(when (equal emacs-major-version 21) (require 'un-define))
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq file-name-coding-system 'shift_jis)

;;インデント
(setq-default c-basic-offset 4     ;;基本インデント量4
              tab-width 4          ;;タブ幅4
              indent-tabs-mode nil)  ;;インデントをタブでするかスペースでするか

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
  ;; ";"や"{"などをを入力した場合現在の行を自動インデントを有功にする
  (c-toggle-electric-state 1)
  ;; カッコを強調表示する  
  (show-paren-mode t)
  ;; (自動インデント) 改行をしたら次の行を自動でインデントしてくれる
  (c-toggle-auto-newline 1)
  ;; 他のエディタなどがファイルを書き換えたらすぐにそれを反映する
  (auto-revert-mode)
  )

;; c言語系全部にフックを設定する
(add-hook 'c-mode-common-hook 'my-c-mode-common-conf)

;; 自動補完
;;(ac-config-default)

;; 以下、PROXYが必要な場合の設定。いらない場合はコメントアウトすること

;;; Proxy設定
(setq url-proxy-services
	'(("http" . "proxy-auth.ntt-el.com:8050")
	  ("https" . "proxy-auth.ntt-el.com:8050")))

(setq url-http-proxy-basic-auth-storage
	'(("proxy-auth.ntt-el.com:8050" ("Proxy" . "NjY1MTpha2FyaTNrYW1p"))))

;; ここまで


;;el-get
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;;---
;; rainbow-delimiter
;;
(use-package rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

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
(add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors)


;;----
;; 行番号表示
;;----
(global-linum-mode t)
(setq linum-format "%5d ")

;;----
;; カラム番号
;;----
(column-number-mode t)
 
;;----
;; ビープ音を消す
;;----
(setq ring-bell-function 'ignore)
 
;;----
;; カーソル行に下線を表示
;;----
(setq hl-line-face 'underline)
(global-hl-line-mode)
 
;;----
;; 対応する括弧を強調表示
;;----
(show-paren-mode t)
 
;;----
;; 時計表示
;;----
;; 不採用    ;; 時間を表示
;; 不採用    (display-time)
(setq display-time-day-and-date t)  ;; 曜日・月・日
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


(setq-default tab-width 4)
 
;;----
;; ファイルサイズ表示
;;----
(size-indication-mode t)
 
;;----
;; ツールバーを非表示
;; M-x tool-bar-mode で表示非表示を切り替えられる
;;----
(tool-bar-mode -1)
 
;;----
;; タイトルバーにフルパス表示
;;----
(setq frame-title-format "%f")
 
;;----
;; カラーテーマ
;;----
;(load-theme 'deeper-blue t)
 
;;----
;; 全角空白とタブを可視化
;; 参考：http://d.hatena.ne.jp/t_ume_tky/20120906/1346943019
;;----
;; タブや全角空白などを強調表示
(global-whitespace-mode 1)
;; whitespace-mode の 色設定
;;http://ergoemacs.org/emacs/whitespace-mode.html
(require 'whitespace)
(setq whitespace-style 
      '(face tabs tab-mark spaces space-mark newline newline-mark))
(setq whitespace-display-mappings
      '(
        (tab-mark   ?\t     [?\xBB ?\t])  ; タブ
        (space-mark ?\u3000 [?□])        ; 全角スペース
;        (space-mark ?\u0020 [?\xB7])      ; 半角スペース
;        (newline-mark ?\n   [?$ ?\n])     ; 改行記号
        ) )
(setq whitespace-space-regexp "\\([\x0020\x3000]+\\)" )
;正規表現に関する文書。 Emacs Lispには、正規表現リテラルがないことへの言及
;http://www.mew.org/~kazu/doc/elisp/regexp.html
;
;なぜか、全体をグループ化 \(\) しておかないと、うまくマッチしなかった罠
;
(set-face-foreground 'whitespace-space "DimGray")
(set-face-background 'whitespace-space 'nil)
;(set-face-bold-p 'whitespace-space t)
 
(set-face-foreground 'whitespace-tab "DimGray")
(set-face-background 'whitespace-tab "nil")
 
(set-face-foreground 'whitespace-newline  "DimGray")
(set-face-background 'whitespace-newline 'nil)
 
 
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
;; ウィンドウ切り替え
;; SはShiftキーのこと
;; 参考：http://qiita.com/saku/items/6ef40a0bbaadb2cffbce
;;----
(defun other-window-or-split (val)
  (interactive)
  (when (one-window-p)
    (split-window-horizontally) ;split horizontally 縦分割にしたい場合はこちら
;;    (split-window-vertically) ;split vertically   横分割にしたい場合はこちら
  )
  (other-window val))
(global-set-key (kbd "<C-tab>") (lambda () (interactive) (other-window-or-split 1)))
(global-set-key (kbd "<C-S-tab>") (lambda () (interactive) (other-window-or-split -1)))
 
;;----
;; 折り返しトグルコマンド
;;----
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
 
;;----
;; バックスペースをC-hにする
;; デフォルトでは<backspace>は内部的に<del>として扱われている
;; C-hを<del>のキーシーケンスに上書きする
;;----
(keyboard-translate ?\C-h ?\C-?)




;; OS によって設定を切り替える例
(when (eq system-type 'windows-nt) ; Windows
   
;;;** 標準IMEの設定
   (setq default-input-method "W32-IME")

;;;** IMEの初期化
   (w32-ime-initialize)

;;;** IME状態のモードライン表示
   (setq-default w32-ime-mode-line-state-indicator "[--]")
   (setq w32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
   
;;;** IME OFF時の初期カーソルカラー
   (set-cursor-color "red")
   
;;;** IME ON/OFF時のカーソルカラー
   (add-hook 'input-method-activate-hook
			 (lambda() (set-cursor-color "green")))
   (add-hook 'input-method-inactivate-hook
			 (lambda() (set-cursor-color "red")))
   
;;;** バッファ切り替え時にIME状態を引き継ぐ
   (setq w32-ime-buffer-switch-p nil)
   
;;;** Consolas + MSゴシック
   (set-default-font "Consolas 10")
   (set-fontset-font (frame-parameter nil 'font)
					 'japanese-jisx0208
					 '("ＭＳ ゴシック" . "unicode-bmp")
					 )
   (set-fontset-font (frame-parameter nil 'font)
					 'katakana-jisx0201
					 '("ＭＳ ゴシック" . "unicode-bmp")
					 )
);;; ここまでwindows用

(when (eq system-type 'gnu/linux) ; Unix
  ;;;
  ;;; mozc
  ;;;
  (require 'mozc)

  (set-language-environment "Japanese")
  (setq default-input-method "japanese-mozc")
  
  ;; GUIの候補選択ウィンドウをカーソルの直下にぶら下げる（デフォルト）
  (setq mozc-candidate-style 'overlay)
  
  ;; mozcのon/offでカーソルの色を変える
  ;; on
  (add-hook 'input-method-activate-hook
            (lambda() (set-cursor-color "DarkOrange")))
  ;; off
  (add-hook 'input-method-inactivate-hook
            (lambda() (set-cursor-color "grey46")))
  
  
  
);;;ここまでUNIX用

(when (equal system-type 'darwin)

);;; ここまでMACOS用

 
;;; FLYCHECK
(require 'flycheck)

(global-flycheck-mode)

(define-key global-map (kbd "\C-cn") 'flycheck-next-error)
(define-key global-map (kbd "\C-cp") 'flycheck-previous-error)
(define-key global-map (kbd "\C-cd") 'flycheck-list-errors)

(add-hook 'c++-mode-hook (lambda()
                           (setq flycheck-gcc-language-standard "c++11")
                           (setq flycheck-clang-language-standard "c++11")))


;;;company

(when (locate-library "company")
  (global-company-mode 1)
  (global-set-key (kbd "C-M-i") 'company-complete)
  ;; (setq company-idle-delay nil) ; 自動補完をしない
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "<tab>") 'company-complete-selection))

(eval-after-load "irony"
  '(progn
     (custom-set-variables '(irony-additional-clang-options '("-std=c++11")))
     (add-to-list 'company-backends 'company-irony)
     (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
     (add-hook 'c-mode-common-hook 'irony-mode)))


