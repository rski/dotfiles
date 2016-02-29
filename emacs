(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(load-theme 'misterioso t)
(setq backup-directory-alist `(("." . "~/.tmp/emacs")))
(defalias 'yes-or-no-p 'y-or-n-p)