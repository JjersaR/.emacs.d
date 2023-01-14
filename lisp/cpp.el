(use-package modern-cpp-font-lock
  :ensure t)
(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)

(use-package meson-mode)
(add-hook 'meson-mode-hook 'company-mode)

(use-package cpp-auto-include :hook (c++-mode . cpp-auto-include))
