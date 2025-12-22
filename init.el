;;; lisp path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;; basic config to enhance emacs
(require 'init-basic)

(require 'init-theme)

;;; vi mode
;(require 'init-vi)

(require 'init-project)

(require 'init-treemacs)
;;; ehance code experience
(require 'init-program)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(provide 'init)
