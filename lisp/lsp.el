(use-package lsp-mode
  :ensure t
  :custom (lsp-auto-guess-root t)
          (lsp-keep-workspace-alive nil)
          (lsp-enable-snippet t)
          (lsp-auto-execute-action nil)
          (lsp-eldoce-render-all nil)
          (lsp-enable-completion-at-point t)
          (lsp-enable-xref t)
          (lsp-diagnostics-provider :flycheck)
          (lsp-enable-indentation t)
          (lsp-before-save-edits nil)
          (lsp-enable-imenu t)
          (lsp-signature-render-documentation nil)
          (lsp-completion-provider :company)
          (lsp-keymap-prefix "C-c l")
  :hook ((java-mode python-mode c++-mode) . lsp-deferred))

(use-package lsp-ui
  :after lsp-mode
  :diminish
  :custom
  ;; Sideline
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-sideline-show-code-actions nil)
  (lsp-ui-sideline-update-mode 'line)
  (lsp-ui-sideline-delay 0)
  ;; Peek
  (lsp-ui-peek-enable t)
  (lsp-ui-peek-show-directory nil)
  ;; Documentation
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-doc-delay 0.2)
  ;;IMenu
  (lsp-ui-imenu-window-width 0)
  (lsp-ui-imenu--custom-mode-line-format nil)
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-treemacs
  :ensure t
  :commands (lsp-treemacs-errors-list)
  (lsp-treemacs-sync-mode 1))

(use-package treemacs-evil)

(use-package lsp-ivy
  :requires (ivy)
  :ensure t
  :commands (lsp-ivy-workspace-symbol lsp-ivy-global-workspace-symbol))
