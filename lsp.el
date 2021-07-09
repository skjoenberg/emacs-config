(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  (setq gc-cons-threshold (* 100 1024 1024)
        read-process-output-max (* 1024 1024)
        lsp-headerline-breadcrumb-enable nil
        lsp-auto-configure t
        lsp-eldoc-enable-hover nil ; to avoid conflicting with CIDER eldoc
        lsp-lens-enable t
        lsp-enable-indentation nil ; clojure-lsp runs cljfmt on indent which is too aggresive
        treemacs-space-between-root-nodes nil
        company-minimum-prefix-length 2
        lsp-signature-auto-activate nil
        ; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
        )

  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-show-with-cursor nil
        lsp-ui-doc-show-with-mouse nil
        lsp-ui-sideline-show-diagnostics nil
        lsp-ui-sideline-show-hover nil
        lsp-ui-sideline-show-code-actions nil))

;; if you are helm user
(use-package helm-lsp
  :ensure t
  ;:commands helm-lsp-workspace-symbol
  )

;; Add buffer local Flycheck checkers after LSP for different major modes.
(defvar-local my-flycheck-local-cache nil)
(defun my-flycheck-local-checker-get (fn checker property)
  ;; Only check the buffer local cache for the LSP checker, otherwise we get
  ;; infinite loops.
  (if (eq checker 'lsp)
      (or (alist-get property my-flycheck-local-cache)
          (funcall fn checker property))
    (funcall fn checker property)))
(advice-add 'flycheck-checker-get
            :around 'my-flycheck-local-checker-get)

(add-hook 'lsp-managed-mode-hook
          (lambda ()
            (when (derived-mode-p 'clojure-mode)
              (setq my-flycheck-local-cache '((next-checkers . (clojure-cider-kibit)))))))

;; if you are ivy user
;(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

;; optionally if you want to use debugger
;(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
;(use-package which-key
;    :config
;    (which-key-mode))
