;;; init-project.el --- Built-in project workflow -*- lexical-binding: t; -*-

(require 'project)
(require 'compile)

;; Keep task execution project-oriented while leaving the actual command under
;; the project's control (Makefiles and project-specific scripts work as-is).
(setq compilation-scroll-output 'first-error)

(defun my-project-ripgrep ()
  "Search the current project with Consult and ripgrep."
  (interactive)
  (consult-ripgrep (project-root (project-current t))))

(keymap-global-set "C-c p p" #'project-switch-project)
(keymap-global-set "C-c p f" #'project-find-file)
(keymap-global-set "C-c p b" #'project-switch-to-buffer)
(keymap-global-set "C-c p s" #'my-project-ripgrep)
(keymap-global-set "C-c p g" #'project-find-regexp)
(keymap-global-set "C-c p d" #'project-dired)
(keymap-global-set "C-c p c" #'project-compile)
(keymap-global-set "C-c p r" #'recompile)

(provide 'init-project)
