;;; startup-mpah.el --- Emacs Start Up
;;; Code:

;; Start emacs server
(server-start)

;; Add texlive to the path
;;(setenv "PATH" (concat (getenv "PATH") "c:\texlive\2016\bin\win32"))
;;(add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
(setq ispell-program-name "aspell")
(setq ispell-personal-dictionary "~/.ispell")
(require 'ispell)

;; use eww as the default browser
(setq browse-url-browser-function 'eww-browse-url)

;; reload updated files
(global-auto-revert-mode t)

(provide 'startup-mpah)
;;; startup-mpah.el ends here
