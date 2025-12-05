;;; package management
(unless package--initialized
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-initialize))
(setq use-package-always-ensure t)
(setq use-package-always-defer nil)
(setq use-package-expand-minimally t)

;;; native config
(when (display-graphic-p) (toggle-scroll-bar -1))
(global-display-line-numbers-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(global-auto-revert-mode t)

(electric-pair-mode t)
(delete-selection-mode t)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;;; scale
(use-package default-text-scale
  :ensure t
  :config
  (default-text-scale-mode 1))

;;; clipboard
(use-package xclip
  :ensure t
  :demand t
  :config
  (xclip-mode 1))

;;; overview the project
(use-package treemacs
  :ensure t
  :defer t
  :config
  (treemacs-tag-follow-mode)
  :bind
  (:map global-map
	("M-0" . treemacs-select-window)
	("C-x t 1" . treemacs-delete-other-window)
	("C-x t t" . treemacs)
	("C-x t B" . treemacs-bookmark)
	("C-x t M-t" . treemacs-find-tag))
  (:map treemacs-mode-map
	("/" . treemacs-advanced-helpful-hydra)))

;;; project manager
(use-package projectile
  :ensure t
  :bind (("C-c p" . projectile-command-map))
  :config
  (setq projectile-mode-line "Projectile")
  (setq projectile-track-known-projects-automatically nil))

;;; ivy 
(require 'init-ivy)

;;; rainbow delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;;; M-x history
(use-package amx
  :ensure t
  :init (amx-mode))

;;; switch window with number
(use-package ace-window
  :ensure t
  :bind (("C-x o" . 'ace-window)))

;;; move to the start and end of a line with emacs-mode
(use-package mwim
  :ensure t
  :bind
  (("C-a" . mwim-beginning-of-code-or-line)
   ("C-e" . mwim-end-of-code-or-line)))

;;; manage undo with a tree
(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode)
  :custom
  (undo-tree-auto-save-history nil))

;;; move pointer in emacs mode
;; (use-package avy
;;   :ensure t
;;   :bind
;;   (("M-j C-SPC" . avy-goto-char-timer)))
;;; to-do fix the M-j conflict

;;; use which key to dispay commands
(use-package which-key
  :ensure t
  :init (which-key-mode))

(provide 'init-basic)
