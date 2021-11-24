;;; ~/.emacs.d/.emacs.modes

;; Company-mode (autocompletion) - Meep meep, woooo.
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 3)
(setq company-dabbrev-ignore-case t)
(setq company-dabbrev-downcase t)'
(global-company-mode)
(with-eval-after-load 'company
    (define-key company-active-map (kbd "C-s") 'company-select-next)
    (define-key company-active-map (kbd "C-r") 'company-select-previous))

;; All backups now stored in .saves
(setq
   auto-save-default nil
   backup-by-copying t
   backup-directory-alist '(("." . "~/.saves/"))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)

(use-package super-save
  :ensure t
  :config
  (super-save-mode +1)
  (setq super-save-auto-save-when-idle t))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))


;; Column number
(column-number-mode t)

;; Eldoc mode
(eldoc-mode t)

;; Key chord (using "jj" as vim escape) - med mere.
(key-chord-mode 1)

;; Pending delete mode - Sletter alt, der er markeret, når man skriver.
(pending-delete-mode t)

;; Replace tabs with spaces - Bibidy bobidy.
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

;; Show matching pairs of parentheses.
(show-paren-mode t)

;; Yasnippet
(use-package yasnippet ;; not yasnippet-bundle
  :ensure t
  :config
  (yas-global-mode 1)) 


;; Tramp - Bruges til sudo
(require 'tramp)

;; Global centered cursor
(centered-point-mode)

(use-package diminish :ensure t :demand t)
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1)
  :diminish editorconfig-mode)

