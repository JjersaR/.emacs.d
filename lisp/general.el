;; aqui puedes definir atajos de teclado
(use-package general
  :config
  (general-evil-setup t))

(general-define-key
;; apartado de Crux
:prefix "C-c c"
"f" 'crux-recentf-find-file
"D" 'crux-delete-file-and-buffer
"c" 'crux-copy-file-preserve-attributes
"k" 'crux-kill-other-buffers
"o" 'crux-other-window-or-switch-buffer)

(general-define-key
;; apartado de lsp java
:prefix "C-c l j"
"p" 'lsp-java-build-project
"u" 'lsp-java-update-project-configuration
"n" 'lsp-java-create-field
"o" 'lsp-java-organize-imports
"O" 'lsp-java-generate-overrides
"a" 'lsp-java-generate-getters-and-setters
"h" 'lsp-java-generate-equals-and-hash-code
"t" 'lsp-java-generate-to-string
"i" 'lsp-java-add-import
"I" 'lsp-java-organize-imports
"s" 'lsp-java-open-super-implementation
"c" 'lsp-java-extract-to-constant
"M" 'lsp-java-extract-method
"v" 'lsp-java-extract-to-local-variable)

(general-define-key
;; movernos entre ventanas
"C-<left>" 'windmove-left
"C-<right>" 'windmove-right
"C-<up>" 'windmove-up
"C-<down>" 'windmove-down)
