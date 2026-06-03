;;; lang/init-python.el

(defvar my-python-venv-changed-hook nil)

(use-package python
  :ensure nil
  :config
  (setenv "WORKON_HOME" (expand-file-name "~/.venv/")))

(use-package pyvenv
  :ensure t
  :hook (python-base-mode . pyvenv-mode)
  :bind
  (:map python-base-mode-map
        ("C-c v" . pyvenv-workon))
  :config
  (defun my-pyvenv-after-change ()
    (when-let ((venv pyvenv-virtual-env))
      (setenv "VIRTUAL_ENV" venv)
      (setenv "PATH" (concat (expand-file-name "bin" venv)
                             path-separator
                             (getenv "PATH")))
      (pyvenv-restart-python)
      (run-hooks 'my-python-venv-changed-hook)))

  (add-hook 'pyvenv-post-activate-hooks #'my-pyvenv-after-change)
  (add-hook 'pyvenv-post-deactivate-hooks #'my-pyvenv-after-change))


(my-lsp-register-server 'python-ts-mode '("pyright-langserver" "--stdio"))

;; reconnect LSP when virtualenv changes
(add-hook 'my-python-venv-changed-hook #'my-lsp-on-env-change)

(provide 'init-python)
