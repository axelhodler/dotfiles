;; Look and feel

;; M-x mode, autocomplete M-x methods
(global-set-key
     "\M-x"
     (lambda ()
       (interactive)
       (call-interactively
        (intern
         (ido-completing-read
          "M-x "
          (all-completions "" obarray 'commandp))))))

;; deactivate with menu-, tool- and scrollbar
(menu-bar-mode -1)
  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

;; disable emacs splash screen
(setq inhibit-splash-screen t)

;; Font
(set-face-font 'default "-unknown-Ubuntu Mono-bold-normal-normal-*-18-*-*-*-m-0-iso10646-1")
(set-face-font 'menu "-unknown-Ubuntu Mono-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1")

;; Use solarized theme
(load-theme 'solarized-dark t)

;; spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; highlight column 80 to help with the eighty columns rule
(add-hook 'js2-mode-hook (lambda () (interactive) (column-marker-3 80)))
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-3 80)))
(setq column-number-mode t)
