;;; org-mpah.el --- Org optimizations and tweaks.
;;; Code:

;; from http://www.clarkdonley.com/blog/2014-10-26-org-mode-and-writing-papers-some-tips.html
;; 1. hook flyspell into org-mode
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-buffer)

;; 2. ignore message flags
(setq flyspell-issue-message-flag nil)

;; 3. ignore tex commands
(add-hook 'org-mode-hook (lambda () (setq ispell-parser 'tex)))
(defun flyspell-ignore-tex ()
  (interactive)
  (set (make-variable-buffer-local 'ispell-parser) 'tex))
(add-hook 'org-mode-hook 'flyspell-ignore-tex)

;; Add org-agenda file
(setq org-agenda-files '("~/Dropbox/Org/tasks.org"))

;; Add languages to org-babel
;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (gnuplot . t)
   (lisp . t)
   (sh . t)))

;; alway evaluate source blocks
(setq org-confirm-babel-evaluate nil)

;; fontify code in code blocks
(setq org-src-fontify-natively t)

(add-to-list 'org-src-lang-modes '("<LANGUAGE>" . "<MAJOR-MODE>"))
;; Stored searches
;; http://orgmode.org/manual/Storing-searches.html#Storing-searches
 (setq org-agenda-custom-commands
           '(("x" agenda)
             ("y" agenda*)
             ("w" todo "WAITING")
	     ("W" todo-tree "WAITING")
	     ("d" todo "WAITING")
	     ("D" todo "WAITING")
             ("u" tags "+urgent")
             ("v" tags-todo "+urgent")
             ("U" tags-tree "+urgent")
             ("f" occur-tree "\\<FIXME\\>")
             ("h" . "HOME+Name tags searches") ; description for "h" prefix
             ("hl" tags "+home+Lisa")
             ("hp" tags "+home+Peter")
             ("hk" tags "+home+Kim")))

;;; Appearance
;; Remove the markup characters, i.e "/text/" becomes (italized) "text"
;;(setq org-hide-emphasis-markers t)
(setq org-hide-emphasis-markers nil)

;; Set-up org-capture
(setq org-default-notes-file "~/Dropbox/Org/tasks.org")
(setq org-capture-templates
      '(("T" "Todo" entry (file+headline "~/Dropbox/Org/tasks.org" "Tasks")
         "* TODO %?\n %t")
        ("n" "Note" entry (file+headline "~/Dropbox/Org/tasks.org" "Notes")
         "** %?\n %t")))


;; koma-article
(with-eval-after-load "ox-latex"
  (add-to-list 'org-latex-classes
               '("koma-article" "\\documentclass{scrartcl}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))


(provide 'org-mpah)
;;; org-mpah.el ends here
