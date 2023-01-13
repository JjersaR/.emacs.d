(use-package org
  :ensure org-plus-contrib
  :delight "100"
  :config (setq org-ellipsis " ▾"
		org-hide-emphasis-markets t))

(use-package org-modern
  :after org
  :hook (org-mode . org-modern-mode)
  (global-org-modern-mode))

(defun org-mode-visual-fill ()
  (setq visual-fill-column-width 100
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . org-mode-visual-fill))

;; Lenguajes en org-babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
	 (python . t)
	 (java . t)))
