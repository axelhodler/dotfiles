;; Auctex
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-file "/home/xorrr/.emacs.d/elpa/graphviz-dot-mode-0.3.7/graphviz-dot-mode.el")
;; disable auto-fill-mode
;; If I can't turn off auto-fill mode, at least I can make it harmless
;; by setting it to fill only in column 99999
(setq auto-fill-mode -1)
(setq-default fill-column 99999)
(setq fill-column 99999)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;org-mode configuration
;; Enable org-mode
(require 'org)
;; Make org-mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen


