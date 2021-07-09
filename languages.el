;; Offset
(setq-default c-basic-offset 4)

;; Haskell
(require 'haskell-mode)
;(require 'haskell-interactive-mode)
(require 'haskell-process)

;(setq flycheck-checker 'haskell-hlint)
;(add-hook 'haskell-mode-hook 'flycheck-mode)
;(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))

;;(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-hi2)

(custom-set-variables
 '(haskell-tags-on-save t))

;; Python
(add-hook 'python-mode-hook
  (lambda () (setq python-indent-offset 4)))
(setq py-python-command "python3")

(setq jedi:environment-virtualenv
      (list "virtualenv" "--system-site-packages"))

(add-hook 'python-mode-hook
  (lambda () (flycheck-mode t)))

(setq-default flycheck-disabled-checkers '(python-flake8))

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

; Clojure
(require 'flycheck-clj-kondo)
(add-hook 'cider-repl-mode-hook
  (lambda ()
    (define-key cider-mode-map (kbd "C-c C-SPC")
      'cider-switch-to-repl-buffer)
    (define-key cider-repl-mode-map (kbd "C-c C-SPC")
      'cider-switch-to-last-clojure-buffer)))
