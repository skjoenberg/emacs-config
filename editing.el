;;; Stuff for general editing
(use-package evil
  :ensure t
  :bind ((:map evil-motion-state-map
               ("j" . evil-next-visual-line)
               ("k" . evil-previous-visual-line))
         (:map evil-visual-state-map
               ("j" . evil-next-visual-line)
               ("k" . evil-previous-visual-line)))
  :chords ("jk" . evil-normal-state)
  :config (evil-mode 1))

(use-package expand-region
  :bind (("C-j" . er/expand-region)
         ("C-S-j" . er/contract-region)))

(use-package evil-mc
  :ensure t
  :bind (("C-h" . evil-mc-make-and-goto-next-match)
         ("C-S-h" . evil-mc-make-and-goto-prev-match))
  :config
  (global-evil-mc-mode 1)
  (setq evil-mc-undo-cursors-on-keyboard-quit 1))

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))
