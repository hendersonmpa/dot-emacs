;;; org-mpah.el --- Org optimizations and tweaks.
;;; Code:

;; start up view folded
(setq org-startup-folded t)
;; from http://www.clarkdonley.com/blog/2014-10-26-org-mode-and-writing-papers-some-tips.html
;; 1. hook flyspell into org-mode
(require 'org)
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


;; Stored searches
;; http://orgmode.org/manual/Storing-searches.html#Storing-searches
 (setq org-agenda-custom-commands
           '(("x" agenda)
             ("y" agenda*)
             ("w" todo "WAITING")
	     ("W" todo-tree "WAITING")
	     ("d" todo "DONE")
	     ("D" todo-tree "DONE")
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

;;; Export settings
;; Export to .doc
(setq org-odt-preferred-output-format "doc")


;; Export bold text as bold not alert
;; (defun my-beamer-bold (contents backend info)
;;   (when (eq backend 'beamer)
;;     (replace-regexp-in-string "\\`\\\\[A-Za-z0-9]+" "\\\\textbf" contents)))

;; (add-to-list 'org-export-filter-bold-functions 'my-beamer-bold)

;;; org Export
;; koma-article
(with-eval-after-load "ox-latex"
  (add-to-list 'org-latex-classes
               '("koma-article" "\\documentclass[12pt]{scrartcl}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(with-eval-after-load "ox-latex"
  (add-to-list 'org-latex-classes
             '("els-article" "\\documentclass[review]{elsarticle}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(with-eval-after-load "ox-latex"
  (add-to-list 'org-latex-classes
               '("koma-article-11" "\\documentclass[11.5pt]{scrartcl}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))


;; Org citations
(require 'oc-basic)
(require 'oc-csl)
(setq org-cite-csl-styles-dir "~/Documents/manuscripts/csl")


;;with ebib
;; (setq ebib-citation-commands
;;       (quote ((any (("cite" "\\cite{%K}")))
;;               (org-mode (("cite" " cite:%K"))))))

;;; A more complicated version
;; (setq ebib-citation-commands
;;       (quote ((any (("cite" "\\cite%<[%A]%>{%K}")))
;;               (org-mode (("cite" "[[cite:%K][%A;%A;%A]]"))))))


;; (org-add-link-type
;;  "cite" 'ebib
;;  (lambda (path desc format)
;;    (cond
;;      ((eq format 'html)
;;       (format "(<cite>%s</cite>)" path))
;;      ((eq format 'latex)
;;       (if (or (not desc) (equal 0 (search "cite:" desc)))
;;           (format "\\cite{%s}" path)
;;           (format "\\cite[%s][%s]{%s}"
;;                   (cadr (split-string desc ";"))
;;                   (car (split-string desc ";"))  path))))))

;; (org-add-link-type "ebib" 'ebib)

;;; Org Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell . t)
   (R . t)
   (lisp . t)
   (gnuplot . t)
   (python . t)
   (clojure . t)
   (dot . t)
   (ditaa . t)))

(add-to-list 'org-src-lang-modes
             '("r" . ess-mode))

;; This happened to be the directory it gets installed with Fedora
(setq org-ditaa-jar-path "/usr/bin/ditaa")

(setq org-confirm-babel-evaluate nil)
;; Code highlighting
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
;; Export code highlighting
(setq org-latex-listings 'minted)

(setq org-latex-minted-options
      '(("frame" "lines")
        ("fontsize" "\\scriptsize") ;; \\scriptsize
        ("linenos" "false")
	("showspaces" "false")))

(setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "biber %b"
	"biber %b"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(provide 'org-mpah)
;;; org-mpah.el ends here
