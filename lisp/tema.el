(use-package catppuccin-theme :config (load-theme 'catppuccin-mocha t))
(use-package autothemer :ensure t)

(setq evil-want-keybinding nil)

(use-package undo-fu)

(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  (setq evil-want-C-i-jump nil)
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(use-package which-key
  :init(which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.0))
