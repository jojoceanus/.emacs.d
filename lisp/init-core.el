;;; -*- lexical-binding: t -*-
;;; use-package
(require 'use-package nil t)

;;; benchmark (only when started with --debug-init)
(when init-file-debug
  (use-package benchmark-init
    :ensure t
    :demand t
    :config
    (benchmark-init/activate)
    (add-hook 'after-init-hook 'benchmark-init/deactivate)))

(setq indent-tabs-mode nil)
(setq column-number-mode t)
(setq confirm-kill-emacs 'yes-or-no-p)
(setq display-line-numbers-type 'visual)
(setq inhibit-startup-screen t)

;; centralize backup files instead of littering project dirs
(setq backup-directory-alist `(("." . ,(expand-file-name "backup" user-emacs-directory))))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "auto-save-list/" user-emacs-directory) t)))

(global-display-line-numbers-mode 1)
(global-auto-revert-mode t)
(delete-selection-mode t)
(electric-pair-mode 1)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; larger pipe read size for LSP subprocess performance
(setq read-process-output-max (* 3 1024 1024))

;; allow repeating commands like C-x o without re-typing the prefix
(repeat-mode 1)

;; persist history across restarts
(savehist-mode 1)

;; save window layouts across restarts
(winner-mode 1)

;; tmux-like tabs/workspaces (hidden by default)
(setq tab-bar-show nil)
(setq tab-bar-new-tab-to-distinguish t)
(keymap-global-set "C-x t n" #'tab-bar-new-tab)
(keymap-global-set "C-x t r" #'tab-bar-rename-tab)
(keymap-global-set "C-x t 0" #'tab-bar-close-tab)
(keymap-global-set "C-x t o" #'tab-bar-switch-to-tab)
(keymap-global-set "C-x t t" #'tab-bar-switch-to-tab)

;;; disable custom-file
(setq custom-file (expand-file-name "~/.emacs.d/custom.el.disabled"))
(setq custom-safe-themes t)

(provide 'init-core)
