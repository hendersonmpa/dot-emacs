;;; racket-mpah.el --- Emacs as a racket IDE 
;;; Code:

;; (require 'geiser-install)
;; (setq geiser-active-implementations '(racket))

(add-to-list 'auto-mode-alist '("\\.rkt" . racket-mode))
(add-hook 'racket-mode-hook     #'enable-paredit-mode)
(add-hook 'racket-mode-hook     #'racket-eldoc-function)

;; paredit config for racket mode
;; (use-package paredit
;;   :ensure t
;;   :config
;;   (dolist (m '(emacs-lisp-mode-hook
;; 	       racket-mode-hook
;; 	       racket-repl-mode-hook))
;;     (add-hook m #'paredit-mode))
;;   (bind-keys :map paredit-mode-map
;; 	     ("{"   . paredit-open-curly)
;; 	     ("}"   . paredit-close-curly))
;;   (unless terminal-frame
;;     (bind-keys :map paredit-mode-map
;; 	       ("M-[" . paredit-wrap-square)
;; 	       ("M-{" . paredit-wrap-curly))))

(provide 'racket-mpah)
;;; racket-mpah.el ends here
