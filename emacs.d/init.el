;; Interactively Do Things
(require 'ido)

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

;; use two spaces instead of four indentation in js-mode (used for .json files)
(setq js-indent-level 2)

;; use js2-mode for .js files
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(require 'js2-refactor)
;; eg. extract function with `C-c C-m ef`.
(js2r-add-keybindings-with-prefix "C-c C-m")

;; company-mode
(require 'company)
(require 'company-go)
;; use the company-go backend only
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
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

;; auto refresh buffer if file has changed
(global-auto-revert-mode t)

;; use html-mode for the python bottle template files
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . html-mode))
;; use html-mode for the handlebars template files
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . html-mode))

(require 'column-marker)

;; use web-mode for .tpl (bottle template) files
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))

;; markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(load "~/.emacs.d/init_look_and_feel.el")
(load "~/.emacs.d/init_keybinding.el")
(load "~/.emacs.d/init_linux_custom.el")
(load "~/.emacs.d/init_osx_custom.el")
