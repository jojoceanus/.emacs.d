;;; -*- lexical-binding: t -*-
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

;; Emacs 31 ships use-package.  Each declaration below is also its package
;; declaration; missing third-party packages install automatically.
(require 'use-package)
(setq use-package-always-ensure t)

(provide 'init-package)
