(use-package python
  :ensure nil
  :mode ("\\.py\\'" . python-mode)
  :hook ((python-mode . lsp-deferred)))

(use-package pyvenv
  :ensure t
  :hook (python-mode . pyvenv-mode)
  :config
  (setenv "WORKON_HOME" (expand-file-name "~/miniconda3/envs/"))
  (add-hook 'pyvenv-post-activate-hooks
            (lambda ()
              (pyvenv-restart-python)
              (message "Python env switched. Run `M-x lsp-restart-workspace` if using pylsp."))))
(with-eval-after-load 'python-mode
  (define-key python-mode-map (kbd "C-c v") #'pyvenv-workon))

(provide 'init-python)
