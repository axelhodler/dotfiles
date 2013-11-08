;; Interactively Do Things
(require 'ido)
(ido-mode t)

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
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

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
