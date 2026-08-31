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

;;; terminal emulators
(use-package ghostel
  :ensure t
  :config
  (setq ghostel-module-auto-install t))

(use-package eat
  :ensure t)

(provide 'init-basic)
