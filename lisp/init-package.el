;;; -*- lexical-binding: t -*-
(defun my-initialize-package ()
  (unless (bound-and-true-p package--initialized)
    (require 'package)
    (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                             ("melpa" . "https://melpa.org/packages/")
                             ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
    (package-initialize)))

(defun my-install-package (package-name)
  (my-initialize-package)
  (unless (package-installed-p package-name)
    (package-install package-name)))

(defun my-install-packages (package-list)
  (dolist (pkg package-list)
    (condition-case err
	(progn
	  (my-install-package pkg))
      (error
       (message "failed to install %s: %s" pkg (error-message-string err))))))

(provide 'init-package)
