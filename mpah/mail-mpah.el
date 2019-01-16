;; Configurations for mutt in emacs
;; ;; Make all files that start with mutt open in mail-mode

(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
;; use org structures and tables in message mode
(add-hook 'mail-mode-hook 'turn-on-orgtbl)
(add-hook 'mail-mode-hook 'turn-on-orgstruct++)
;;(add-hook 'mail-mode-hook 'turn-on-orgstruct)
;;(add-hook 'mail-mode-hook 'auto-fill-mode)
;; (defun set-mail-theme ()
;;    (load-theme 'wheatgrass))
;; (add-hook 'mail-mode-hook 'set-mail-theme)

(setq whitespace-global-modes (not 'mail-mode))

;; Change the fill column to 120
(add-hook 'mail-mode-hook
          (lambda ()
            (set-fill-column 120)))

;; Compose format-flowed email
(add-hook 'mail-mode-hook  (lambda () (use-hard-newlines nil t)))
;;(add-hook 'mail-mode-hook #'messages-are-flowing-use-and-mark-hard-newlines)


(add-hook
 'mail-mode-hook
 (lambda ()
   (define-key mail-mode-map (kbd "C-c C-c")
     (lambda ()
       (interactive)
       (save-buffer)
       (server-edit)))))

;;colorizing multiply-quoted lines
(add-hook 'mail-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("^[ \t]*>[ \t]*>[ \t]*>.*$"
                                       (0 'mail-multiply-quoted-text-face))
                                      ("^[ \t]*>[ \t]*>.*$"
                                       (0 'mail-double-quoted-text-face))))))


(provide 'mail-mpah)
;;; mail-mpah.el ends here
