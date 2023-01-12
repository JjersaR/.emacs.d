;; autocompletar llaves
(use-package phi-autopair
  :ensure t
  :config (phi-autopair-global-mode))

;; autocompletado
(use-package company
  :defer t
  :bind (:map company-active-map
  ("<tab>" . company-complete-selection))
  :config (setq company-idle-delay 0.0 ; quitar delay
    company-echo-delay 0 ; eliminar parpadeo
    company-tooltip-align-annotations t ;alinea la anotación al lado derecho
    company-dabbrev-downcase nil)
  :hook (prog-mode-hook . company-mode-hook)
  :custom
  (company-minimum-prefix-lenght 1))

(global-company-mode t)

;; una caja bonita
(use-package company-box
  :hook (company-mode . company-box-mode))

;; sino es proyecto usar este
(use-package quickrun
  :ensure t
  :bind ("C-c r" . quickrun))

;; para sintaxis
(use-package flycheck
  :diminish
  :hook ((flycheck-mode . flymake-mode-off))
  :config (global-flycheck-mode))

;; snippets
(use-package yasnippet :config (yas-global-mode))
(use-package yasnippet-snippets :ensure t)

;; comentarios
(use-package evil-nerd-commenter
  :bind ("C-M-/" . evilnc-comment-or-uncomment-lines))
