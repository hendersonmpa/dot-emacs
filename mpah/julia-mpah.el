;;; based on  https://hershsingh.net/blog/emacs-julia/#introduction
;;;; Julia REPL

;; (add-to-list 'load-path "c:/Users/mhenderson/AppData/Local/Programs/Julia-1.6.4/bin/")

(require 'julia-mode)
;; ;; (use-package vterm
;; ;;      :ensure t)

;; ;; (use-package julia-mode
;; ;;      :ensure t)

;; ;; (use-package julia-repl
;; ;;      :ensure t
;; ;;      :hook (julia-mode . julia-repl-mode)
;; ;;      :init (setenv "JULIA_NUM_THREADS" "8")

;; ;;   :config
;; ;;   ;; Set the terminal backend
;; ;;      (julia-repl-set-terminal-backend 'vterm)

;; ;;   ;; Keybindings for quickly sending code to the REPL
;; ;;   ;;;; (define-key julia-repl-mode-map (kbd "<C-RET>") 'my/julia-repl-send-cell)
;; ;;      (define-key julia-repl-mode-map (kbd "<M-RET>") 'julia-repl-send-line)
;; ;;      (define-key julia-repl-mode-map (kbd "<S-return>") 'julia-repl-send-buffer))

(require 'julia-repl)
(add-hook 'julia-mode-hook "julia-repl-mode") ;; always use minor mode

;; (setq julia-repl-executable-records
;;       '((default "julia")                  ; in the executable path
;;         (master "~/src/julia-git/julia"))) ; compiled from the repository

;; ;; ;;;lsp-mode

;; ;; (quelpa '(lsp-julia :fetcher github
;; ;;                     :repo "non-Jedi/lsp-julia"
;; ;;                     :files (:defaults "languageserver")))

;; ;; (use-package lsp-julia
;; ;;   :config
;; ;;   (setq lsp-julia-default-environment "~/.julia/environments/v1.6"))

;; ;; (add-hook 'julia-mode-hook #'lsp-mode)

(provide 'julia-mpah)

;;; julia-mpah.el ends here
