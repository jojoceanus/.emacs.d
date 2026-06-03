;;; init-corfu.el

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.5)
  (corfu-auto-prefix 2)
  (corfu-cycle t)
  (corfu-count 10)
  (corfu-quit-no-match 'separator)
  :config
  (global-corfu-mode))

;; enable corfu popup in terminal Emacs (not needed on Emacs 31+)
(use-package corfu-terminal
  :ensure t
  :hook (corfu-mode . corfu-terminal-mode))

(use-package cape
  :ensure t
  :init
  (add-hook 'completion-at-point-functions #'cape-file -10)
  (add-hook 'completion-at-point-functions #'cape-dabbrev -20)
  (add-hook 'completion-at-point-functions #'cape-dict -30))

(provide 'init-corfu)
