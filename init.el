;;; -*- lexical-binding: t -*-
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-package)

(require 'init-core)

(defun my-show-initial-frame ()
  "Reveal the initial frame after early-init suppressed redisplay."
  (make-frame-visible (selected-frame))
  (setq inhibit-redisplay nil)
  (setq inhibit-message nil)
  (redisplay))


(require 'init-theme)
(my-show-initial-frame)

;;; basic config to enhance emacs
(require 'init-basic)
(require 'init-vertico)
(require 'init-corfu)

(require 'init-project)
(require 'init-envrc)
(require 'init-program)
(require 'init-cc)
(require 'init-python)
(require 'init-haskell)
(require 'init-verilog)

(require 'init-latex)
(require 'init-markdown)

;; Local Custom changes (for example GUI-only preferences) are intentionally
;; machine-specific and therefore ignored by Git.
(when (file-exists-p custom-file)
  (load custom-file nil 'nomessage))

(provide 'init)
