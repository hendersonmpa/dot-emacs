;;; packages-mpah.el --- Package archives and my list of packages to install
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
    auctex                              ;latex
    beacon				;point emphasis
    browse-kill-ring                    ;browse the kill ring
    cider 				;clojure major-mode
    company				;in-buffer autocompletion
    crux                                ;useful extensions
    ebib                                ;emacs bibliography for latex and org files
    ein                                 ;emacs ipython notebook
    elpy                                ;python development
    ess					;R major-mode
    flx-ido				;fuzzy matching in ido
    flycheck                            ;used with elpy
    geiser 				;scheme - racket
    gnuplot-mode                        ;gnuplot major mode
    gnuplot                             ;drive gnuplot from within emacs
    ;;    helm				;mini-buffer autocompletion
    htmlize                             ;htmlize buffer - use to create orgmode html output
    ibuffer
    ido-completing-read+ 			;ido completion everywhere
;;    ido-ubiquitous  obsolete merged with above
    magit
    markdown-mode                       ;markdown
    notmuch                             ;search notmuch email index
    pandoc-mode
    paredit 				;structured editing
    polymode                            ;Extensible framework for multiple major modes
    poly-R                              ;Various polymodes for R language
    poly-markdown                       ;Various polymodes for markdown
    py-autopep8                         ;used with elpy
    racket-mode 
    rainbow-delimiters
    recentf 				;view recently opened files
    solarized-theme
    smartparens
    smart-mode-line			;better mode-line
    smex 				;enhanced M-x built on ido
    rainbow-mode                        ;colour, colour names
    flycheck				;code checking
    use-package                         ;package configuration
    which-key
    zenburn-theme)
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
