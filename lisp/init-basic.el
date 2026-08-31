;;; -*- lexical-binding: t -*-
;;; scale
(use-package default-text-scale
  :ensure t
  :config
  (default-text-scale-mode 1))

;;; clipboard
(use-package xclip
  :ensure t
  :config
  (xclip-mode 1))

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
(use-package avy
  :ensure t
  :bind
  (("C-'" . avy-goto-char-timer)
   ("M-g f" . avy-goto-line)))

;;; use which key to dispay commands
(use-package which-key
  :ensure t
  :init (which-key-mode))

;;; git gutter indicators (like VS Code)
(use-package diff-hl
  :ensure t
  :hook ((prog-mode . diff-hl-mode)
         (magit-pre-refresh . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh)))

;;; git integration
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

;;; multiple cursors
(use-package multiple-cursors
  :ensure t
  :bind (("C-=" . mc/mark-next-like-this)
         ("C--" . mc/mark-previous-like-this)
         ("C-c C-=" . mc/edit-lines)
         ("C-c C-a" . mc/mark-all-like-this)))

;;; code snippets
(use-package tempel
  :ensure t
  :bind (("M-+" . tempel-complete)
         ("M-=" . tempel-insert)))

;;; highlight TODO/FIXME/HACK
(use-package hl-todo
  :ensure t
  :hook (prog-mode . hl-todo-mode))

;;; clean up mode-line
(use-package diminish
  :ensure t
  :config
  (diminish 'which-key-mode)
  (diminish 'undo-tree-mode)
  (diminish 'auto-revert-mode)
  (diminish 'electric-pair-mode)
  (diminish 'repeat-mode)
  (diminish 'global-display-line-numbers-mode))

;;; terminal emulators
(use-package ghostel
  :ensure t
  :config
  (setq ghostel-module-auto-install t))

(use-package eat
  :ensure t)

(provide 'init-basic)
