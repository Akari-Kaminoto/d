(deftheme leuven
  "Created 2018-06-15.")

(custom-theme-set-variables
 'leuven
 '(ansi-color-faces-vector [default default default italic underline success warning error])
 '(ansi-color-names-vector ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"]))

(custom-theme-set-faces
 'leuven
 '(bold ((((class color) (min-colors 89)) (:weight bold :foreground "black"))))
 '(bold-italic ((((class color) (min-colors 89)) (:weight bold :slant italic :foreground "black"))))
 '(italic ((((class color) (min-colors 89)) (:slant italic :foreground "#1A1A1A"))))
 '(underline ((((class color) (min-colors 89)) (:underline t))))
 '(cursor ((((class color) (min-colors 89)) (:background "#21BDFF"))))
 '(menu ((((class color) (min-colors 89)) (:foreground "#FFFFFF" :background "#333333"))))
 '(fringe ((((class color) (min-colors 89)) (:foreground "#4C9ED9" :background "white"))))
 '(highlight ((((class color) (min-colors 89)) (:background "#E6ECFF"))))
 '(region ((((class color) (min-colors 89)) (:background "#8ED3FF"))))
 '(secondary-selection ((((class color) (min-colors 89)) (:weight bold :background "#FBE448"))))
 '(isearch ((((class color) (min-colors 89)) (:weight bold :underline "#FF9632" :foreground nil :background "#FDBD33"))))
 '(isearch-fail ((((class color) (min-colors 89)) (:weight bold :foreground "black" :background "#FF9999"))))
 '(lazy-highlight ((((class color) (min-colors 89)) (:underline "#FF9632" :background "#FFFF00"))))
 '(trailing-whitespace ((((class color) (min-colors 89)) (:foreground "#E8E8E8" :background "#FFFFAB"))))
 '(query-replace ((((class color) (min-colors 89)) (:inherit isearch))))
 '(whitespace-hspace ((((class color) (min-colors 89)) (:foreground "#D2D2D2"))))
 '(whitespace-indentation ((((class color) (min-colors 89)) (:foreground "#E8E8E8" :background "white"))))
 '(whitespace-line ((((class color) (min-colors 89)) (:foreground "#CC0000" :background "#FFFF88"))))
 '(whitespace-tab ((((class color) (min-colors 89)) (:foreground "#E8E8E8" :background "white"))))
 '(whitespace-trailing ((((class color) (min-colors 89)) (:foreground "#E8E8E8" :background "#FFFFAB"))))
 '(mode-line ((((class color) (min-colors 89)) (:box (:line-width 1 :color "#1A2F54") :foreground "#85CEEB" :background "#335EA8"))))
 '(mode-line-inactive ((((class color) (min-colors 89)) (:box (:line-width 1 :color "#4E4E4C") :foreground "#F0F0EF" :background "#9B9C97"))))
 '(mode-line-buffer-id ((((class color) (min-colors 89)) (:weight bold :foreground "white"))))
 '(mode-line-emphasis ((((class color) (min-colors 89)) (:weight bold :foreground "white"))))
 '(mode-line-highlight ((((class color) (min-colors 89)) (:foreground "yellow"))))
 '(minibuffer-prompt ((((class color) (min-colors 89)) (:weight bold :foreground "black" :background "gold"))))
 '(escape-glyph ((((class color) (min-colors 89)) (:foreground "#008ED1"))))
 '(error ((((class color) (min-colors 89)) (:foreground "red"))))
 '(warning ((((class color) (min-colors 89)) (:weight bold :foreground "orange"))))
 '(success ((((class color) (min-colors 89)) (:foreground "green"))))
 '(font-lock-builtin-face ((((class color) (min-colors 89)) (:foreground "#006FE0"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#A00000"))))
 '(font-lock-comment-face ((t (:foreground "#A00000" :slant italic))))
 '(font-lock-constant-face ((((class color) (min-colors 89)) (:foreground "#D0372D"))))
 '(font-lock-doc-face ((((class color) (min-colors 89)) (:foreground "#036A07"))))
 '(font-lock-function-name-face ((((class color) (min-colors 89)) (:weight normal :foreground "#006699"))))
 '(font-lock-keyword-face ((((class color) (min-colors 89)) (:bold nil :foreground "#0000FF"))))
 '(font-lock-preprocessor-face ((((class color) (min-colors 89)) (:foreground "#808080"))))
 '(font-lock-regexp-grouping-backslash ((((class color) (min-colors 89)) (:weight bold :inherit nil))))
 '(font-lock-regexp-grouping-construct ((((class color) (min-colors 89)) (:weight bold :inherit nil))))
 '(font-lock-string-face ((((class color) (min-colors 89)) (:foreground "#008000"))))
 '(font-lock-type-face ((((class color) (min-colors 89)) (:weight normal :foreground "#6434A3"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 89)) (:weight normal :foreground "#BA36A5"))))
 '(font-lock-warning-face ((((class color) (min-colors 89)) (:weight bold :foreground "red"))))
 '(link ((((class color) (min-colors 89)) (:weight normal :underline t :foreground "#006DAF"))))
 '(link-visited ((((class color) (min-colors 89)) (:underline t :foreground "#E5786D"))))
 '(button ((((class color) (min-colors 89)) (:underline t :foreground "#006DAF"))))
 '(header-line ((((class color) (min-colors 89)) (:weight bold :underline "#BF8DFF" :overline "#BF8DFF" :foreground "black" :background "#E8E8FF"))))
 '(diff-added ((((class color) (min-colors 89)) (:background "#DDFFDD"))))
 '(diff-changed ((((class color) (min-colors 89)) (:foreground "#0000FF" :background "#DDDDFF"))))
 '(diff-context ((((class color) (min-colors 89)) (:foreground "gray33"))))
 '(diff-file-header ((((class color) (min-colors 89)) (:foreground "#800000" :background "#FFFFAF"))))
 '(diff-function ((((class color) (min-colors 89)) (:foreground "darkgray"))))
 '(diff-header ((((class color) (min-colors 89)) (:foreground "#800000" :background "#FFFFAF"))))
 '(diff-hunk-header ((((class color) (min-colors 89)) (:foreground "#990099" :background "#FFEEFF"))))
 '(diff-index ((((class color) (min-colors 89)) (:foreground "#800000" :background "#FFFFAF"))))
 '(diff-indicator-added ((((class color) (min-colors 89)) (:foreground "#3A993A" :background "#DBFFDB"))))
 '(diff-indicator-changed ((((class color) (min-colors 89)) (:background "#8080FF"))))
 '(diff-indicator-removed ((((class color) (min-colors 89)) (:foreground "#CC3333" :background "#FFDDDD"))))
 '(diff-refine-added ((((class color) (min-colors 89)) (:background "#97F295"))))
 '(diff-refine-removed ((((class color) (min-colors 89)) (:background "#FFB6BA"))))
 '(diff-removed ((((class color) (min-colors 89)) (:background "#FEE8E9"))))
 '(ace-jump-face-foreground ((((class color) (min-colors 89)) (:weight bold :foreground "black" :background "#FEA500"))))
 '(anzu-match-1 ((((class color) (min-colors 89)) (:foreground "black" :background "aquamarine"))))
 '(anzu-match-2 ((((class color) (min-colors 89)) (:foreground "black" :background "springgreen"))))
 '(anzu-match-3 ((((class color) (min-colors 89)) (:foreground "black" :background "red"))))
 '(anzu-mode-line ((((class color) (min-colors 89)) (:foreground "black" :background "#80FF80"))))
 '(anzu-mode-line-no-match ((((class color) (min-colors 89)) (:foreground "black" :background "#FF8080"))))
 '(anzu-replace-highlight ((((class color) (min-colors 89)) (:inherit query-replace))))
 '(anzu-replace-to ((((class color) (min-colors 89)) (:weight bold :foreground "#BD33FD" :background "#FDBD33"))))
 '(comint-highlight-input ((((class color) (min-colors 89)) (:weight bold :foreground "#0000FF" :inherit nil))))
 '(comint-highlight-prompt ((((class color) (min-colors 89)) (:weight bold :foreground "#0000FF" :inherit nil))))
 '(company-tooltip-common-selection ((((class color) (min-colors 89)) (:weight normal :foreground "#F9ECCC" :inherit company-tooltip-selection))))
 '(company-tooltip-selection ((((class color) (min-colors 89)) (:weight bold :foreground "white" :background "#0052A4"))))
 '(company-tooltip-annotation-selection ((((class color) (min-colors 89)) (:weight normal :foreground "#F9ECCC"))))
 '(company-tooltip-common ((((class color) (min-colors 89)) (:weight normal :foreground "#B000B0" :inherit company-tooltip))))
 '(company-tooltip ((((class color) (min-colors 89)) (:weight bold :foreground "black" :background "#EBF4FE"))))
 '(company-tooltip-annotation ((((class color) (min-colors 89)) (:weight normal :foreground "#2415FF"))))
 '(company-preview-common ((((class color) (min-colors 89)) (:weight normal :foreground "#C0C0C0" :inherit hl-line))))
 '(company-scrollbar-bg ((((class color) (min-colors 89)) (:background "#EBF4FE"))))
 '(company-scrollbar-fg ((((class color) (min-colors 89)) (:background "#D1DAE4"))))
 '(custom-button ((((class color) (min-colors 89)) (:box (:line-width 2 :style released-button) :foreground "black" :background "lightgrey"))))
 '(custom-button-mouse ((((class color) (min-colors 89)) (:box (:line-width 2 :style released-button) :foreground "black" :background "grey90"))))
 '(custom-button-pressed ((((class color) (min-colors 89)) (:box (:line-width 2 :style pressed-button) :foreground "black" :background "light grey"))))
 '(custom-button-pressed-unraised ((((class color) (min-colors 89)) (:underline t :foreground "magenta4"))))
 '(custom-button-unraised ((((class color) (min-colors 89)) (:underline t))))
 '(custom-changed ((((class color) (min-colors 89)) (:foreground "white" :background "blue"))))
 '(custom-comment ((((class color) (min-colors 89)) (:background "gray85"))))
 '(custom-comment-tag ((((class color) (min-colors 89)) (:foreground "blue4"))))
 '(custom-documentation ((((class color) (min-colors 89)) (nil))))
 '(custom-face-tag ((((class color) (min-colors 89)) (:family "Sans Serif" :height 1.2 :weight bold))))
 '(custom-group-tag ((((class color) (min-colors 89)) (:height 1.2 :weight bold :foreground "blue1"))))
 '(custom-group-tag-1 ((((class color) (min-colors 89)) (:family "Sans Serif" :height 1.2 :weight bold :foreground "red1"))))
 '(custom-invalid ((((class color) (min-colors 89)) (:foreground "yellow" :background "red"))))
 '(custom-link ((((class color) (min-colors 89)) (:underline t :foreground "blue1"))))
 '(custom-modified ((((class color) (min-colors 89)) (:foreground "white" :background "blue"))))
 '(custom-rogue ((((class color) (min-colors 89)) (:foreground "pink" :background "black"))))
 '(custom-saved ((((class color) (min-colors 89)) (:underline t))))
 '(custom-set ((((class color) (min-colors 89)) (:foreground "blue" :background "white"))))
 '(custom-state ((((class color) (min-colors 89)) (:foreground "green4"))))
 '(custom-themed ((((class color) (min-colors 89)) (:foreground "white" :background "blue1"))))
 '(custom-variable-button ((((class color) (min-colors 89)) (:weight bold :underline t))))
 '(custom-variable-tag ((((class color) (min-colors 89)) (:family "Sans Serif" :height 1.2 :weight bold :foreground "blue1"))))
 '(custom-visibility ((((class color) (min-colors 89)) (:weight normal :underline t :foreground "#006DAF"))))
 '(diary-face ((((class color) (min-colors 89)) (:foreground "#87C9FC"))))
 '(dired-directory ((((class color) (min-colors 89)) (:weight bold :foreground "blue" :background "#FFFFD2"))))
 '(dired-header ((((class color) (min-colors 89)) (:weight bold :foreground "blue" :background "#FFFFD2"))))
 '(dired-ignored ((((class color) (min-colors 89)) (:strike-through t :foreground "red"))))
 '(dired-mark ((((class color) (min-colors 89)) (:foreground "#AA0000" :background "#FFAAAA"))))
 '(dired-marked ((((class color) (min-colors 89)) (:foreground "#AA0000" :background "#FFAAAA"))))
 '(dired-symlink ((((class color) (min-colors 89)) (:foreground "#1F8DD6"))))
 '(eldoc-highlight-function-argument ((((class color) (min-colors 89)) (:weight bold :foreground "red" :background "#FFE4FF"))))
 '(file-name-shadow ((((class color) (min-colors 89)) (:foreground "#7F7F7F"))))
 '(flycheck-error ((((class color) (min-colors 89)) (:underline (:color "#FE251E" :style wave) :weight bold :background "#FFE1E1"))))
 '(flycheck-info ((((class color) (min-colors 89)) (:underline (:color "#158A15" :style wave) :weight bold))))
 '(flycheck-warning ((((class color) (min-colors 89)) (:underline (:color "#F4A939" :style wave) :weight bold :background "#FFFFBE"))))
 '(flycheck-fringe-error ((((class color) (min-colors 89)) (:foreground "#FE251E"))))
 '(flycheck-fringe-info ((((class color) (min-colors 89)) (:foreground "158A15"))))
 '(flycheck-fringe-warning ((((class color) (min-colors 89)) (:foreground "#F4A939"))))
 '(flycheck-error-list-line-number ((((class color) (min-colors 89)) (:foreground "#A535AE"))))
 '(helm-action ((((class color) (min-colors 89)) (:foreground "black"))))
 '(helm-buffer-directory ((((class color) (min-colors 89)) (:weight bold :foreground "blue" :background "#FFFFD2"))))
 '(helm-buffer-process ((((class color) (min-colors 89)) (:foreground "#008200"))))
 '(helm-candidate-number ((((class color) (min-colors 89)) (:foreground "black" :background "#FFFF66"))))
 '(helm-ff-directory ((((class color) (min-colors 89)) (:weight bold :foreground "blue" :background "#FFFFD2"))))
 '(helm-ff-dotted-directory ((((class color) (min-colors 89)) (:weight bold :foreground "blue" :background "#FFFFD2"))))
 '(helm-ff-executable ((((class color) (min-colors 89)) (:foreground "green3" :background "white"))))
 '(helm-ff-file ((((class color) (min-colors 89)) (:foreground "black"))))
 '(helm-ff-invalid-symlink ((((class color) (min-colors 89)) (:foreground "yellow" :background "red"))))
 '(helm-ff-symlink ((((class color) (min-colors 89)) (:foreground "#1F8DD6"))))
 '(helm-grep-file ((((class color) (min-colors 89)) (:weight bold :foreground "#2A489E"))))
 '(helm-grep-lineno ((((class color) (min-colors 89)) (:weight bold :foreground "#A535AE"))))
 '(helm-grep-match ((((class color) (min-colors 89)) (:weight bold :background "#FBE448"))))
 '(helm-lisp-show-completion ((((class color) (min-colors 89)) (:height 1.1 :underline nil :foreground "white" :background "#9E3699"))))
 '(helm-match ((((class color) (min-colors 89)) (:weight bold :background "#FBE448"))))
 '(helm-moccur-buffer ((((class color) (min-colors 89)) (:foreground "#0066CC"))))
 '(helm-selection ((((class color) (min-colors 89)) (:background "#E6ECFF"))))
 '(helm-selection-line ((((class color) (min-colors 89)) (:background "#E4E4E3"))))
 '(helm-separator ((((class color) (min-colors 89)) (:foreground "red"))))
 '(helm-source-header ((((class color) (min-colors 89)) (:height 1.3 :weight bold :overline "#A7A7A7" :foreground "#3C3C3C" :background "#F0F0F0"))))
 '(helm-swoop-target-line-block-face ((((class color) (min-colors 89)) (:background "#CCCC00" :foreground "#222222"))))
 '(helm-swoop-target-line-face ((((class color) (min-colors 89)) (:underline nil :foreground "white" :background "#9E3699"))))
 '(helm-swoop-target-word-face ((((class color) (min-colors 89)) (:weight bold :foreground nil :background "#FDBD33"))))
 '(helm-visible-mark ((((class color) (min-colors 89)) (:foreground "#AA0000" :background "#FFAAAA"))))
 '(hl-line ((((class color) (min-colors 89)) (:underline "#FFFF19" :background "#F6FECD"))))
 '(info-header-node ((((class color) (min-colors 89)) (:underline t :foreground "orange"))))
 '(info-header-xref ((((class color) (min-colors 89)) (:underline t :foreground "dodger blue"))))
 '(info-index-match ((((class color) (min-colors 89)) (:weight bold :foreground nil :background "#FDBD33"))))
 '(info-menu-header ((((class color) (min-colors 89)) (:height 1.0 :weight bold :overline "#123555" :foreground "#123555" :background "#E5F4FB"))))
 '(info-menu-star ((((class color) (min-colors 89)) (:foreground "black"))))
 '(info-node ((((class color) (min-colors 89)) (:underline t :foreground "blue"))))
 '(info-title-1 ((((class color) (min-colors 89)) (:height 1.3 :weight bold :overline "#A7A7A7" :foreground "#3C3C3C" :background "#F0F0F0"))))
 '(info-xref ((((class color) (min-colors 89)) (:underline t :foreground "#006DAF"))))
 '(info-xref-visited ((((class color) (min-colors 89)) (:underline t :foreground "magenta4"))))
 '(linum ((((class color) (min-colors 89)) (:foreground "#9A9A9A" :background "#EDEDED"))))
 '(match ((((class color) (min-colors 89)) (:weight bold :background "#FBE448"))))
 '(next-error ((((class color) (min-colors 89)) (:height 1.1 :underline nil :foreground "white" :background "#9E3699"))))
 '(nobreak-space ((((class color) (min-colors 89)) (:background "#CCE8F6"))))
 '(rainbow-delimiters-depth-1-face ((((class color) (min-colors 89)) (:foreground "#707183"))))
 '(rainbow-delimiters-depth-2-face ((((class color) (min-colors 89)) (:foreground "#7388D6"))))
 '(rainbow-delimiters-depth-3-face ((((class color) (min-colors 89)) (:foreground "#909183"))))
 '(rainbow-delimiters-depth-4-face ((((class color) (min-colors 89)) (:foreground "#709870"))))
 '(rainbow-delimiters-depth-5-face ((((class color) (min-colors 89)) (:foreground "#907373"))))
 '(rainbow-delimiters-depth-6-face ((((class color) (min-colors 89)) (:foreground "#6276BA"))))
 '(rainbow-delimiters-depth-7-face ((((class color) (min-colors 89)) (:foreground "#858580"))))
 '(rainbow-delimiters-depth-8-face ((((class color) (min-colors 89)) (:foreground "#80A880"))))
 '(rainbow-delimiters-depth-9-face ((((class color) (min-colors 89)) (:foreground "#887070"))))
 '(rainbow-delimiters-mismatched-face ((((class color) (min-colors 89)) (:weight bold :underline "red" :foreground "black" :background "#FFDCDC"))))
 '(rainbow-delimiters-unmatched-face ((((class color) (min-colors 89)) (:weight bold :underline "red" :foreground "black" :background "#FFDCDC"))))
 '(shadow ((((class color) (min-colors 89)) (:foreground "#7F7F7F"))))
 '(show-paren-match ((((class color) (min-colors 89)) (:background "#C0E8C3"))))
 '(show-paren-mismatch ((((class color) (min-colors 89)) (:weight bold :underline "red" :foreground "black" :background "#FFDCDC"))))
 '(tool-bar ((((class color) (min-colors 89)) (:box (:line-width 1 :style released-button) :foreground "black" :background "gray75"))))
 '(tooltip ((((class color) (min-colors 89)) (:foreground "black" :background "light yellow"))))
 '(vhl/default-face ((((class color) (min-colors 89)) (:underline nil :foreground "white" :background "#9E3699"))))
 '(web-mode-current-element-highlight-face ((((class color) (min-colors 89)) (:background "#BF8DFF"))))
 '(web-mode-folded-face ((((class color) (min-colors 89)) (:box (:line-width 1 :color "#777777") :foreground "#9A9A6A" :background "#F3F349"))))
 '(web-mode-html-attr-name-face ((((class color) (min-colors 89)) (:foreground "#F36335"))))
 '(web-mode-html-tag-bracket-face ((((class color) (min-colors 89)) (:foreground "#AE1B9A"))))
 '(web-mode-html-tag-face ((((class color) (min-colors 89)) (:foreground "#AE1B9A"))))
 '(web-mode-part-face ((((class color) (min-colors 89)) (:background "#FFFFE0"))))
 '(web-mode-script-face ((((class color) (min-colors 89)) (:background "#EFF0F1"))))
 '(widget-button ((((class color) (min-colors 89)) (:weight normal :underline t :foreground "#006DAF"))))
 '(widget-button-pressed ((((class color) (min-colors 89)) (:foreground "red"))))
 '(widget-documentation ((((class color) (min-colors 89)) (:foreground "green4"))))
 '(widget-field ((((class color) (min-colors 89)) (:background "gray85"))))
 '(widget-inactive ((((class color) (min-colors 89)) (:foreground "dim gray"))))
 '(widget-single-line-field ((((class color) (min-colors 89)) (:background "gray85"))))
 '(default ((((class color) (min-colors 89)) (:foreground "#333333" :background "#FFFFFF")))))

(provide-theme 'leuven)
