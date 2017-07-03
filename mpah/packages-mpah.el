;;; ui-mpah.el --- Emacs UI optimizations and tweaks.
;;; Code:

(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ;;("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")))

;; Use the stable version of cider
(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(geiser . "melpa-stable") t)
;;;(package-initialize) initialized in .emacs

(defvar mpah-packages
  '(ahk-mode				;autohotkey major mode
    gnuplot-mode                        ;gnuplot major mode
    beacon				;point emphasis
    cider 				;clojure major-mode
    company				;in-buffer autocompletion
    ess					;R major-mode
    flx-ido				;fuzzy matching in ido
    geiser 				;scheme - racket
;;    helm				;mini-buffer autocompletion
    ibuffer
    ido-ubiquitous			;ido completion everywhere
    magit
    paredit 				;structured editing 
    rainbow-delimiters
    recentf 				;view recently opened files
    solarized-theme
    smartparens
    smart-mode-line			;better mode-line
    smex 				;enhanced M-x built on ido
    flycheck				;code checking
    which-key)
  "A list of packages to ensure are installed at launch.")

(defun mpah-packages-installed-p ()
  "Check if all packages in `mpah-packages' are installed."
  (every #'package-installed-p mpah-packages))

(defun mpah-require-package (package)
  "Install PACKAGE unless already installed"
  (unless (memq package mpah-packages)
    (add-to-list 'mpah-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun mpah-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'mpah-require-package packages))

(defun mpah-install-packages ()
  "Install all packages listed in `mpah-packages'."
  (unless (mpah-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs is now refreshing your package database...")
    (package-refresh-contents)
    (message "%s" "done.")
    ;; install the missing packages
    (mpah-require-packages mpah-packages)))

;; run package installation
(mpah-install-packages)

(provide 'packages-mpah)

;;; packages-mpah.el ends here
