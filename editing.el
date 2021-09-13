;;; Stuff for general editing
(use-package expand-region
  :bind (("C-j" . er/expand-region)
         ("C-S-j" . er/contract-region)))

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))
