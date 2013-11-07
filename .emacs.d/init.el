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
