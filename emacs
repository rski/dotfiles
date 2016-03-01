(require 'package)
;;; Code:
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(load-theme 'misterioso t)
(defalias 'yes-or-no-p 'y-or-n-p)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq require-final-newline t)
(setq mode-require-final-newline t)
(global-linum-mode 1)

(setq backup-directory-alist
       `((".*" . "~/.tmp/emacs")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.tmp/emacs" t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
