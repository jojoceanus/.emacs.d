;;; init-latex.el --- LaTeX config -*- lexical-binding: t; -*-

(use-package auctex
  :defer t
  :init
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (setq TeX-engine 'xetex)
  (setq TeX-PDF-mode t)
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-source-correlate-start-server t)
  (setq TeX-show-compilation t)
  (setq TeX-view-program-selection '((output-pdf "PDF Tools")))
  (setq TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))

  ;; per-buffer edit enhancements
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (turn-on-reftex)
              (LaTeX-math-mode 1)
              (TeX-fold-mode 1)
              (outline-minor-mode 1)))

  ;; auto-revert PDF and open viewer after compilation
  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer)
  (add-hook 'TeX-after-compilation-finished-functions
            (lambda (_) (TeX-view))))

;; fast math input: ` a -> \alpha, ` i -> \int, etc.
(use-package cdlatex
  :hook (LaTeX-mode . cdlatex-mode))

;; PDF viewer - lazy load on first PDF open
(use-package pdf-tools
  :defer t
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install :no-query)
  (setq pdf-view-display-size 'fit-width)
  (setq pdf-view-continuous t)
  (setq pdf-view-use-scaling t)
  (add-hook 'pdf-view-mode-hook
            (lambda ()
              (display-line-numbers-mode -1))))

(provide 'init-latex)
