;;; startup-mpah.el --- Emacs Start Up
;;; Code:

;; Start emacs server
;; I am now using $ emacs --daemon  to start a server after reboot
;;(server-start)


;; Add texlive to the path
;;(setenv "PATH" (concat (getenv "PATH") "c:\texlive\2016\bin\win32"))
;;(add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
(setq ispell-program-name "aspell")
(setq ispell-personal-dictionary "~/.ispell")
(require 'ispell)

;; reload updated files
(global-auto-revert-mode t)

;; Backup file settings

(setq backup-by-copying t  ;don't clobber symlinks
      backup-directory-alist
      '(("." . "~/.saves/")) ;; don't litter my fs tree
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t) ;; use version control


(provide 'startup-mpah)
;;; startup-mpah.el ends here
