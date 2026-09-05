;;; -*- lexical-binding: t -*-
;;; init-eglot.el

;; The sole declaration of globally available language servers.  Servers that
;; belong only to a project stay in that project's Nix development shell and
;; can be started explicitly with `eglot'.
(defconst my-eglot-server-specs
  '(((python-mode python-ts-mode) . ("ty" "server"))
    ((c-mode c-ts-mode c++-mode c++-ts-mode)
     . ("clangd" "-background-index" "-clang-tidy" "-header-insertion=never"))
    ((js-mode js-ts-mode typescript-mode typescript-ts-mode tsx-ts-mode)
     . ("typescript-language-server" "--stdio"))
    ((rust-mode rust-ts-mode) . ("rust-analyzer"))
    ((sh-mode bash-ts-mode) . ("bash-language-server" "start"))
    ((lua-mode lua-ts-mode) . ("lua-language-server"))
    ((toml-mode toml-ts-mode) . ("taplo" "lsp" "stdio"))
    ((markdown-mode gfm-mode) . ("marksman" "server"))
    ((verilog-mode) . ("verible-verilog-ls"))))

(defvar my-eglot-managed-modes nil)

(defun my-eglot-register-server (modes server)
  "Register SERVER for MODES in Eglot and its automatic-start allowlist."
  (dolist (mode modes)
    (add-to-list 'my-eglot-managed-modes mode)
    (setf (alist-get mode eglot-server-programs nil nil #'eq) server)))

(use-package eglot
  :ensure nil
  :custom
  (eglot-autoshutdown t)
  (eglot-events-buffer-size 0)
  (eglot-ignored-server-capabilities '(:documentOnTypeFormattingProvider))
  :config
  (dolist (spec my-eglot-server-specs)
    (my-eglot-register-server (car spec) (cdr spec)))

  ;; Only attach to servers declared above.  This avoids trying to start
  ;; project-local tools before their Nix development environment is active.
  (defun my-eglot-ensure ()
    "Prepare the project environment, then start a declared Eglot server."
    (when (memq major-mode my-eglot-managed-modes)
      ;; Eglot inherits PATH when its server starts.  Enabling envrc here
      ;; avoids a race with envrc's global after-major-mode hook.
      (when (and (bound-and-true-p envrc-global-mode)
                 (not (bound-and-true-p envrc-mode)))
        (envrc-mode 1))
      (eglot-ensure)))
  (add-hook 'prog-mode-hook #'my-eglot-ensure)
  (add-hook 'markdown-mode-hook #'my-eglot-ensure)
  (add-hook 'gfm-mode-hook #'my-eglot-ensure)

  (keymap-set eglot-mode-map "C-c l a" #'eglot-code-actions)
  (keymap-set eglot-mode-map "C-c l r" #'eglot-rename)
  (keymap-set eglot-mode-map "C-c l f" #'eglot-format-buffer)
  (keymap-set eglot-mode-map "C-c l d" #'flymake-show-buffer-diagnostics)
  (keymap-set eglot-mode-map "C-c l n" #'flymake-goto-next-error)
  (keymap-set eglot-mode-map "C-c l p" #'flymake-goto-prev-error))

(provide 'init-eglot)
