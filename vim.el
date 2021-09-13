(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode 1))

(use-package evil
  :ensure t
  :init
  (setq evil-undo-system 'undo-tree)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :bind ((:map evil-motion-state-map
               ("j" . evil-next-visual-line)
               ("k" . evil-previous-visual-line))
         (:map evil-visual-state-map
               ("j" . evil-next-visual-line)
               ("k" . evil-previous-visual-line))
         (:map evil-normal-state-map
               ("M-." . nil)))
  :chords ("jk" . evil-normal-state)
  :config
  (evil-mode 1))

(use-package evil-surround
  :ensure t
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(use-package evil-mc
  :ensure t
  :after evil
  :bind (("C->" . evil-mc-make-and-goto-next-match)
         ("C-<" . evil-mc-make-and-goto-prev-match))
  :config
  (global-evil-mc-mode 1)
  (setq evil-mc-undo-cursors-on-keyboard-quit 1))

(use-package evil-cleverparens
  :ensure t
  :after evil
  )

(use-package evil-cleverparens-mode
  :hook clojure-mode
  :after evil)
