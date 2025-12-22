;;; init-cc.el --- Modern C config with use-package

(use-package cc-mode
  :ensure nil
  :config
  (setq c-default-style "bsd"
        c-basic-offset 4
        tab-width 4
        indent-tabs-mode nil))  

(provide 'init-cc)
