;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Configuracion base
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; informacion personal
(setq user-full-name "Ricardo"
user-login-name "r"
user-real-login-name "JjersaR"
user-mail-address "rikisj5649@gmail.com")

;; Iniciar el servidor
(require 'server)
(unless (server-running-p)
  (server-start))

;; De yes y no a y - n
(fset 'yes-or-no-p 'y-or-n-p)

;; brillo
(set-frame-parameter nil 'alpha 95)

;; quitar *.el~ y bloqueo de archivos
(setq backup-inhibited t
create-lockfiles nil)

;; Recargar archivos
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

;;Cambiar mensaje y mas suave el bajar
(setq initial-scratch-message "Holis"
inhibit-startup-message t
mouse-wheel-progressive-speed nil)

;; minimalismo
(tool-bar-mode -1) ; Desactivar barra de herramientas
(menu-bar-mode -1) ; Desactivar barra de menu
(scroll-bar-mode -1) ; Desactivar scroll
(setq large-file-warning-threshold nil ; No advertir archivos grandes
ad-redefinition-action 'accept) ; Consejos para funciones
(recentf-mode 1) ; Activar historial de archivos recientes
(save-place-mode 1) ; recordar donde esta el puntero
(setq use-dialog-box nil) ; enfocarse en el teclado
(setq-default default-directory "~/") ; para que dired empiece en home

;; numeros relativos
(custom-set-variables '(display-line-numbers 'relative))
(dolist (mode '(org-mode-hook
    term-mode-hook
    shell-mode-hook
    eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; mover archivos eliminados a la basura
(setq-default delete-by-moving-to-trash t
  ;; elimine archivos de copia
  delete-old-versions t
  ;;sangria
  tab-width 2
  indent-tabs-mode nil
  ;; borrar buffer de dired si se abre otro
  dired-kill-when-opening-new-dired-buffer t)

;; configuracion de dired
(setq dired-listing-switches "-agho --group-directories-first")
(setq dired-dwim-target t)

;; recolectar basura
(add-function :after after-focus-change-function (lambda () (unless (frame-focus-state) (save-some-buffers t))))

;; eliminar espacios en blanco
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Repositorios
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(setq package-archives
  '(("melpa" . "https://melpa.org/packages/")
    ("melpa-stable" . "https://stable.melpa.org/packages/")
    ("org" . "https://orgmode.org/elpa/")
    ("gnu"   . "https://elpa.gnu.org/packages/")))

;; BOOTSTRAP USE-PACKAGE
(unless (package-installed-p 'use-package)
  (package-refresh-contents) ; update archives
  (package-install 'use-package)) ; grab the newest use-package
(eval-and-compile
  (require 'use-package)
  (require 'bind-key)
  (setq warning-minimum-level :emergency)) ; :error (default is :warning)

;; actualizar los paquetes
(use-package auto-package-update)
(setq auto-package-update-interval 3) ; actualizar c/3 dias
(setq auto-package-update-prompt-before-update t) ; preguntar antes de actualizar
(setq auto-package-update-show-preview t) ; paquetes a actualizar
(setq auto-package-update-delete-old-versions t) ; eliminar versiones anteriores

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Cargar Configuracion
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; cargar todos los .el en lisp
(defun load-directory (dir)
  (let ((load-it (lambda (f)
		   (load-file (concat (file-name-as-directory dir) f)))))
    (mapc load-it (directory-files dir nil "\\.el$"))))

(load-directory "~/.emacs.d/lisp") ; cargar la configuracion de...
