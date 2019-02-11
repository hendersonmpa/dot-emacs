;;; notmuch-mpah.el --- Notmuch config
;;; Code:

(autoload 'notmuch "notmuch" "notmuch mail" t)

(require 'notmuch) ; loads notmuch package
(autoload 'mailto-compose-mail "mailto-compose-mail" nil t)

;;;; Custom settings for notmuch and mail handling
;; this configured both notmuch and message-mode

;; mail sending
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "/usr/bin/msmtp")
(setq mail-specify-envelope-from 't)
(setq message-sendmail-envelope-from 'header)
(setq mail-envelope-from 'header)
(setq message-kill-buffer-on-exit 't)
;; (setq mail-host-address "webframp.com")
(setq message-default-mail-headers "Cc: \nBcc: \n")
(setq notmuch-fcc-dirs "CHEO/Sent") ; stores sent mail to the specified directory
(setq message-directory "CHEO/Drafts") ; stores postponed messages to the specified directory


(provide 'notmuch-mpah)
;;; notmuch-mpah.el ends here
