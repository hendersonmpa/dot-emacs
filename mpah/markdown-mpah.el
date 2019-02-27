;;; markdown-mpah.el --- Markdown config
;;; Code:
;;http://joostkremers.github.io/pandoc-mode/
(add-hook 'markdown-mode-hook 'pandoc-mode)
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

(provide 'markdown-mpah)
;;; markdown-mpah.el ends here
