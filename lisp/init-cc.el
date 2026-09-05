;;; -*- lexical-binding: t -*-
;;; lang/init-cc.el

(use-package cc-mode
  :ensure nil
  :custom
  (c-default-style "bsd"))

(add-hook 'c-ts-base-mode-hook
          (lambda ()
            (setq-local c-ts-mode-indent-offset 4)
            (setq-local indent-tabs-mode nil)
            (setq-local tab-width 4)))

(provide 'init-cc)
