(use-package projectile
  :diminish projectile-mode
  :config ((projectile-mode)
           (setq projectile-completion-system 'ivy
                 projectile-globally-ignored-file-suffixes '(".elc" ".class" ".pyc" ".o")
                 projectile-require-project-root nil
                 projectile-switch-project-action #'projectile-find-dir))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (setq projectile-switch-project-action #'projectile-dired)
  :custom (projectile-completion-system 'ivy

  (projectile-register-project-type 'python-poetry '("pyproject.toml")
                                    :projectile-file "pyproject.toml"
                                    :compile "poetry install"
                                    :test "poetry run pytest"
                                    :run "poetry run python ")

  (projectile-register-project-type 'gradle '("build.gradle")
                                    :project-file "build.gradle"
                                    :compile "gradle build"
                                    :test "gradle test"
                                    :run "gradle run")

  (projectile-register-project-type 'cpp-meson '("meson.build")
                                    :project-file "meson.build"
                                    :compile "meson build"
                                    :test "ninja -C build test"
                                    :run "./build/main")))

(use-package counsel-projectile
  :config (counsel-projectile-mode))
(provide 'projectile)
