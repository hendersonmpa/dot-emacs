;;; slime-mpah.el --- Slime configuration
;;; Code:

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl"
      lisp-indent-function 'common-lisp-indent-function ;as opposed to elisp indentation
      slime-compile-symbol-function 'slime-fuzzy-complete-symbol ;other options - see documentation
      common-lisp-hyperspec-root "~/lisp/docs/HyperSpec/"
      slime-startup-animation t)

      ;; "c:/Program Files/Steel Bank Common Lisp/1.3.11/sbcl.exe"
(provide 'slime-mpah)
;;; slime-mpah.el ends here
