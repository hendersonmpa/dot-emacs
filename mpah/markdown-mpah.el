;;; markdown-mpah.el --- Markdown config
;;; Code:
;;http://joostkremers.github.io/pandoc-mode/
(add-hook 'markdown-mode-hook 'pandoc-mode)
(add-hook 'markdown-mode-hook 'turn-on-flyspell)
(add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)

;;(setq pandoc-binary "/usr/local/bin/pandoc")

;;; Markdown mode
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
;;(setq auto-mode-alist (cons '("\\.ronn?" . markdown-mode) auto-mode-alist))

(require 'poly-R)
(require 'poly-markdown)
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

;;;Insert new chunk for Rmarkdown
;; (defun tws-insert-r-chunk (header) 
;;   "Insert an r-chunk in markdown mode. Necessary due to interactions between polymode and yas snippet" 
;;   (interactive "sHeader: ") 
;;   (insert (concat "```{r " header "}\n\n```")) 
;;   (forward-line -1))

;; (global-set-key (kbd "C-c C-i") 'tws-insert-r-chunk)


(provide 'markdown-mpah)
;;; markdown-mpah.el ends here
