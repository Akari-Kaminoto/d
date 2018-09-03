
((digest . "df13bcfbfee470694fa2eccc0fc9a7d2") (undo-list nil (";" . 8785) nil (";" . 8831) nil (8546 . 9381) (";;----
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
;(setq display-time-24hr-format t)   ;; 24時表示
;(display-time-mode t)

;; モードラインの割合表示を総行数表示
(defvar my-lines-page-mode t)
(defvar my-mode-line-format)

(when my-lines-page-mode
  (setq my-mode-line-format \"%d\")
  (if size-indication-mode
      (setq my-mode-line-format (concat my-mode-line-format \" of %%I\")))
  (cond ((and (eq line-number-mode t) (eq column-number-mode t))
         (setq my-mode-line-format (concat my-mode-line-format \" (%%l,%%c)\")))
        ((eq line-number-mode t)
         (setq my-mode-line-format (concat my-mode-line-format \" L%%l\")))
        ((eq column-number-mode t)
" . 8546) ((marker . 8853) . -145) ((marker . 8853) . -145) ((marker . 8933) . -116) ((marker . 8933) . -116) ((marker . 8852) . -152) ((marker . 8852) . -152) ((marker . 9093) . -50) ((marker . 9093) . -50) ((marker . 8738) . -180) ((marker . 8738) . -180) ((marker . 9237) . -32) ((marker . 9237) . -32) ((marker . 8934) . -101) ((marker . 8934) . -101) ((marker . 8993) . -91) ((marker . 8993) . -91) ((marker . 8959) . -94) ((marker . 8959) . -94) ((marker . 8904) . -123) ((marker . 8904) . -123) ((marker . 9158) . -39) ((marker . 9158) . -39) ((marker . 8830) . -173) ((marker . 8830) . -173) ((marker . 8874) . -143) ((marker . 8874) . -143) ((marker . 9020) . -57) ((marker . 9020) . -57) ((marker . 8785) . -205) ((marker . 8830) . -252) ((marker . 9270) . -30) ((marker . 9270) . -30) ((marker . 8553) . -813) ((marker . 8553) . -813) ((marker . 8713) . -252) ((marker . 8713) . -252) ((marker . 8706) . -298) ((marker . 8706) . -298) ((marker . 8698) . -321) ((marker . 8698) . -321) ((marker . 8691) . -322) ((marker . 8691) . -322) ((marker . 8689) . -343) ((marker . 8689) . -343) ((marker . 8669) . -373) ((marker . 8669) . -373) ((marker . 8662) . -402) ((marker . 8662) . -402) ((marker . 9344) . -7) ((marker . 9344) . -7) ((marker . 8785) . -205) ((marker . 8785) . -205) ((marker . 8647) . -403) ((marker . 8647) . -403) ((marker . 8640) . -428) ((marker . 8640) . -428) ((marker . 8637) . -462) ((marker . 8637) . -462) ((marker . 8603) . -489) ((marker . 8603) . -489) ((marker . 8596) . -562) ((marker . 8596) . -562) ((marker . 8585) . -627) ((marker . 8585) . -627) ((marker . 8578) . -706) ((marker . 8578) . -706) ((marker . 8576) . -739) ((marker . 8576) . -739) ((marker) . -205) (8705 . 8718) 8738 nil ("s" . -8738) ((marker) . -1) ("c" . -8739) ((marker) . -1) 8740 nil (8738 . 8740) (t 23436 47294 55222 999000) nil (8546 . 9381) (";;----
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
;(setq display-time-24hr-format t)   ;; 24時表示
;(display-time-mode t)

;; モードラインの割合表示を総行数表示
(defvar my-lines-page-mode t)
(defvar my-mode-line-format)

(when my-lines-page-mode
  (setq my-mode-line-format \"%d\")
  (if size-indication-mode
      (setq my-mode-line-format (concat my-mode-line-format \" of %%I\")))
  (cond ((and (eq line-number-mode t) (eq column-number-mode t))
         (setq my-mode-line-format (concat my-mode-line-format \" (%%l,%%c)\")))
        ((eq line-number-mode t)
         (setq my-mode-line-format (concat my-mode-line-format \" L%%l\")))
        ((eq column-number-mode t)
" . 8546) ((marker . 8546) . -205) ((marker . 8785) . -205) ((marker . 8546) . -180) ((marker . 8738) . -848) ((marker . 8738) . -848) ((marker . 8546) . -238) ((marker . 8785) . -205) ((marker . 8830) . -252) ((marker . 8546) . -205) ((marker . 8553) . -813) ((marker . 8553) . -813) ((marker . 8713) . -739) ((marker . 8713) . -739) ((marker . 8706) . -706) ((marker . 8706) . -706) ((marker . 8698) . -627) ((marker . 8698) . -627) ((marker . 8691) . -562) ((marker . 8691) . -562) ((marker . 8689) . -489) ((marker . 8689) . -489) ((marker . 8669) . -462) ((marker . 8669) . -462) ((marker . 8662) . -428) ((marker . 8662) . -428) ((marker . 8785) . -205) ((marker . 8785) . -205) ((marker . 8647) . -403) ((marker . 8647) . -403) ((marker . 8640) . -402) ((marker . 8640) . -402) ((marker . 8637) . -373) ((marker . 8637) . -373) ((marker . 8603) . -343) ((marker . 8603) . -343) ((marker . 8596) . -322) ((marker . 8596) . -322) ((marker . 8585) . -321) ((marker . 8585) . -321) ((marker . 8578) . -298) ((marker . 8578) . -298) ((marker . 8576) . -252) ((marker . 8576) . -252) ((marker) . -205) ((marker) . -205) ((marker . 8546) . -205) ((marker . 8546) . -205) (8705 . 8718) 8738 (t 23436 47294 55222 999000) nil (18 . 72) ("2018/09/03 13:28:24 from ryuichi-VirtualBox by ryuichi" . 18) 8738 nil ("
" . 8738) ((marker . 8830) . -1) ((marker . 8546) . -1) ((marker . 9270) . -1) ((marker . 9270) . -1) nil ("(display-time)" . 8738) ((marker . 8546) . -14) ((marker . 8785) . -14) ((marker) . -14) ((marker . 8546) . -14) ((marker . 8546) . -14) ((marker* . 8785) . 14) ((marker . 8786) . -1) ((marker* . 8817) . 1) ((marker . 8818) . -14) nil (" " . 8751) nil ("l" . 8752) ("i" . 8752) ("n" . 8752) nil (18 . 72) ("2018/09/03 13:26:16 from ryuichi-VirtualBox by ryuichi" . 18) 8756 nil (8738 . 8756) nil (" " . 8739) ((marker . 8546) . -1) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) ((marker . 8546) . -1) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) nil (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) (" " . 8739) nil undo-tree-canary))
