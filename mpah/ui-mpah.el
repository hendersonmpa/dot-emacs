;;; ui-mpah.el --- Emacs UI optimizations and tweaks.
;;; Code:

;; Remove toolbar, scrollbar, menubar, blinking cursor and bell ring
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)
;; disable the bell ring
(setq ring-bell-function 'ignore)

;; disable startup screen
(setq inhibit-startup-screen t)
(setq initial-buffer-choice "~/Dropbox/Org/tasks.org")
;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(set-frame-font "DejaVu Sans Mono-12" nil t)
;(set-default-font "Monospace-12" nil t)
;(set-frame-font "Inconsolata 12" nil t)

;; Mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)


;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

; apropos to sort by relevance
(setq apropos-sort-by-scores t)
;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" invocation-name " mpah - " (:eval (if (buffer-file-name)
                                            (abbreviate-file-name (buffer-file-name))
                                          "%b"))))

;;; color-theme
;; Toggle between solarized light and dark with F12
(defcustom default-light-color-theme 'solarized-light "default
light theme")

(defcustom default-dark-color-theme 'solarized-dark "default
dark theme")

(defun toggle-dark-light-theme ()
  (interactive)
  (let ((is-light (find default-light-color-theme custom-enabled-themes)))
    (dolist (theme custom-enabled-themes)
      (disable-theme theme))
    (load-theme (if is-light default-dark-color-theme default-light-color-theme))
    (tool-bar-mode -1)))

;; make emacs always use its own browser for opening URL links
;;(setq browse-url-browser-function 'eww-browse-url) ;; does not work in windows

(require 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
;; delegate theming to the currently active theme
(setq sml/theme nil)
(add-hook 'after-init-hook #'sml/setup)

;; show the cursor when moving after big movements in the window
;; (require 'beacon)
;; (beacon-mode +1)

;; show available keybindings after you start typing
(require 'which-key)
(which-key-mode +1)

;; recently opened files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)


;; Take a break from helm - a bit too crazy!
;;helm auto-completion mode
;; (require 'helm-config)
;; ;; start helm-mode
;; (helm-mode 1)
;; ;;helm-M-x: enhanced execute-extended-command
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; ;;helm-find-files: one command that handles all the files related commands
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)

;; ido and smex
(require 'ido)
(require 'ido-completing-read+)
;;(require 'ido-ubiquitous)
(require 'flx-ido)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-save-directory-list-file (expand-file-name "ido.hist" mpah-savefile-dir)
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length -1)
(ido-mode +1)
(ido-ubiquitous-mode +1)

;;; smarter fuzzy matching for ido
(flx-ido-mode +1)
;; disable ido faces to see flx highlights
(setq ido-use-faces nil)

;;; smex, remember recently and most frequently used commands
(require 'smex)
(setq smex-save-file (expand-file-name ".smex-items" mpah-savefile-dir))
(smex-initialize)

;; company-mode
(add-hook 'after-init-hook 'global-company-mode)

;; parens
(setq show-paren-delay 0)  ;; remove delay prior to showing match
(show-paren-mode 1) ;; show matching parens
(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-strict-mode)

;; rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(provide 'ui-mpah)
;;; ui-mpah.el ends here
