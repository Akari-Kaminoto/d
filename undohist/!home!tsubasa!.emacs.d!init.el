
((digest . "ec751dcfc3c95d3a68ad468d438229aa") (undo-list nil (";;
;; slack
;;
(use-package slack
  :commands (slack-start)
  :init
  (setq slack-buffer-emojify nil) ;; if you want to enable emoji, default nil
  (setq slack-prefer-current-team t)
  :config
  (slack-register-team
   :name \"emacs-slack\"
   :default t
   :client-id \"aaaaaaaaaaa.00000000000\"
   :client-secret \"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\"
   :token \"xoxs-sssssssssss-88888888888-hhhhhhhhhhh-jjjjjjjjjj\"
   :subscribed-channels '(test-rename rrrrr)
   :full-and-display-names t)


  (evil-define-key 'normal slack-info-mode-map
    \",u\" 'slack-room-update-messages)
  (evil-define-key 'normal slack-mode-map
    \",c\" 'slack-buffer-kill
    \",ra\" 'slack-message-add-reaction
    \",rr\" 'slack-message-remove-reaction
    \",rs\" 'slack-message-show-reaction-users
    \",pl\" 'slack-room-pins-list
    \",pa\" 'slack-message-pins-add
    \",pr\" 'slack-message-pins-remove
    \",mm\" 'slack-message-write-another-buffer
    \",me\" 'slack-message-edit
    \",md\" 'slack-message-delete
    \",u\" 'slack-room-update-messages
    \",2\" 'slack-message-embed-mention
    \",3\" 'slack-message-embed-channel
    \"\\C-n\" 'slack-buffer-goto-next-message
    \"\\C-p\" 'slack-buffer-goto-prev-message)
   (evil-define-key 'normal slack-edit-message-mode-map
    \",k\" 'slack-message-cancel-edit
    \",s\" 'slack-message-send-from-buffer
    \",2\" 'slack-message-embed-mention
    \",3\" 'slack-message-embed-channel))

(use-package alert
  :commands (alert)
  :init
  (setq alert-default-style 'notifier))
" . -24928) ((marker . 24928) . -238) ((marker . 24928) . -1476) ((marker . 24928) . -1436) ((marker . 25105) . -1476) ((marker . 25105) . -1476) ((marker . 25114) . -1436) ((marker . 25114) . -1436) ((marker . 24928) . -1476) ((marker) . -1476) ((marker . 24928) . -1476) ((marker . 24928) . -1436) ((marker . 24928) . -1476) 26404 (t 23384 9975 340008 0) nil (nil fontified nil 26403 . 26404) (nil fontified nil 26402 . 26403) (nil fontified nil 26401 . 26402) (nil fontified nil 26392 . 26401) (nil fontified nil 26391 . 26392) (nil fontified nil 26372 . 26391) (nil fontified nil 26371 . 26372) (nil fontified nil 26367 . 26371) (nil fontified nil 26366 . 26367) (nil fontified nil 26364 . 26366) (nil fontified nil 26363 . 26364) (nil fontified nil 26358 . 26363) (nil fontified nil 26356 . 26358) (nil fontified nil 26355 . 26356) (nil fontified nil 26354 . 26355) (nil fontified nil 26349 . 26354) (nil fontified nil 26348 . 26349) (nil fontified nil 26347 . 26348) (nil fontified nil 26338 . 26347) (nil fontified nil 26336 . 26338) (nil fontified nil 26335 . 26336) (nil fontified nil 26330 . 26335) (nil fontified nil 26329 . 26330) (nil fontified nil 26318 . 26329) (nil fontified nil 26317 . 26318) (nil fontified nil 26315 . 26317) (nil fontified nil 26314 . 26315) (nil fontified nil 26313 . 26314) (nil fontified nil 26285 . 26313) (nil fontified nil 26284 . 26285) (nil fontified nil 26280 . 26284) (nil fontified nil 26276 . 26280) (nil fontified nil 26247 . 26276) (nil fontified nil 26246 . 26247) (nil fontified nil 26242 . 26246) (nil fontified nil 26238 . 26242) (nil fontified nil 26226 . 26238) (nil fontified nil 26206 . 26226) (nil fontified nil 26205 . 26206) (nil fontified nil 26201 . 26205) (nil fontified nil 26197 . 26201) (nil fontified nil 26170 . 26197) (nil fontified nil 26169 . 26170) (nil fontified nil 26165 . 26169) (nil fontified nil 26161 . 26165) (nil fontified nil 26133 . 26161) (nil fontified nil 26132 . 26133) (nil fontified nil 26125 . 26132) (nil fontified nil 26124 . 26125) (nil fontified nil 26109 . 26124) (nil fontified nil 26108 . 26109) (nil fontified nil 26105 . 26108) (nil fontified nil 26104 . 26105) (nil fontified nil 26103 . 26104) (nil fontified nil 26072 . 26103) (nil fontified nil 26071 . 26072) (nil fontified nil 26065 . 26071) (nil fontified nil 26061 . 26065) (nil fontified nil 26029 . 26061) (nil fontified nil 26028 . 26029) (nil fontified nil 26022 . 26028) (nil fontified nil 26018 . 26022) (nil fontified nil 25989 . 26018) (nil fontified nil 25988 . 25989) (nil fontified nil 25984 . 25988) (nil fontified nil 25980 . 25984) (nil fontified nil 25962 . 25980) (nil fontified nil 25951 . 25962) (nil fontified nil 25950 . 25951) (nil fontified nil 25946 . 25950) (nil fontified nil 25942 . 25946) (nil fontified nil 25915 . 25942) (nil fontified nil 25914 . 25915) (nil fontified nil 25913 . 25914) (nil fontified nil 25909 . 25913) (nil fontified nil 25905 . 25909) (nil fontified nil 25883 . 25905) (nil fontified nil 25882 . 25883) (nil fontified nil 25877 . 25882) (nil fontified nil 25873 . 25877) (nil fontified nil 25853 . 25873) (nil fontified nil 25852 . 25853) (nil fontified nil 25847 . 25852) (nil fontified nil 25843 . 25847) (nil fontified nil 25807 . 25843) (nil fontified nil 25806 . 25807) (nil fontified nil 25801 . 25806) (nil fontified nil 25797 . 25801) (nil fontified nil 25770 . 25797) (nil fontified nil 25769 . 25770) (nil fontified nil 25764 . 25769) (nil fontified nil 25760 . 25764) (nil fontified nil 25736 . 25760) (nil fontified nil 25735 . 25736) (nil fontified nil 25730 . 25735) (nil fontified nil 25726 . 25730) (nil fontified nil 25721 . 25726) (nil fontified nil 25704 . 25721) (nil fontified nil 25703 . 25704) (nil fontified nil 25698 . 25703) (nil fontified nil 25694 . 25698) (nil fontified nil 25659 . 25694) (nil fontified nil 25658 . 25659) (nil fontified nil 25653 . 25658) (nil fontified nil 25649 . 25653) (nil fontified nil 25618 . 25649) (nil fontified nil 25617 . 25618) (nil fontified nil 25612 . 25617) (nil fontified nil 25608 . 25612) (nil fontified nil 25580 . 25608) (nil fontified nil 25579 . 25580) (nil fontified nil 25574 . 25579) (nil fontified nil 25570 . 25574) (nil fontified nil 25551 . 25570) (nil fontified nil 25550 . 25551) (nil fontified nil 25546 . 25550) (nil fontified nil 25542 . 25546) (nil fontified nil 25527 . 25542) (nil fontified nil 25526 . 25527) (nil fontified nil 25519 . 25526) (nil fontified nil 25518 . 25519) (nil fontified nil 25503 . 25518) (nil fontified nil 25502 . 25503) (nil fontified nil 25500 . 25502) (nil fontified nil 25499 . 25500) (nil fontified nil 25498 . 25499) (nil fontified nil 25471 . 25498) (nil fontified nil 25470 . 25471) (nil fontified nil 25466 . 25470) (nil fontified nil 25462 . 25466) (nil fontified nil 25443 . 25462) (nil fontified nil 25442 . 25443) (nil fontified nil 25441 . 25442) (nil fontified nil 25440 . 25441) (nil fontified nil 25434 . 25440) (nil fontified nil 25433 . 25434) (nil fontified nil 25418 . 25433) (nil fontified nil 25417 . 25418) (nil fontified nil 25415 . 25417) (nil fontified nil 25414 . 25415) (nil fontified nil 25412 . 25414) (nil fontified nil 25411 . 25412) (nil fontified nil 25410 . 25411) (nil fontified nil 25409 . 25410) (nil fontified nil 25386 . 25409) (nil fontified nil 25383 . 25386) (nil fontified nil 25382 . 25383) (nil fontified nil 25381 . 25382) (nil fontified nil 25376 . 25381) (nil fontified nil 25375 . 25376) (nil fontified nil 25364 . 25375) (nil fontified nil 25363 . 25364) (nil fontified nil 25362 . 25363) (nil fontified nil 25361 . 25362) (nil fontified nil 25341 . 25361) (nil fontified nil 25338 . 25341) (nil fontified nil 25337 . 25338) (nil fontified nil 25284 . 25337) (nil fontified nil 25283 . 25284) (nil fontified nil 25277 . 25283) (nil fontified nil 25274 . 25277) (nil fontified nil 25273 . 25274) (nil fontified nil 25239 . 25273) (nil fontified nil 25238 . 25239) (nil fontified nil 25224 . 25238) (nil fontified nil 25221 . 25224) (nil fontified nil 25220 . 25221) (nil fontified nil 25195 . 25220) (nil fontified nil 25194 . 25195) (nil fontified nil 25184 . 25194) (nil fontified nil 25181 . 25184) (nil fontified nil 25179 . 25181) (nil fontified nil 25178 . 25179) (nil fontified nil 25170 . 25178) (nil fontified nil 25167 . 25170) (nil fontified nil 25166 . 25167) (nil fontified nil 25153 . 25166) (nil fontified nil 25152 . 25153) (nil fontified nil 25147 . 25152) (nil fontified nil 25144 . 25147) (nil fontified nil 25124 . 25144) (nil fontified nil 25123 . 25124) (nil fontified nil 25121 . 25123) (nil fontified nil 25120 . 25121) (nil fontified nil 25113 . 25120) (nil fontified nil 25111 . 25113) (nil fontified nil 25110 . 25111) (nil fontified nil 25109 . 25110) (nil fontified nil 25108 . 25109) (nil fontified nil 25107 . 25108) (nil fontified nil 25082 . 25107) (nil fontified nil 25081 . 25082) (nil fontified nil 25077 . 25081) (nil fontified nil 25076 . 25077) (nil fontified nil 25074 . 25076) (nil fontified nil 25070 . 25074) (nil fontified nil 25069 . 25070) (nil fontified nil 25062 . 25069) (nil fontified nil 25061 . 25062) (nil fontified nil 25055 . 25061) (nil fontified nil 25054 . 25055) (nil fontified nil 25048 . 25054) (nil fontified nil 25047 . 25048) (nil fontified nil 25045 . 25047) (nil fontified nil 25044 . 25045) (nil fontified nil 25040 . 25044) (nil fontified nil 25039 . 25040) (nil fontified nil 25036 . 25039) (nil fontified nil 25035 . 25036) (nil fontified nil 25033 . 25035) (nil fontified nil 25032 . 25033) (nil fontified nil 25030 . 25032) (nil fontified nil 25029 . 25030) (nil fontified nil 25028 . 25029) (nil fontified nil 25025 . 25028) (nil fontified nil 25024 . 25025) (nil fontified nil 25004 . 25024) (nil fontified nil 25003 . 25004) (nil fontified nil 24999 . 25003) (nil fontified nil 24998 . 24999) (nil fontified nil 24996 . 24998) (nil fontified nil 24995 . 24996) (nil fontified nil 24990 . 24995) (nil fontified nil 24988 . 24990) (nil fontified nil 24987 . 24988) (nil fontified nil 24986 . 24987) (nil fontified nil 24975 . 24986) (nil fontified nil 24974 . 24975) (nil fontified nil 24973 . 24974) (nil fontified nil 24964 . 24973) (nil fontified nil 24962 . 24964) (nil fontified nil 24961 . 24962) (nil fontified nil 24956 . 24961) (nil fontified nil 24955 . 24956) (nil fontified nil 24944 . 24955) (nil fontified nil 24943 . 24944) (nil fontified nil 24942 . 24943) (nil fontified nil 24940 . 24942) (nil fontified nil 24939 . 24940) (nil fontified nil 24934 . 24939) (nil fontified nil 24933 . 24934) (nil fontified nil 24931 . 24933) (nil fontified nil 24930 . 24931) (nil fontified nil 24928 . 24930) (24928 . 26404) nil (";;
;; slack
;;
(use-package slack
  :commands (slack-start)
  :init
  (setq slack-buffer-emojify nil) ;; if you want to enable emoji, default nil
  (setq slack-prefer-current-team t)
  :config
  (slack-register-team
   :name \"emacs-slack\"
   :default t
   :client-id \"aaaaaaaaaaa.00000000000\"
   :client-secret \"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\"
   :token \"xoxs-sssssssssss-88888888888-hhhhhhhhhhh-jjjjjjjjjj\"
   :subscribed-channels '(test-rename rrrrr)
   :full-and-display-names t)


  (evil-define-key 'normal slack-info-mode-map
    \",u\" 'slack-room-update-messages)
  (evil-define-key 'normal slack-mode-map
    \",c\" 'slack-buffer-kill
    \",ra\" 'slack-message-add-reaction
    \",rr\" 'slack-message-remove-reaction
    \",rs\" 'slack-message-show-reaction-users
    \",pl\" 'slack-room-pins-list
    \",pa\" 'slack-message-pins-add
    \",pr\" 'slack-message-pins-remove
    \",mm\" 'slack-message-write-another-buffer
    \",me\" 'slack-message-edit
    \",md\" 'slack-message-delete
    \",u\" 'slack-room-update-messages
    \",2\" 'slack-message-embed-mention
    \",3\" 'slack-message-embed-channel
    \"\\C-n\" 'slack-buffer-goto-next-message
    \"\\C-p\" 'slack-buffer-goto-prev-message)
   (evil-define-key 'normal slack-edit-message-mode-map
    \",k\" 'slack-message-cancel-edit
    \",s\" 'slack-message-send-from-buffer
    \",2\" 'slack-message-embed-mention
    \",3\" 'slack-message-embed-channel))

(use-package alert
  :commands (alert)
  :init
  (setq alert-default-style 'notifier))
" . 24928) 26404 nil (24933 . 24939) nil (24934 . 24936) nil (24933 . 24934) nil (24931 . 24933) nil (24928 . 24930) nil (":" . -24928) 24929 nil (24928 . 24929) nil (24927 . 24929) nil ("t" . -25013) 25014 nil (25010 . 25013) nil ("  (slack-register-team
   :name \"test\"
   :client-id \"3333333333.77777777777\"
   :client-secret \"cccccccccccccccccccccccccccccccc\"
   :token \"xoxs-yyyyyyyyyy-zzzzzzzzzzz-hhhhhhhhhhh-llllllllll\"
   :subscribed-channels '(hoge fuga))
" . -25397) 25629 nil (nil rear-nonsticky nil 26618 . 26619) (nil fontified nil 24928 . 26619) (24928 . 26619) (t 23384 8348 680008 0) nil (24211 . 25157) (";;   (defun my-tabbar-buffer-list ()
;;     (delq nil
;;           (mapcar #'(lambda (b)
;;                       (cond
;;                        ;; Always include the current buffer.
;;                        ((eq (current-buffer) b) b)
;;                        ((buffer-file-name b) b)
;;                        ((char-equal ?\\  (aref (buffer-name b) 0)) nil)
;;                        ((equal \"*scratch*\" (buffer-name b)) b) ; *scratch*バッファは表示する
;;                        ((char-equal ?* (aref (buffer-name b) 0)) nil) ; それ以外の * で始まるバッファは表示しない
;;                        ((buffer-live-p b) b)))
;;                   (buffer-list))))
;;   (setq tabbar-buffer-list-function 'my-tabbar-buffer-list))
;;; tabbarは使わない 


;;;
;;; OS によって設定を切り替える例
;;;

(when (eq system-type 'windows-nt) ; Windows

;;;
;;; IME関連の設定
;;;

;; Windows-patchVerでも動くように
  
;;;** 標準IMEの設定
(when (locate-library \"w32-ime\")
  (progn

    (setq default-input-method \"W32-IME\")
" . 24211) (24926 . 24927) 24928 (t 23384 8348 680008 0) nil (";; html-script-src
 (use-package html-script-src)
" . -24928) 24978 (t 23384 8037 388008 0) nil (24211 . 25164) (";;   (defun my-tabbar-buffer-list ()
;;     (delq nil
;;           (mapcar #'(lambda (b)
;;                       (cond
;;                        ;; Always include the current buffer.
;;                        ((eq (current-buffer) b) b)
;;                        ((buffer-file-name b) b)
;;                        ((char-equal ?\\  (aref (buffer-name b) 0)) nil)
;;                        ((equal \"*scratch*\" (buffer-name b)) b) ; *scratch*バッファは表示する
;;                        ((char-equal ?* (aref (buffer-name b) 0)) nil) ; それ以外の * で始まるバッファは表示しない
;;                        ((buffer-live-p b) b)))
;;                   (buffer-list))))
;;   (setq tabbar-buffer-list-function 'my-tabbar-buffer-list))
;;; tabbarは使わない
                       
;; html-script-src
 (use-package html-script-src)

;;;
;;; OS によって設定を切り替える例
;;;

(when (eq system-type 'windows-nt) ; Windows

;;;
;;; IME関連の設定
;;;

;; Windows-patchVerでも動くように
  
;;;** 標準IMEの設定
(when (locate-library \"w32-ime\")
  (progn
" . 24211) (24927 . 24950) 25007 (t 23384 8037 388008 0) nil (24960 . 24961) nil (24949 . 24960) nil ("r" . -24949) ("e" . -24950) ("q" . -24951) ("u" . -24952) ("i" . -24953) ("r" . -24954) ("e" . -24955) (" " . -24956) ("'" . -24957) 24958 nil (24945 . 24946) nil (24942 . 24945) nil (24940 . 24942) nil ("p" . -24940) 24941 nil (24940 . 24941) nil ("o" . -24940) ("p" . -24941) 24942 nil (24935 . 24942) nil ("^" . -24935) ("-" . -24936) 24937 nil (24935 . 24937) nil ("^" . -24935) ("s" . -24936) ("c" . -24937) 24938 nil (24931 . 24938) nil (24930 . 24931) nil (";" . -24930) 24931 nil (24928 . 24931) nil (24927 . 24928) nil (nil rear-nonsticky nil 24954 . 24955) (nil fontified nil 24928 . 24955) (24928 . 24955) nil (24927 . 24929) (t 23384 6908 844008 0) nil (1022 . 1023) nil (1000 . 1001) nil (1018 . 1020) nil (1018 . 1019) nil (1000 . 1002) nil (";; 何も考えず公式のREADMEからコピペすればいいコード
" . -1016) 1047 (t 23384 6882 328008 0) nil ("
" . -1703) (" " . -1704) 1705 nil (1703 . 1705) nil (1687 . 1689) nil (" " . -1687) (1686 . 1687) nil (1668 . 1670) nil (1668 . 1672) nil (" " . 1667) (1668 . 1669) nil (1648 . 1650) nil (":" . -1648) (":" . -1649) 1650 nil (1648 . 1650) nil (" " . 1647) (1648 . 1649) (t 23382 63387 760453 508000) nil ("
" . 29408) nil ("
" . 30493) (t 23382 63335 980453 508000) nil (6695 . 6697) nil ("有" . -6695) 6696 nil ("功" . -6696) 6697 (t 23382 60988 328453 508000) nil (16945 . 16947) (t 23382 60984 24453 508000) nil undo-tree-canary))
