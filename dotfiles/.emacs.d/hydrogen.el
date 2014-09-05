(setq x-alt-keysym 'meta)
(set-keyboard-coding-system nil)


;; Some Mac-friendly key counterparts
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-x") 'kill-region) ;; Cut
;;(global-set-key (kbd "s-c") 'kill-ring-save) ;; Copy
(global-set-key (kbd "s-c") 'ns-copy-including-secondary) ;; Copy

(global-set-key (kbd "s-v") 'yank) ;; paste

(global-set-key (kbd "s-/") 'comment-or-uncomment-region-or-line) ;; comment
(global-set-key (kbd "s-n") 'new-frame)


(global-set-key [(meta backspace)] 'backward-kill-word)


;; Keyboard Overrides
;; (define-key textile-mode-map (kbd "S-s") 'save-buffer)
;; (define-key text-mode-map (kbd "S-s") 'save-buffer)


(global-set-key [(meta up)] 'scroll-up)
(global-set-key [(meta down)] 'scroll-down)

(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])
(global-set-key [(meta up)] 'scroll-down)
(global-set-key [(meta down)] 'scroll-up)


;; Color Themes
(add-to-list 'load-path "~/.emacs.d/vendor/color-theme")
(require 'color-theme)
(color-theme-initialize)
(if (not window-system)
    (progn
      (color-theme-tty-dark) )
  (progn
    ;; (load "~/.emacs.d/topfunky/theme.el")
    ;; (color-theme-topfunky)))
    (color-theme-zenburn)))

;; Mouse Copy and Paste:
;; Did not work:
;; (setq interprogram-cut-function 'own-clipboard)
;; (setq interprogram-paste-function 'get-clipboard)

(setq x-select-enable-clipboard t) ; as above
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)






;;(modify-frame-parameters (selected-frame)   `((alpha . 90)))

;; (defun djcb-opacity-modify (&optional dec)
;;   "modify the transparency of the emacs frame; if DEC is t,
;;     decrease the transparency, otherwise increase it in 10%-steps"
;;   (let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before setting
;;           (oldalpha (if alpha-or-nil alpha-or-nil 100))
;;           (newalpha (if dec (- oldalpha 10) (+ oldalpha 10))))
;;     (when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha 100))
;;       (modify-frame-parameters nil (list (cons 'alpha newalpha))))))

;;  ;; C-8 will increase opacity (== decrease transparency)
;;  ;; C-9 will decrease opacity (== increase transparency
;;  ;; C-0 will returns the state to normal
;; (global-set-key (kbd "C-8") '(lambda()(interactive)(djcb-opacity-modify)))
;; (global-set-key (kbd "C-9") '(lambda()(interactive)(djcb-opacity-modify t)))
;; (global-set-key (kbd "C-0") '(lambda()(interactive)
;;                                (modify-frame-parameters nil `((alpha . 100)))))