;;; latex-mpah.el --- Latex config
;;; Code:

;; ebib configuration
(require 'ebib)
(add-hook 'LaTeX-mode-hook #'(lambda ()
                               (local-set-key "\C-cb" 'ebib-insert-bibtex-key)))


;; Set the TEX enging to 'xetex and default to PDF output
;;set XeTeX mode in TeX/LaTeX
(add-hook 'LaTeX-mode-hook (lambda()
                             (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --shell-escape%(mode)%' %t" TeX-run-TeX nil t))
                             (setq TeX-command-default "XeLaTeX")
                             (setq TeX-save-query nil)
                             (setq TeX-show-compilation t)))
;; (setq TeX-engine 'xetex)
;; (setq TeX-PDF-mode t)

(provide 'latex-mpah)
;;; latex-mpah.el ends here
