(defun cider-send-and-evaluate-sexp ()
  "Sends the s-expression located before the point or the active
  region to the REPL and evaluates it. Then the Clojure buffer is
  activated as if nothing happened."
  (interactive)
  (if (not (region-active-p))
      (cider-insert-last-sexp-in-repl)
    (cider-insert-in-repl
     (buffer-substring (region-beginning) (region-end)) nil))
  (cider-switch-to-repl-buffer)
  (cider-repl-closing-return)
  (cider-switch-to-last-clojure-buffer)
  (message ""))

(use-package clojure-mode
  :ensure t
  :config
  (add-hook 'before-save-hook 'clojure-sort-ns t t)
  ;(define-clojure-indent
  ;  (with-in-str 1)
  ;  (defroutes 'defun)
  ;  (GET 2)
  ;  (POST 2)
  ;  (PUT 2)
  ;  (DELETE 2)
  ;  (HEAD 2)
  ;  (context 2)
  ;  (cond-> 'defun)
  ;  (as-> 'defun))
  ;:init
  ;(setq clojure-indent-style 'align-arguments
  ;      ;;clojure-align-forms-automatically t
  ;      )
  )

(use-package flycheck
  :ensure t)

(use-package flycheck-clojure
  :defer t
  :commands (flycheck-clojure-setup)               ;; autoload
  :config
  (eval-after-load 'flycheck
    '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package cider
  :ensure t
  :defer t
  :commands (cider cider-connect cider-jack-in)
  :init
  (setq cider-auto-select-error-buffer nil
        cider-repl-pop-to-buffer-on-connect nil
        cider-repl-use-clojure-font-lock t
        cider-repl-wrap-history t
        cider-repl-history-size 1000
        cider-show-error-buffer t
        nrepl-hide-special-buffers t
        cider-repl-history-file nil
        ;; Stop error buffer from popping up while working in buffers other than the REPL:
        nrepl-popup-stacktraces nil
        cider-repl-require-ns-on-set t)
  :bind (:map cider-mode-map
         ("C-c C-v C-c" . cider-send-and-evaluate-sexp)
         ("C-c C-v C-p" . cider-pprint-eval-last-sexp-to-repl)
         ("C-c C-p"     . cider-eval-print-last-sexp))
  :config
  (flycheck-clojure-setup)
  (setq-default flycheck-disabled-checkers '(clojure-cider-eastwood clojure-cider-typed))
  ;;(add-hook 'before-save-hook 'cider-format-buffer t t)
  :after clojure-mode) ;; run setup *after* cider load

(use-package flycheck-pos-tip
  :ensure t
  :after flycheck)

(use-package smartparens-strict-mode
  :hook clojure-mode
  :init
  (require 'smartparens-config)
  (sp-with-modes sp--lisp-modes
    ;; disable ', it's the quote character!
    (sp-local-pair "'" nil :actions nil)
    ;; also only use the pseudo-quote inside strings where it serve as
    ;; hyperlink.
    (sp-local-pair "`" "'" :when '(sp-in-string-p sp-in-comment-p))
    (sp-local-pair "`" nil
                    :skip-match (lambda (ms mb me)
                                (cond
                                    ((equal ms "'")
                                    (or (sp--org-skip-markup ms mb me)
                                        (not (sp-point-in-string-or-comment))))
                                    (t (not (sp-point-in-string-or-comment)))))))
  :bind (("C-M-." . sp-wrap-round)
         ("C-M->" . sp-wrap-square)
         ("C-M-," . sp-wrap-curly)
         ("s-h"   . sp-backward-slurp-sexp)
         ("s-l"   . sp-forward-slurp-sexp)))

(use-package rainbow-delimiters
  :ensure t)

(use-package rainbow-delimiters-mode
  :hook clojure-mode)


(use-package aggressive-indent
  :ensure t)

(use-package aggressive-indent-mode
  :hook clojure-mode)

(use-package clojure-snippets
  :ensure t)

(use-package inf-clojure
  :ensure t)

(defun cljs-node-repl ()
    (interactive)
    (inf-clojure "clj -M -m cljs.main -co build.edn -re node -r"))
;(use-package clj-refactor
;  :ensure t
;  :init
;  (cljr-add-keybindings-with-prefix "C-c C-d")
;  :config
;  (clj-refactor-mode t)
;  :hook clojure-mode)
