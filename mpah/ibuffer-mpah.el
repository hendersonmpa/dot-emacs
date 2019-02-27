;;; ibuffer-mpah.el --- Emacs ibuffer optimizations and tweaks.
;;; Code:

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)


(setq ibuffer-saved-filter-groups
      '(("home"
	 ("Dired" (mode . dired-mode ))
	 ("Prompts" (or (name . "^\\*R\\*$")
			(name . "^\\*R.+\\*$")
			(mode . inferior-ess-mode)
			(name . "^\\*SQL\\*$")
			(name . "^\\*Python\\*$")
			(name . "^\\*slime-repl clisp*\\*$")
			(name . "^\\*slime-repl sbcl<.+>*\\*$")
			(name . "^\\*slime-repl sbcl*\\*$")
			(name . "^\\*cider-repl .+\\*$")
			(name . "^\\* Racket REPL *\\*$")
			(name . "^\\*Racket REPL\\*$")
			(name . "^\\*shell\\*$")))
	 ("Org" (or (mode . org-mode)
		    (filename . "OrgMode")))
	 ("Markdown" (mode . markdown-mode))
	 ("LaTeX" (mode . latex-mode))
	 ("emacs-config" (or (filename . ".emacs.d")
			     (filename . "emacs-config")))
	 ("Lisp" (or (mode . lisp-mode)
		     (mode . clojure-mode)
		     (mode . emacs-lisp-mode)
		     (mode . scheme-mode)
		     (mode . racket-mode)))
	 ("ESS" (or (mode . ess-r-mode)))
	 ("Python" (mode . python-mode))
	 ("Shell" (mode . sh-mode))
	 ("Gnuplot" (mode . gnuplot-mode))
	 ("ahk" (mode . ahk-mode))
	 ("Web Dev" (or (mode . html-mode)
			(mode . css-mode)
			(mode . js-mode)))
	 ("Magit" (name . "\*magit"))
	 ;; ("Octave" (mode . octave-mode))
	 ("SQL" (mode . sql-mode))
	 ("Help" (or (name . "\*Help\*")
		     (name . "\*Apropos\*")
		     (name . "\*info\*"))))))

(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-expert t)

(add-hook 'ibuffer-mode-hook
	  '(lambda ()
             (ibuffer-auto-mode 1)
             (ibuffer-switch-to-saved-filter-groups "home")))





(provide 'ibuffer-mpah)

;;; ibuffer-mpah.el ends here
