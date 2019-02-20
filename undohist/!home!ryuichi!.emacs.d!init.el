
((digest . "5a65968cf337bcb2d98874bf204385a5") (undo-list nil ("   " . -37826) ((marker . 37904) . -1) 37827 nil (" " . -37784) nil ("  " . -37733) nil (" " . -37699) nil (" " . -37666) 37665 nil (" " . -37641) nil (" " . -37610) nil (" " . -37600) 37598 nil ("  " . -37573) ((marker . 37904) . -1) 37574 nil (37557 . 37558) nil ("  " . -37557) (37556 . 37557) nil ("
" . 37556) ((marker . 37557) . -1) ((marker . 37557) . -1) ((marker . 37556) . -1) ((marker . 37905) . -1) nil ("
" . 37556) ((marker . 37556) . -1) ((marker . 38190) . -1) ((marker . 38190) . -1) ((marker . 37556) . -1) ((marker . 37905) . -1) nil (";;; mykie
(use-package mykie
  :config
  (setq mykie:use-major-mode-key-override t)
  (mykie:initialize)
  (mykie:set-keys nil
    \"C-w\"
    :default     (kill-region (line-beginning-position)(line-end-position))
    :region      kill-region
    \"M-w\"
    :default     (kill-ring-save (line-beginning-position)(line-end-position))
    :region      kill-ring-save 
    ))
" . 37557) ((marker . 37639) . -105) ((marker . 37639) . -105) ((marker . 37598) . -39) ((marker . 37598) . -39) ((marker . 37781) . -242) ((marker . 37781) . -242) ((marker . 37824) . -252) ((marker . 37824) . -252) ((marker . 37573) . -29) ((marker . 37573) . -29) ((marker . 37696) . -137) ((marker . 37696) . -137) ((marker . 37953) . -371) ((marker . 37953) . -371) ((marker . 37557) . -10) ((marker . 37557) . -10) ((marker . 38195) . -331) ((marker . 38195) . -331) ((marker . 37608) . -84) ((marker . 37608) . -84) ((marker . 37730) . -213) ((marker . 37730) . -213) ((marker . 37663) . -127) ((marker . 37663) . -127) ((marker . 37905) . -364) ((marker . 37905) . -364) ((marker . 37904) . -371) ((marker) . -371) ((marker . 37904) . -371) 37928 nil (nil rear-nonsticky nil 38289 . 38290) (nil fontified nil 38289 . 38290) (nil fontified nil 38288 . 38289) (nil fontified nil 38287 . 38288) (nil fontified nil 38252 . 38287) (nil fontified nil 38251 . 38252) (nil fontified nil 38246 . 38251) (nil fontified nil 38242 . 38246) (nil fontified nil 38241 . 38242) (nil fontified nil 38213 . 38241) (nil fontified nil 38212 . 38213) (nil fontified nil 38207 . 38212) (nil fontified nil 38206 . 38207) (nil fontified nil 38205 . 38206) (nil fontified nil 38204 . 38205) (nil fontified nil 38169 . 38204) (nil fontified nil 38168 . 38169) (nil fontified nil 38163 . 38168) (nil fontified nil 38158 . 38163) (nil fontified nil 38157 . 38158) (nil fontified nil 38117 . 38157) (nil fontified nil 38116 . 38117) (nil fontified nil 38110 . 38116) (nil fontified nil 38109 . 38110) (nil fontified nil 38108 . 38109) (nil fontified nil 38081 . 38108) (nil fontified nil 38080 . 38081) (nil fontified nil 38075 . 38080) (nil fontified nil 38074 . 38075) (nil fontified nil 38073 . 38074) (nil fontified nil 38047 . 38073) (nil fontified nil 38046 . 38047) (nil fontified nil 38020 . 38046) (nil fontified nil 38019 . 38020) (nil fontified nil 38015 . 38019) (nil fontified nil 38014 . 38015) (nil fontified nil 37988 . 38014) (nil fontified nil 37987 . 37988) (nil fontified nil 37983 . 37987) (nil fontified nil 37976 . 37983) (nil fontified nil 37972 . 37976) (nil fontified nil 37961 . 37972) (nil fontified nil 37960 . 37961) (nil fontified nil 37949 . 37960) (nil fontified nil 37948 . 37949) (nil fontified nil 37946 . 37948) (nil fontified nil 37934 . 37946) (nil fontified nil 37931 . 37934) (nil fontified nil 37929 . 37931) (37929 . 38290) nil ("  ;; ace-isearch
  (use-package ace-isearch
   :config
   (global-ace-isearch-mode +1)
   (custom-set-variables
    '(ace-isearch-input-length 7)
    '(ace-isearch-jump-delay 1.00)
     '(ace-isearch-function 'ace-jump-word-mode)    
    '(ace-isearch-use-jump 'printing-char))
     (define-key isearch-mode-map (kbd \"M-o\") 'helm-multi-swoop-all-from-isearch))
" . 41539) ((marker . 37639) . -87) ((marker . 37639) . -87) ((marker . 37984) . -234) ((marker . 37984) . -234) ((marker . 37598) . -361) ((marker . 37598) . -361) ((marker . 37781) . -181) ((marker . 37781) . -181) ((marker . 37989) . -44) ((marker . 37989) . -44) ((marker . 37958) . -17) ((marker . 37958) . -17) ((marker . 37953) . -55) ((marker . 37953) . -55) ((marker . 38195) . -112) ((marker . 38195) . -112) ((marker . 37954) . -146) ((marker . 37954) . -146) ((marker . 38015) . -278) ((marker . 38015) . -278) ((marker . 37904) . -361) ((marker) . -361) ((marker . 37904) . -361) 41900 nil ("5" . 41718) ("2" . 41718) nil (41716 . 41718) nil ("0" . 41715) nil (41714 . 41715) nil ("e" . -42160) ((marker . 37904) . -1) 42161 nil (42160 . 42161) nil ("e" . -42160) ((marker . 37904) . -1) ("-" . -42161) ((marker . 37904) . -1) 42162 nil (42160 . 42162) (t 23661 6928 154335 0)))
