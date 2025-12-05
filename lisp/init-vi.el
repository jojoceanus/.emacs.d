;;; use vi mode
(use-package evil
  :ensure t
  :init
  (evil-mode)
  :config
  (evil-define-key 'normal prog-mode-map
    "gd" #'lsp-find-definition
    "gr" #'lsp-find-references
    "K"  #'lsp-ui-doc-glance
    "gi" #'lsp-find-implementation
    "gD" #'lsp-describe-thing
    "g=" #'lsp-format-buffer)
  (evil-define-key 'visual prog-mode-map
    "="  #'lsp-format-region))

(provide 'init-vi)
