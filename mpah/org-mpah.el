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

;; keybindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Add org-agenda file
(setq org-agenda-files '("~/Dropbox/Org/tasks.org"))


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

(provide 'org-mpah)
;;; org-mpah.el ends here
