(setq mac-option-modifier 'meta)

;; Color Themes
(add-to-list 'load-path "~/.emacs.d/vendor/color-theme")
(require 'color-theme)
(color-theme-initialize)
;(if (not window-system)
;    (progn
;      (color-theme-tty-dark) )
;  (progn
;    (load "~/.emacs.d/topfunky/theme.el")
;    (color-theme-topfunky)))
;
(color-theme-zedburn)


(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))


;; (global-set-key [(meta backspace)] 'backward-kill-word)
(global-set-key [(meta mouse-3)] 'mouse-yank-at-click)



