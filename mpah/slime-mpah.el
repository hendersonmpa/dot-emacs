;;; slime-mpah.el --- Slime configuration
;;; Code:
;; (load (expand-file-name "~/quicklisp/slime-helper.el"))

(setq slime-lisp-implementations
      '((sbcl ;;("sbcl" "--noinform --no-linedit")
         ("sbcl" "--dynamic-space-size" "7000" "--noinform --no-linedit")
         :coding-system utf-8-unix)))

(setq inferior-lisp-program "/usr/local/bin/sbcl" ; can be switched to roswell above
      slime-contribs '(slime-fancy)
      lisp-indent-function 'common-lisp-indent-function ;as opposed to elisp indentation
      slime-compile-symbol-function 'slime-fuzzy-complete-symbol ;other options - see documentation
      common-lisp-hyperspec-root "file:///home/mpah/lisp/docs/HyperSpec/"
      slime-startup-animation t)
;;; Path to textinfo files
(add-to-list 'Info-default-directory-list "~/lisp/docs/info/")


(defun mpah-start-slime ()
  (unless (slime-connected-p)
    (save-excursion (slime))))

(add-hook 'slime-mode-hook 'mpah-start-slime)

;; Prevent total emacs freeze with: Error in post-command-hook (autopair-global-mode-check-buffers): (wrong-type-argument characterp nil)
;; disables autopair.el in the sbcl-mode buffer, where it was useless anyway
(add-hook 'slbd-mode-hook
          #'(lambda ()
              ;; (setq autopair-dont-activate t) ;; for emacsen < 24
              (autopair-mode -1)))

;; recognize .lsp files extensions as lisp:
(add-to-list 'auto-mode-alist '("\\.lsp" . lisp-mode))
;; the SBCL configuration file is in Common Lisp
(add-to-list 'auto-mode-alist '("\\.sbclrc\\'" . lisp-mode))
;; Open files with .cl extension in lisp-mode
(add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))

;; Load Paredit when working with lisp files
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
;;(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))


;; taken from prelude-common-lisp
(eval-after-load "slime"
  '(progn
     (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol
           slime-fuzzy-completion-in-place t
           slime-enable-evaluate-in-emacs t
           slime-autodoc-use-multiline-p t
           slime-auto-start 'always)
    (define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
    (define-key slime-mode-map (kbd "C-c C-s") 'slime-selector)))

;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
      (read-kbd-macro paredit-backward-delete-key) nil))

(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

;; Configure slime-tramp
;;(require 'slime-tramp)
;; (add-to-list 'slime-filename-translations
;;              (slime-create-filename-translator
;;               :machine-instance "melvin"
;;               :remote-host "melvin"
;;               :username "mpah"))

;;; Log4Slime
;; (load "~/quicklisp/log4slime-setup.el")
;; (global-log4slime-mode 1)

(provide 'slime-mpah)
;;; slime-mpah.el ends here
