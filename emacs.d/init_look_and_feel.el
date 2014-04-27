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

(ido-mode t)
;; disable looking in other directories when trying to open a file with name x
(setq ido-auto-merge-work-directories-length -1)
;; create necessary parent directories when creating a file
(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir)))))

;; stop creating those backup~ files
(setq make-backup-files nil)
;; stop creating those #auto-save# files
(setq auto-save-default nil)

;; remove trailing whitespaces when saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)
