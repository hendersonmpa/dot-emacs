;;; racket-mpah.el --- Emacs as a racket IDE 
;;; Code:

;; (require 'geiser-install)
;; (setq geiser-active-implementations '(racket))

(add-to-list 'auto-mode-alist '("\\.rkt" . racket-mode))
(add-hook 'racket-mode-hook     #'enable-paredit-mode)


(provide 'racket-mpah)
;;; racket-mpah.el ends here
