(use-package verilog-mode
  :ensure t
  :mode ("\\.v\\'" "\\.sv\\'")
  :hook (verilog-mode . lsp-deferred)
  :config
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 4)
  (setq verilog-auto-indent-on-newline t)
  (setq verilog-indent-level 4)
  (setq verilog-indent-level-module 0)
  (setq verilog-indent-level-declaration 4)
  (setq verilog-indent-level-behavioral 4)
  (setq verilog-indent-level-directive 0)
  (setq verilog-auto-newline nil))

(provide 'init-verilog)
