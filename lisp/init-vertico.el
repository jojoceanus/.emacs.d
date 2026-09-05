;;; -*- lexical-binding: t -*-
;;; init-vertico.el

(use-package vertico
  :init (vertico-mode)
  :custom
  (vertico-cycle t)
  (vertico-resize nil)
  (vertico-count 10))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides
   '((file (styles basic partial-completion)))))

(use-package marginalia
  :init (marginalia-mode))

(use-package consult
  :bind
  (("C-s" . consult-line)
   ("C-r" . consult-line)
   ("M-y" . consult-yank-pop)
   ("C-x b" . consult-buffer)
   ("C-x C-r" . consult-recent-file)
   ("M-g g" . consult-goto-line)
   ("M-s d" . consult-ripgrep)
   ("M-s l" . consult-line-multi))
  :custom
  (consult-narrow-key "<")
  (consult-async-min-input 2))

(use-package embark
  :bind (("C-." . embark-act)
         ("C-;" . embark-dwim))
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :after (embark consult))

(provide 'init-vertico)
