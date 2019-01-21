;;; init.el --- Emacs configuration file
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


(defvar mpah-dir "~/.emacs.d/mpah/"
  "The root dir of the emacs config files.")

(defvar mpah-savefile-dir "~/.emacs.d/savefile"
  "This folder stores all the automatically generated save/history-files.")

(add-to-list 'load-path mpah-dir)

;; Always load newest byte code
(setq load-prefer-newer t)

(setq custom-file (concat
		   (file-name-as-directory mpah-dir)
		   "custom-mpah.el"))
(load custom-file)

;; (defvar mpah-dir (file-name-directory load-file-name)

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

(require 'cl)
(require 'packages-mpah)
(require 'startup-mpah)
(require 'ui-mpah)
(require 'ibuffer-mpah)
(require 'org-mpah)
(require 'slime-mpah)
(require 'editor-mpah)
(require 'global-keybindings-mpah)
(require 'python-mpah)
(require 'mail-mpah)
;;(require 'helm-mpah)

