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

;; Backup file settings
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(require 'cl)
(require 'packages-mpah)
(require 'startup-mpah)
(require 'utilities-mpah)
(require 'ui-mpah)
(require 'ibuffer-mpah)
(require 'org-mpah)
(require 'slime-mpah)
(require 'editor-mpah)
;(require 'keybindings-mpah)
(require 'global-keybindings-mpah)
(require 'python-mpah)
(require 'mail-mpah)
(require 'ess-mpah)
(require 'racket-mpah)
(require 'latex-mpah)
(require 'notmuch-mpah)
(require 'markdown-mpah)
(require 'julia-mpah)
;;(require 'helm-mpah)

(put 'downcase-region 'disabled nil)
