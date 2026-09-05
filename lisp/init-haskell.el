;;; -*- lexical-binding: t -*-
;;; init-haskell.el


(use-package haskell-mode
  :hook (haskell-mode . my-haskell-setup)
  :config
  (defun my-haskell-setup ()
    (setq-local indent-offset 4)
    (setq-local haskell-process-type 'ghci)
    (setq-local haskell-process-path-ghci "ghci")))

(provide 'init-haskell)
