;;; -*- lexical-binding: t -*-
;;; init-program.el

(require 'treesit)

;; Grammars live outside the repository.  `treesit-auto' only prompts for a
;; download when a visited language needs one; it never works during startup.
(let ((grammar-dir (expand-file-name "tree-sitter" user-emacs-directory)))
  (when (file-directory-p grammar-dir)
    (add-to-list 'treesit-extra-load-path grammar-dir)))

(use-package treesit-auto
  :custom
  ;; Verilog is intentionally absent: its current upstream recipe produces a
  ;; grammar exporting `tree_sitter_systemverilog', not Emacs's expected
  ;; `tree_sitter_verilog'.  The built-in verilog-mode remains the fallback.
  (treesit-auto-langs '(python c cpp javascript typescript tsx rust bash lua
                               toml yaml))
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(require 'init-eglot)

(add-hook 'prog-mode-hook
          (lambda ()
            (setq-local show-trailing-whitespace t)))

(provide 'init-program)
