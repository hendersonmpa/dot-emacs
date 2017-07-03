;;; startup-mpah.el --- Emacs Start Up
;;; Code:

;; Add texlive to the path
;;(setenv "PATH" (concat (getenv "PATH") "c:\texlive\2016\bin\win32"))
;;(add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
(setq ispell-program-name "aspell")
(setq ispell-personal-dictionary "~/.ispell")
(require 'ispell)

(provide 'startup-mpah)

;;; startup-mpah.el ends here
