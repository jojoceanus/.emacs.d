;;; -*- lexical-binding: t -*-
;;; scale
(use-package default-text-scale
  :config
  (default-text-scale-mode 1))

;;; rainbow delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;;; switch window with number
(use-package ace-window
  :bind (("C-x o" . 'ace-window)))

;;; move to the start and end of a line with emacs-mode
(use-package mwim
  :bind
  (("C-a" . mwim-beginning-of-code-or-line)
   ("C-e" . mwim-end-of-code-or-line)))

;;; move pointer in emacs mode
(use-package avy
  :bind
  (("C-'" . avy-goto-char-timer)
   ("M-g f" . avy-goto-line)))

;;; use which key to dispay commands
(use-package which-key
  :init (which-key-mode))

;;; git gutter indicators (like VS Code)
(use-package diff-hl
  :hook ((prog-mode . diff-hl-mode)
         (magit-pre-refresh . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh)))

;;; git integration
(use-package magit
  :bind ("C-x g" . magit-status))

;;; multiple cursors
(use-package multiple-cursors
  :bind (("C-=" . mc/mark-next-like-this)
         ("C--" . mc/mark-previous-like-this)
         ("C-c C-=" . mc/edit-lines)
         ("C-c C-a" . mc/mark-all-like-this)))

;;; code snippets
(use-package tempel
  :bind (("M-+" . tempel-complete)
         ("M-=" . tempel-insert)))

;;; highlight TODO/FIXME/HACK
(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

;;; terminal emulator
(use-package eat)

(provide 'init-basic)
