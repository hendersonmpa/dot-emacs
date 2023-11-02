;;; ess-mpah.el --- ESS customization
;;; Code:

(require 'ess-r-mode)

;;smart-underscore and ess-smart-S-assign-key have been removed. Users who liked the previous behavior (i.e. underscore inserting “<-”) should bind ess-insert-assign to the underscore in their Emacs initialization file. For example to activate it in all ESS R buffers. 
(define-key ess-r-mode-map "_" #'ess-insert-assign)
(define-key inferior-ess-r-mode-map "_" #'ess-insert-assign) 

;;(add-hook 'R-mode-hook 'paredit-everywhere-mode)
;;(add-hook 'ess-mode-hook 'paredit-everywhere-mode)

(provide 'ess-mpah)
;;; ess-mpah.el ends here
