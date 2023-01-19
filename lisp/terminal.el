(use-package popper
  :ensure t
  :bind (("C-'"   . popper-toggle-latest)
         ("M-'"   . popper-cycle)
         ("C-x M-~" . popper-kill-latest-popup)
         ("C-M-'" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          "\\*Warnings\\*"
          "\\*xref\\*"
          "*Flymake diagnostics.*"
          "\\*compilation\\*"
          "\\*Async Shell Command\\*"
          help-mode
          compilation-mode))
  (setq popper-reference-buffers
        (append popper-reference-buffers
                '("^\\*eshell.*\\*$" eshell-mode ;eshell as a popup
                  "^\\*shell.*\\*$"  shell-mode  ;shell as a popup
                  "^\\*term.*\\*$"   term-mode   ;term as a popup
                  "^\\*vterm.*\\*$"  vterm-mode  ;vterm as a popup
              )))
  (popper-mode +1)
  (popper-echo-mode +1))
