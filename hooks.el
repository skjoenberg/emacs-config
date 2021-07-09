;; Delete whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Slime
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

;; Eldoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

(add-hook 'after-init-hook 'global-flycheck-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
