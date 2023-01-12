(use-package ibuffer-vc
  :bind ("C-x C-b" . ibuffer)
  :delight)

(setq ibuffer-saved-filter-groups
	    (quote (("default"
			   ("dired" (mode . dired-mode))
			   ("org" (name . "^.*org$"))
			   ("web" (or (mode . web-mode) (mode . js2-mode)))
			   ("shell" (or (mode . eshell-mode) (mode . shell-mode)))
			   ("mu4e" (name . "\*mu4e\*"))
			   ("programming" (or
						(mode . python-mode)
						(mode . c++-mode)
						(mode . java-mode)))
	 ("emacs" (or
					  (name . "^\\*scratch\\*$")
					  (name . "^\\*Messages\\*$")))))))

(add-hook 'ibuffer-mode-hook
		(lambda ()
		  (ibuffer-auto-mode 1)
		  (ibuffer-switch-to-saved-filter-groups "default")))

;; Don't show filter groups if there are no buffers in that group
(setq ibuffer-show-empty-filter-groups nil)
;; Don't ask for confirmation to delete marked buffers
(setq ibuffer-expert t)
(setq ibuffer-default-sorting-mode 'recency)
