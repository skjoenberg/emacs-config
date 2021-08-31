(use-package evil
  :ensure t
  :bind ((:map evil-motion-state-map
               ("j" . evil-next-visual-line)
               ("k" . evil-previous-visual-line))
         (:map evil-visual-state-map
               ("j" . evil-next-visual-line)
               ("k" . evil-previous-visual-line)))
  :chords ("jk" . evil-normal-state)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-tree))

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode 1))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))
