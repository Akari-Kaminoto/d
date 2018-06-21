
((digest . "8a1ecb3fe58e987ce0d32c0a8ee10bbd") (undo-list nil ("
" . 17688) ((marker . 17692) . -1) ((marker . 18050) . -1) ((marker . 18050) . -1) ((marker) . -1) nil ("  
" . 17688) ((marker . 17692) . -3) ((marker . 17692) . -3) ((marker . 17692) . -3) ((marker . 17688) . -2) ((marker) . -3) (t 23339 32326 98773 331000) nil (17385 . 17387) nil (17382 . 17385) nil ("g" . -17382) ((marker . 17688) . -1) ("r" . -17383) ((marker . 17688) . -1) ("e" . -17384) ((marker . 17688) . -1) ("e" . -17385) ((marker . 17688) . -1) ("n" . -17386) ((marker . 17688) . -1) 17387 (t 23339 32303 390773 331000) nil (17015 . 17022) nil (17002 . 17015) nil ("p" . -17002) ((marker . 17688) . -1) ("a" . -17003) ((marker . 17688) . -1) 17004 nil (16999 . 17004) nil (16996 . 16999) nil (16997 . 16999) ("  " . 16996) ((marker . 17688) . -2) ((marker . 16996) . -1) (16997 . 16999) ("  " . 16995) (16995 . 16997) (16995 . 16996) nil ("
" . -16995) ((marker . 17688) . -1) ((marker . 17359) . -1) ((marker . 17359) . -1) ((marker . 17688) . -1) 16996 nil (" " . -16997) ((marker . 17688) . -1) ((marker . 16996) . -1) 16998 nil ("  " . 16995) (16995 . 16997) (16995 . 16996) nil (nil rear-nonsticky nil 17658 . 17659) (nil fontified nil 16998 . 17659) (16998 . 17659) nil (16999 . 17001) ("  " . 16998) (16998 . 17000) (16998 . 16999) nil (";;;** 標準IMEの設定
   (setq default-input-method \"W32-IME\")

;;;** IMEの初期化
   (w32-ime-initialize)

;;;** IME状態のモードライン表示
   (setq-default w32-ime-mode-line-state-indicator \"[--]\")
   (setq w32-ime-mode-line-state-indicator-list '(\"[--]\" \"[あ]\" \"[--]\"))
   
;;;** IME OFF時の初期カーソルカラー
   (set-cursor-color \"redd\")
   
;;;** IME ON/OFF時のカーソルカラー
   (add-hook 'input-method-activate-hook
             (lambda() (set-cursor-color \"green\")))
   (add-hook 'input-method-inactivate-hook
             (lambda() (set-cursor-color \"red\")))
   
;;;** バッファ切り替え時にIME状態を引き継ぐ
   (setq w32-ime-buffer-switch-p nil)
" . 16998) ((marker . 17175) . -306) ((marker . 17175) . -306) ((marker . 17334) . -176) ((marker . 17334) . -176) ((marker . 17145) . -336) ((marker . 17145) . -336) ((marker . 17390) . -96) ((marker . 17390) . -96) ((marker . 17688) . -429) ((marker . 17688) . -429) ((marker . 17421) . -71) ((marker . 17421) . -71) ((marker . 17126) . -522) ((marker . 17126) . -522) ((marker . 17514) . -56) ((marker . 17514) . -56) ((marker . 17688) . -591) ((marker . 17558) . -15) ((marker . 17558) . -15) ((marker . 17131) . -472) ((marker . 17131) . -472) ((marker . 17463) . -57) ((marker . 17463) . -57) ((marker . 17359) . -377) ((marker . 17359) . -377) ((marker . 17710) . -95) ((marker . 17710) . -95) ((marker . 17170) . -310) ((marker . 17170) . -310) ((marker . 17615) . -117) ((marker . 17615) . -117) ((marker . 17196) . -277) ((marker . 17196) . -277) ((marker . 17329) . -248) ((marker . 17329) . -248) ((marker . 17256) . -252) ((marker . 17256) . -252) ((marker . 17083) . -553) ((marker . 17083) . -553) ((marker . 17688) . -591) ((marker . 17642) . -591) ((marker . 17642) . -591) ((marker . 17084) . -526) ((marker . 17084) . -526) ((marker) . -591) 17589 nil ("2" . -708) ((marker . 17688) . -1) 709 nil (708 . 709) nil ("
" . -708) ((marker . 17688) . -1) ((marker . 17083) . -1) ((marker . 17688) . -1) ((marker . 17026) . -1) ("2" . -709) ((marker . 17688) . -1) 710 nil (709 . 710) (t 23331 37962 726801 0)))
