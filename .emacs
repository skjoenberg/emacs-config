(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(setq custom-file "~/.emacs.d/custom.el")
;; Packages

;; packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))

(setq package-check-signature nil)

(setq coding-system-for-read 'utf-8)

;;; set shortcut to kill whole emacs session
(global-set-key (kbd "C-x c") 'save-buffers-kill-emacs)
; load customizations
 (add-hook 'after-init-hook '(lambda ()
			       (load "~/emacs-config/use-package.el")
                               (load "~/emacs-config/packages/emacs-centered-point/centeredpoint.el")
			       (load "~/emacs-config/modes.el")
                               (load "~/emacs-config/editing.el")
                               (load "~/emacs-config/magit.el")
                               (load "~/emacs-config/clojure.el")
                               (load "~/emacs-config/typescript.el")
                               (load "~/emacs-config/keybindings.el")
                               (load "~/emacs-config/ido.el")
                               (load "~/emacs-config/languages.el")
                               (load "~/emacs-config/vim.el")
                               (load "~/emacs-config/workspace.el")
                               (load "~/emacs-config/windowmanagement.el")
                               (load "~/emacs-config/ui.el")
                               (load "~/emacs-config/flycheck.el")
                               (load "~/emacs-config/lsp.el")
                               ))

(provide '.emacs)
;;; .emacs ends here
