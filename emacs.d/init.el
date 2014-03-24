;; Interactively Do Things
(require 'ido)
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

;; stop creating those backup~ files
(setq make-backup-files nil)
;; stop creating those #auto-save# files
(setq auto-save-default nil)

;; remove trailing whitespaces when saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; add the marmelade repository
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; use two spaces instead of four indentation in js2-mode
(setq-default js2-basic-offset 2)

;; use js2-mode for .js files
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(require 'js2-refactor)
;; eg. extract function with `C-c C-m ef`.
(js2r-add-keybindings-with-prefix "C-c C-m")

;; autocomplete
;; concerning javascript you need to copy javascript-mode to js-mode since
;; emacs seems to use js-mode by default and AC will therefore try to use
;; the js-mode dict
(require 'auto-complete-config)
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

;; YaSnippet
(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)
;; Load the snippet files themselves
(yas/load-directory "~/.emacs.d/elpa/yasnippet-0.8.0/snippets")
;; Let's have snippets in the auto-complete dropdown
(add-to-list 'ac-sources 'ac-source-yasnippet)

;; Font
(set-face-font 'default "-unknown-Ubuntu Mono-bold-normal-normal-*-18-*-*-*-m-0-iso10646-1")
(set-face-font 'menu "-unknown-Ubuntu Mono-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1")

;; Use solarized theme
(load-theme 'solarized-dark t)

;; spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; use html-mode for the python bottle template files
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . html-mode))

;; y and n instead of yes or no prompt
(defalias 'yes-or-no-p 'y-or-n-p)

;; highlight column 80 to help with the eighty columns rule
(require 'column-marker)
(add-hook 'js2-mode-hook (lambda () (interactive) (column-marker-3 80)))
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-3 80)))
(setq column-number-mode t)

;; shortcuts
(defalias 'ir 'indent-region)
(defalias 'rb 'revert-buffer)
(defalias 'lf 'load-file)

;; use web-mode for .tpl (bottle template) files
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
