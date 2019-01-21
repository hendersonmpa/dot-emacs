;;; global-keybindings-mpah.el --- Emacs keybindings
;;; Code:

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Window switching. (C-x o goes to the next window)
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1))) ;; back one

;; swap windows
(global-set-key (kbd "C-c s") 'mpah-swap-windows)

;; from prelude
(define-key 'help-command (kbd "C-f") 'find-function)
(define-key 'help-command (kbd "C-k") 'find-function-on-key)
(define-key 'help-command (kbd "C-v") 'find-variable)
(define-key 'help-command (kbd "C-l") 'find-library)
(define-key 'help-command (kbd "C-i") 'info-display-manual)


;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Start ielm for interactively evaluating Emacs Lisp expressions.
(global-set-key (kbd "C-x i") 'ielm)

;; Start a regular shell if you prefer that.
(global-set-key (kbd "C-x M-m") 'shell)

;; map M-y to browse-kill-ring
(browse-kill-ring-default-keybindings)

;; use hippie-expand instead of dabbrev
(global-set-key (kbd "M-/") 'hippie-expand)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; (unless (fboundp 'toggle-frame-fullscreen)
;;   (global-set-key (kbd "<f11>") 'prelude-fullscreen))

;; toggle menu-bar visibility
(if window-system
    (progn
      (global-set-key (kbd "<f12>") 'toggle-dark-light-theme)
      (load-theme 'solarized-dark)
      ;;(set-face-font 'default "Liberation Mono-12")
      ))

;;(global-set-key (kbd "<f12>") 'menu-bar-mode)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key (kbd "M-x") 'smex)
;; If you want to be able to M-x without meta
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; org-mode keybindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


(provide 'global-keybindings-mpah)
;;; global-keybindings-mpah.el ends here
