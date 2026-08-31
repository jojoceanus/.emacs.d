;;; -*- lexical-binding: t -*-
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

(use-package cape
  :ensure t
  :init
  (add-hook 'completion-at-point-functions #'cape-file -10)
  (add-hook 'completion-at-point-functions #'cape-dabbrev -20)
  (add-hook 'completion-at-point-functions #'cape-dict -30))

(provide 'init-corfu)
