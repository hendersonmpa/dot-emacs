;;; utilites-mpah.el --- utilty functions
;;; Code:


(defun unfill-region ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-region (region-beginning) (region-end) nil)))


(defcustom network "/run/user/1001/gvfs"  "location of mounted network drives")
(defun visit-network ()
  (interactive)
  (find-file network))

;;(defvar hex nil "IP address of hex")
;; see http://ergoemacs.org/emacs/elisp_defvar_problem.html for why I did this.
;(defcustom hex "//10.40.61.54"  "IP address of hex")
;; (defcustom hex "y:/"  "location of hex")
;; (add-untranslated-filesystem hex)
;; (defun visit-hex ()
;;   (interactive)
;;   (find-file hex))

;; (defcustom nso "y:/NSO/"  "location of NSO")
;; (add-untranslated-filesystem nso)
;; (defun visit-nso ()
;;   (interactive)
;;   (find-file nso))

;; (defcustom documents "y:/Documents/"  "location of Documents")
;; (add-untranslated-filesystem documents)
;; (defun visit-documents ()
;;   (interactive)
;;   (find-file documents))

;; (defcustom reporting "j:/reporting/"  "location of of reporting")
;; (defun visit-reporting ()
;;   (interactive)
;;   (find-file reporting))


(provide 'utilities-mpah)

;;; utilities-mpah.el ends here
