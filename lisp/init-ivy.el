;;; ivy related package configs

(use-package ivy
  :ensure t
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (("C-x b" . 'ivy-switch-buffer)
   ("C-c v" . 'ivy-push-view)
   ("C-c s" . 'ivy-switch-view)
   ("C-c V" . 'ivy-pop-view)))

(use-package counsel
  :ensure t
  :after ivy
  :init
  (counsel-mode 1)
  :bind
  (("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("C-x C-@" . counsel-mark-ring)
   ("C-x C-SPC" . counsel-mark-ring)
   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history)))

(use-package swiper
  :ensure t
  :after ivy
  :bind
  (("C-s" . swiper-isearch)
   ("C-r" . swiper-isearch-backward)))

(provide 'init-ivy)
