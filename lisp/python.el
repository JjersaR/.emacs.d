(use-package lsp-pyright
  :hook (python-mode . (lambda () (require 'lsp-pyright)))
  :init (when (executable-find "python3")
          (setq lsp-pyright-python-executable-cmd "python3")))

(use-package poetry :ensure t :after lsp-pyright)

(use-package djangonaut)
(global-djangonaut-mode 1)

(use-package flymake-python-pyflakes)
(setq flymake-python-pyflakes-executable "flake8")
(add-hook 'pyhon-mode-hook 'flymake-python-pyflakes-load)
