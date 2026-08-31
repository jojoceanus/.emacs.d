;;; -*- lexical-binding: t -*-
;;; init-eglot.el

(use-package eglot
  :ensure nil
  :custom
  (eglot-autoshutdown t)
  (eglot-events-buffer-size 0)
  (eglot-ignored-server-capabilities '(:documentOnTypeFormattingProvider))
  :config
  ;; only auto-attach eglot for modes that have a registered server
  (defun my-eglot-ensure ()
    "Start eglot only if a server is registered for the current major mode."
    (when (assoc major-mode my-lsp-server-alist)
      (eglot-ensure)))
  (add-hook 'prog-mode-hook #'my-eglot-ensure)

  (setq my-lsp-reconnect-function
        (lambda ()
          (when (bound-and-true-p eglot--managed-mode)
            (eglot-reconnect (eglot-current-server))))))

(provide 'init-eglot)
