;;; -*- lexical-binding: t -*-
;;; lisp/init-theme.el
(defvar my-theme-name 'doom-monokai-pro "The theme to load.")
(defvar my-theme-package-list '(doom-themes
                                 ef-themes
                                 catppuccin-theme
                                 dracula-theme
                                 gruvbox-theme))

(defvar my--theme-loaded nil "Whether the theme was successfully loaded.")

(defun my-load-theme ()
  (unless my--theme-loaded
    (if (ignore-errors (load-theme my-theme-name t))
	(setq my--theme-loaded t)
      (message "theme %s not ready yet." my-theme-name))))

(provide 'init-theme)
