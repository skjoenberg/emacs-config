(defun my-setup-indent (n)
  ;; java/c/c++
  (setq-local standard-indent n)
  (setq-local c-basic-offset n)
  ;; web development
  (setq-local js-indent-level n) ; js-mode
  (setq-local sgml-basic-offset n) ; sgml-mode (used for JSX)
  (setq-local web-mode-attr-indent-offset n) ; web-mode
  (setq-local web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq-local web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq-local web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq-local web-mode-sql-indent-offset n) ; web-mode
  (setq-local web-mode-attr-value-indent-offset n) ; web-mode
  (setq-local typescript-indent-level n) ; typescript-mode
  (setq-local css-indent-offset n) ; css-mode
  (setq-local tide-format-options `(:indentSize ,n :tabSize ,n))
  (setq-local sh-basic-offset n)) ; shell scripts

(defun setup-indent-with-two-spaces ()
  (interactive)
  (my-setup-indent 2)
  (message "Tab size set to 2"))

(setq-local tide-format-options '(:indentSize 2 :tabSize 2))

(use-package tide
  :ensure t
  :hook ((typescript-mode . tide-setup)
         (js-mode . tide-setup)
         (web-mode . tide-setup))
  :init
  (defun my-tide-mode-hook ()
    (tide-hl-identifier-mode 1)
    (setup-indent-with-two-spaces))
  (add-hook 'tide-mode-hook 'my-tide-mode-hook)
  :config
  (setq flycheck-javascript-eslint-executable "eslint")
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-next-checker 'typescript-tide 'javascript-eslint)
  (flycheck-add-next-checker 'tsx-tide 'javascript-eslint))
