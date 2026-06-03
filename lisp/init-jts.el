(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'")

;; register typescript LSP (requires typescript-language-server in PATH)
(my-lsp-register-server 'typescript-ts-mode '("typescript-language-server" "--stdio"))

(provide 'init-jts)
