
;; ロゴの設定
(setq fancy-splash-image (expand-file-name "~/.emacs.d/genm.png"))

;;; theme select:
(load-theme 'leuven t)


;;; PROXY設定
;;; いらない場合はコメントアウトすること

;;; Proxy設定
(setq url-proxy-services
	'(("http" . "proxy-auth.ntt-el.com:8050")
	  ("https" . "proxy-auth.ntt-el.com:8050")))

(setq url-http-proxy-basic-auth-storage
	'(("proxy-auth.ntt-el.com:8050" ("Proxy" . "NjY1MTpha2FyaTNrYW1p"))))

;; ここまで

;; 予約語を色分けする
(global-font-lock-mode t)


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
(add-to-load-path "el-get" "elpa")

;;; package系

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
;; el-getでダウンロードしたパッケージは ~/.emacs.d/ に入るようにする
;(setq el-get-dir (locate-user-emacs-file ""))

;;; package系終わり


;; FILE CODE設定
(when (equal emacs-major-version 21) (require 'un-define))
;(set-language-environment "Japanese") ;; コメントアウトしないとdired化ける
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq default-file-name-coding-system 'japanese-shift-jis-dos) ;dired用

;;; CUI/GUIで分ける設定
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
          '((width . 80) (height . 40)))

  ;; 新規フレームのデフォルト設定
  (setq default-frame-alist
          '((width . 80) (height . 40)))

))
;;; CUI/GUIで分ける設定ここまで

;;; インデント設定

(setq-default c-basic-offset 4     ;;基本インデント量4
              tab-width 4          ;;タブ幅4
              indent-tabs-mode nil)  ;;インデントをタブでするかスペースでするか

;;; C,C++の設定

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



;;; 括弧の色を色分けする設定

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


;; バックアップファイルを作成させない
(setq make-backup-files nil)

;; 終了時にオートセーブファイルを削除する
(setq delete-auto-save-files t)

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
;; 対応する括弧を強調表示
;;----
(show-paren-mode t)
 
;;----
;; 時計表示
;;----
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
;;        (space-mark ?\u0020 [?\xB7])      ; 半角スペース
;;        (newline-mark ?\n   [?$ ?\n])     ; 改行記号
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
;;(defun other-window-or-split (val)
;;  (interactive)
;;  (when (one-window-p)
;;    (split-window-horizontally) ;split horizontally 縦分割にしたい場合はこちら
;;;;    (split-window-vertically) ;split vertically   横分割にしたい場合はこちら
;;  )
;; (other-window val))
;;(global-set-key (kbd "<C-tab>") (lambda () (interactive) (other-window-or-split 1)))
;;(global-set-key (kbd "<C-S-tab>") (lambda () (interactive) (other-window-or-split -1)))
 
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

;;; マウスの設定

;; スクロールは1行ごとに
;(setq mouse-wheel-scroll-amount '(1 ((shift) . 5)))

;; スクロールの加速をやめる
;setq mouse-wheel-progressive-speed nil)





;;;yasnippet
;;
;; (use-package yasnippet)
;; ;; 自分用・追加用テンプレート
;; ;; -> mysnippetに作成したテンプレートが格納される
;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/mysnippets"
;;         "~/.emacs.d/yasnippets"
;;         ))

