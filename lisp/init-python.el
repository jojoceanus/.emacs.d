;;; lang/init-python.el

(use-package python
  :ensure nil)

(my-lsp-register-server 'python-ts-mode '("pyright-langserver" "--stdio"))

(provide 'init-python)
