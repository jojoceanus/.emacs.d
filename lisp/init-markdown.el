;;; -*- lexical-binding: t -*-
(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . gfm-mode)
  :config
  (setq markdown-command
        '("pandoc"
          "-f" "gfm+tex_math_dollars"
          "-t" "html5"
          "--mathjax"
          "--self-contained"))

  (setq markdown-enable-math t)
  (setq browse-url-browser-function 'browse-url-default-browser))

(provide 'init-markdown)