;; ;; 既存スニペットを挿入する
;; (define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; ;; 新規スニペットを作成するバッファを用意する
;; (define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; ;; 既存スニペットを閲覧・編集する
;; (define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

;; (yas-global-mode 1)
;; (custom-set-variables '(yas-trigger-key "TAB"))

;;; FLYCHECK
(require 'flycheck)

(global-flycheck-mode)

(define-key global-map (kbd "\C-cn") 'flycheck-next-error)
(define-key global-map (kbd "\C-cp") 'flycheck-previous-error)
(define-key global-map (kbd "\C-cd") 'flycheck-list-errors)

(add-hook 'c++-mode-hook (lambda()
                           (setq flycheck-gcc-language-standard "c++11")
                           (setq flycheck-clang-language-standard "c++11")))


;; 自動補完
;; (use-package auto-complete-config)
;; (ac-config-default)
;; (add-to-list 'ac-modes 'text-mode)         ;; text-modeでも自動的に有効にする
;; (add-to-list 'ac-modes 'fundamental-mode)  ;; fundamental-mode
;; (add-to-list 'ac-modes 'org-mode)
;; (add-to-list 'ac-modes 'yatex-mode)
;; (ac-set-trigger-key "TAB")
;; (setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択
;; (setq ac-use-fuzzy t)          ;; 曖昧マッチ


;;;company

(when (locate-library "company")
  (global-company-mode 1)
  (global-set-key (kbd "C-M-i") 'company-complete)
  ;; (setq company-idle-delay nil) ; 自動補完をしない
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2) ; デフォルトは4
  (setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に

  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)

  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-h") nil)
  ;;(define-key company-active-map (kbd "<tab>") 'company-complete-selection))

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
  (define-key company-active-map [backtab] 'company-select-previous)
)
;;;irony
  
(eval-after-load "irony"
  '(progn
     (custom-set-variables '(irony-additional-clang-options '("-std=c++11")))
     (add-to-list 'company-backends 'company-irony)
     (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
     (add-hook 'c-mode-common-hook 'irony-mode)))



;; neotree

(use-package neotree)
;; C-c tでnetreee-windowが開くようにする
(global-set-key "\C-ct" 'neotree-toggle)
;; neotreeでファイルを新規作成した場合のそのファイルを開く
(setq neo-create-file-auto-open t)
;; delete-other-window で neotree ウィンドウを消さない
(setq neo-persist-show t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; volatile-highlight
(use-package volatile-highlights)
(volatile-highlights-mode t)

;;smoooth-scroll
(use-package smooth-scroll)
(smooth-scroll-mode t)

;;hlinum
(hlinum-activate)

;;ctags

(ctags-global-auto-update-mode)  
;; M-.で移動してM-*で戻るはずが戻れないのでC-c u に再定義
;; C-x 4 . C-x 5 .も使えるがなんかいまいち
(define-key global-map (kbd "\C-cu") 'pop-tag-mark)

;; undohist
(when (require 'undohist nil t)
  (undohist-initialize))

;; anzu
(when (require 'anzu)
  (global-anzu-mode +1))
;; shell-pop
;;(setq shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell))))
(setq shell-pop-shell-type '("shell" "*shell*" (lambda () (shell))))
;; (setq shell-pop-shell-type '("terminal" "*terminal*" (lambda () (term shell-pop-term-shell))))
;; (setq shell-pop-shell-type '("ansi-term" "*ansi-term*" (lambda () (ansi-term shell-pop-term-shell))))
(global-set-key (kbd "C-c s") 'shell-pop)

;; ;;; auto-complete-c-headers

;; (defun my:ac-c-headers-init ()
;;   (require 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-headers))

;; (add-hook 'c++-mode-hook 'my:ac-c-headers-init)
;; (add-hook 'c-mode-hook 'my:ac-c-headers-init)

;; web mode
;; http://web-mode.org/
;; http://yanmoo.blogspot.jp/2013/06/html5web-mode.html
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.ctp\\'"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; web-modeの設定
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

(add-hook 'web-mode-hook  'web-mode-hook)

;; web-mode 色の設定



;; ;;; w3 
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    (quote
;;     (leuven-theme web-mode helm-swoop ace-jump-mode anzu ace-isearch ctags-update w3 use-package-el-get smooth-scroll rainbow-mode rainbow-delimiters package-utils mozc melpa-upstream-visit magit irony hlinum helm fuzzy forecast flycheck company auto-read-only auto-complete anti-zenburn-theme)))
;;  '(yas-trigger-key "TAB"))

;;;
;;; OS によって設定を切り替える例
;;;

(when (eq system-type 'windows-nt) ; Windows

;;;
;;; IME関連の設定
;;;

;; Windows-patchVerでも動くように
  
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
   
;;;** Consolas + MSゴシック
;;;   (set-default-font "Consolas 14")
;;;   (set-fontset-font (frame-parameter nil 'font)
;;;                     'japanese-jisx0208
;;;                     '("ＭＳ ゴシック" . "unicode-bmp")
;;;                     )
;;;   (set-fontset-font (frame-parameter nil 'font)
;;;                     'katakana-jisx0201
;;;                     '("ＭＳ ゴシック" . "unicode-bmp")
;;;
;;;                      )
;;;
;;;http://xiuxing.blog.jp/archives/8346924.html
;;;
(set-default-font "MeiryoKe_Console 14")
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("MeiryoKe_Console" . "unicode-bmp")
;                  '("Ricty Diminished" . "unicode-bmp")
                  )

(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  '("MeiryoKe_Console" . "unicode-bmp")
;                  '("Ricty Diminished" . "unicode-bmp")
                  )
;;ctags
(setq ctags-update-command "~/.emacs.d/bin/ctags.exe")
;;
;; 環境変数でgitのPATHを通しておくのを忘れずに
;;

);;; ここまでwindows用

(when (eq system-type 'gnu/linux) ; Unix

  ;;;;;;;;;;;;;;;;;;;;
  ;; Dired 
  ;;;;;;;;;;;;;;;;;;;;
  
  ;; Dired のリストフォーマット設定 (ls へのオプション)
  ;; (setq dired-listing-switches "-aoFLt")
  ;; ls の出力を英語にする(ls を LANG=C で実行)
  (add-hook 'dired-mode-hook
            '(lambda ()
               (setenv "LANG" "C")))

  ;;;
  ;;; mozc
  ;;;
  (use-package mozc)

  (set-language-environment "Japanese")
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
  
  ;; helm なぜかwindowsでは動かないのです。
  (use-package helm-config)
  (helm-mode t)
  
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
  (add-hook 'helm-after-initialize-hook
            #'(lambda ()
                ;; EmacsのデフォルトのC-kの動作に戻す
                (define-key helm-map (kbd "C-k") 'kill-line)
                ))


  ;;ctags
  
  ;;; 注意！exuberant-ctagsを指定する必要がある
  ;;; Emacs標準のctagsでは動作しない！！
  (setq ctags-update-command "/usr/bin/ctags")
  
  ;; ace-isearch
  (when (require 'ace-isearch)
    (global-ace-isearch-mode +1)
    (define-key isearch-mode-map (kbd "M-o") 'helm-multi-swoop-all-from-isearch))
  
  
);;;ここまでUNIX用

(when (equal system-type 'darwin)
;;;なし
);;; ここまでMACOS用


(provide 'init)
;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (shell-pop leuven-theme web-mode helm-swoop ace-jump-mode anzu ace-isearch ctags-update w3 use-package-el-get smooth-scroll rainbow-mode rainbow-delimiters package-utils mozc melpa-upstream-visit magit irony hlinum helm fuzzy forecast flycheck company auto-read-only auto-complete anti-zenburn-theme)))
 '(yas-trigger-key "TAB"))
