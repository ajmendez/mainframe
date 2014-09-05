;; DESCRIPTION:  Mendez's Settings
;; [2010-06-29] Mendez

;; Make it transparent: --------------------------------------------------------
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))


(add-to-list 'load-path "~/.emacs.d/vendor/color-theme")
(require 'color-theme)
(color-theme-initialize)
(if (not window-system)
    (progn
      (color-theme-tty-dark) )
  (progn
    (load "~/.emacs.d/topfunky/theme.el")
    (color-theme-topfunky)))

;; Emacs Server for speedyness: ------------------------------------------------
;; set up server to start each new client on its own frame
;;   This did not work as planed
;; (add-hook 'server-visit-hook 'make-frame)
;; switch the parent frame back to its own buffer
;; (add-hook 'server-switch-hook
;;           '(lambda ()
;;              (server-switch-buffer (other-buffer))))

;; (server-start)
;; (setq frame-title-format "%b")		; use buffer name for title
;; (setq display-buffer-reuse-frames t)    ; no new frame if already open


;; Raise the window
(defun ns-raise-emacs ()
  (ns-do-applescript "tell application \"Emacs\" to activate"))
;;
(defun call-raise-frame ()
   (raise-frame))
(defun end-server-edit ()
   (shell-command "osascript -e \"tell application \\\"System Events\\\" to keystroke tab using command down\""))
;;
(add-hook 'server-visit-hook 'call-raise-frame)
(add-hook 'server-done-hook 'end-server-edit)
;;
;; (if (file-exists-p
;;  (concat (getenv "TMPDIR") "emacs"
;;          (number-to-string
;;           (user-real-uid)) "/server"))
;; nil (server-start))


;; Load some paths: ------------------------------------------------------------
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
        (let* ((my-lisp-dir (expand-file-name "~/Dropbox/etc/emacs/site-lisp"))
              (default-directory my-lisp-dir))
           (setq load-path (cons my-lisp-dir load-path))
           (normal-top-level-add-subdirs-to-load-path)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Clean up the workspace a bit
(autoload 'hide-mode-line "hide-mode-line" nil t)
; (tool-bar-mode -1)   ; Gget rid of icons
; (menu-bar-mode -1)   ; Get rid of menubar
(setq visible-bell 'top-bottom)
(fset 'yes-or-no-p 'y-or-n-p)


(if (not window-system)
    (progn
      (menu-bar-mode -1) )
  (progn
    (tool-bar-mode -1)
    (menu-bar-mode -1) ) )




;; (pc-selection-mode 1)
;; (setq mac-option-modifier 'meta)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; default to text-mode,  this may change to org-mode
(setq initial-major-mode 'text-mode)
(setq initial-scratch-message "")
(setq inhibit-startup-message   t)   ; Don't want any startup message 

;(set-face-font 'default "-apple-inconsolata-medium-r-normal--46-0-72-72-m-0-iso10646-1")
;; (set-face-font 'default "-apple-inconsolata-medium-r-normal--34-0-72-72-m-0-iso10646-1")
;; (set-face-font 'default "-apple-helvetica-medium-r-normal--32-0-72-72-m-0-iso10646-1")
;; (set-face-font 'default "-*-Courier New-normal-r-*-*-13-*-*-*-c-*-iso8859-1")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Backup/tmp files under /tmp
;; (setq backup-directory-alist `(("." . (convert-standard-filename
;;                                        "~/.saves"))))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)
;; (setq make-backup-files nil)
;; (setq auto-save-file-name-transforms
;;           `((".*" ,"~/.autosaves" t)))




(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(fset 'yes-or-no-p 'y-or-n-p)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Insertion of Dates, bind to C-c i
(defun insert-date-string ()
  "Insert a nicely formated date string."
  (interactive)
  (insert (format-time-string "[%Y.%m.%d]")))
(global-set-key (kbd "\C-c\i") 'insert-date-string)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Line Numbers
(require 'linum)
(require 'linum-face-settings)
(require 'linum+)
(global-linum-mode 1)
(line-number-mode 1)

(column-number-mode 1)
(require 'column-marker)
;; (column-marker-2 80)
(add-hook 'idlwave-mode-hook (lambda () (interactive) (column-marker-3 80)))
(require 'linum-off)


;;(setq debug-on-error t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IDLWAVE setup
;; (setq load-path (cons "~/etc/emacs/site-lisp/idlwave" load-path))

(global-font-lock-mode 1)
(autoload 'idlwave-mode "idlwave" "IDLWAVE Mode" t)
(autoload 'idlwave-shell "idlw-shell" "IDLWAVE Shell" t)
(setq auto-mode-alist (cons '("\\.pro\\'" . idlwave-mode) auto-mode-alist))
(setq idlwave-shell-command-line-options '"-quiet")

;; ;Basic Settings
(setq idlwave-reserved-word-upcase t)
(setq idlwave-main-block-indent 2)
(setq idlwave-block-indent 2)
(setq idlwave-end-offset -2)

; (setq idlwave-user-catalog-file "~/.idlwave/idlusercat.el")
(setq idlwave-special-lib-alist '(("~/idl/" . "libraries")
          ("~/research/idl" . "research")) )
(setq idlwave-library-path '("+~/idl/" "+~/research/idl/"))
(setq idlwave-use-library-catalogs t)
;; (setq idlwave-shell-use-dedicated-frame t)
;; (setq idlwave-shell-activate-alt-keybindings t)
(setq idlwave-expand-generic-end t)
(setq idlwave-store-inquired-class t)
(setq idlwave-shell-automatic-start t)
(setq idlwave-max-extra-continuation-indent 20)
;; (setq idlwave-begin-line-comment "^;[^;]") ; Leave ";" but not ";;"
(setq idlwave-surround-by-blank t) ; Turn on padding ops =,<,>
(setq idlwave-pad-keyword nil) ; Remove spaces for keyword '='
(setq idlwave-reserved-word-upcase t) ; Make reserved words upper case
;; (setq idlwave-system-directory "`~/idl`")

(add-hook 'idlwave-shell-mode-hook
			(lambda ()
			      (line-number-mode 1)
			      (linum-mode 1)
            (require 'idlw-complete-structtag)
            (hide-mode-line)))

(add-hook 'idlwave-mode-hook
          (lambda ()
            (line-number-mode nil)
            (require 'idlw-complete-structtag)
            (set (make-local-variable 'minor-mode-alist)
                 (copy-sequence minor-mode-alist))
            (delq (assq 'auto-fill-function minor-mode-alist) minor-mode-alist)
            (delq (assq 'abbrev-mode minor-mode-alist) minor-mode-alist)
            ))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Python
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;;; Electric Pairs
;; (add-hook 'python-mode-hook
;;      (lambda ()
;;       (define-key python-mode-map "\"" 'electric-pair)
;;       (define-key python-mode-map "\'" 'electric-pair)
;;       (define-key python-mode-map "(" 'electric-pair)
;;       (define-key python-mode-map "[" 'electric-pair)
;;       (define-key python-mode-map "{" 'electric-pair)))
;; (defun electric-pair ()
;;   "Insert character pair without sournding spaces"
;;   (interactive)
;;   (let (parens-require-spaces)
;;     (insert-pair)))

;; ;;; bind RET to py-newline-and-indent
;; (add-hook 'python-mode-hook '(lambda () 
;;                                (define-key python-mode-map "\C-m" 'newline-and-indent)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Highlighting
(setq search-highlight           t) ; Highlight search object 
(setq query-replace-highlight    t) ; Highlight query object 
;(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening 
(global-set-key "\C-l" 'goto-line) ; [Ctrl]-[L]




;; (define-minor-mode electric-brackets-mode
;;   "toggles electric-brackets-mode.  This mode allows auto pairing
;;   of (),[],\{\}, ... etc.  This is based on code lifted from Carl
;;   Mueller's custom-latex.el"
;;   :keymap
;;   '(("[" . (lambda () (interactive) (double-insert "[" "]")))
;;     ("(" . (lambda () (interactive) (double-insert "(" ")")))
;;     ("{" . (lambda () (interactive) (double-slash "{" "}")))
;;     ("\"". (lambda () (interactive) (double-slash "\"" "\"")))
;;     ("\'". (lambda () (interactive) (double-slash "\'" "\'")))
;;     ("|" . (lambda () (interactive) (double-slash "|" "|"))))
  
;;   (defun double-insert (left right)
;;     (interactive)
;;     (if (equal (char-to-string (char-before)) left)
;;         (delete-backward-char -1)
;;       (insert (concat left right))
;;       (backward-char)))
  
;;   (defun double-slash (left right)
;;     "Inserts {} or whatever"
;;     (interactive)
;;     (let (previous)
;;       (setq previous (char-to-string (preceding-char)))
;;       (if (equal previous left)
;;           (delete-backward-char -1)
;;         (if (not (equal (char-to-string (preceding-char)) "\\"))
;;             (insert (concat left right))
;;           (insert (concat left "\\" right))
;;           (backward-char))
;;         (backward-char)))))


