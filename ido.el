;; Interactively Do Things
(use-package ido
  :init
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-case-fold nil
        ido-auto-merge-work-directories-length -1
        ido-create-new-buffer 'always
        ido-use-filename-at-point nil
        ido-max-prospects 10
        ido-use-faces nil)
  :config (ido-mode t))

;; Try out flx-ido for better flex matching between words
;; ;; disable ido faces to see flx highlights.
; (defun sd/ido-define-keys () ;; C-n/p is more intuitive in vertical layout
;   (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
;   (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
;   (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
;   (define-key ido-completion-map (kbd "<up>") 'ido-prev-match))

(use-package dash
  :ensure t)

(defun my/ido-go-straight-home ()
  (interactive)
  (cond
    ((looking-back "~/") (insert "projects/"))
    ((looking-back "/") (insert "~/"))
    (:else (call-interactively 'self-insert-command))))

(defun my/setup-ido ()
;; Go straight home
  (define-key ido-file-completion-map (kbd "~") 'my/ido-go-straight-home)
  (define-key ido-file-completion-map (kbd "C-~") 'my/ido-go-straight-home)
;; Use C-w to go back up a dir to better match normal usage of C-w
;; - insert current file name with C-x C-w instead.
  (define-key ido-file-completion-map (kbd "C-w") 'ido-delete-backward-updir)
  (define-key ido-file-completion-map (kbd "C-b") 'ido-delete-backward-updir)
  (define-key ido-file-completion-map (kbd "C-f") 'ido-next-match-dir)
  (define-key ido-file-completion-map (kbd "C-x C-w") 'ido-copy-current-file-name)
  (define-key ido-file-dir-completion-map (kbd "C-w") 'ido-delete-backward-updir)
  (define-key ido-file-dir-completion-map (kbd "C-x C-w") 'ido-copy-current-file-name))
(add-hook 'ido-setup-hook 'my/setup-ido)
;; Always rescan buffer for imenu
(set-default 'imenu-auto-rescan t)
(add-to-list 'ido-ignore-directories "target")
(add-to-list 'ido-ignore-directories "node_modules")
;; Ido at point (C-,)
;(require 'ido-at-point)
;(ido-at-point-mode)
;; Use ido everywhere
;(require 'ido-ubiquitous)
;(ido-ubiquitous-mode 1)

;; Fix ido-ubiquitous for newer packages
(defmacro ido-ubiquitous-use-new-completing-read (cmd package)
`(eval-after-load ,package
'(defadvice ,cmd (around ido-ubiquitous-new activate)
(let ((ido-ubiquitous-enable-compatibility nil))
ad-do-it))))
(ido-ubiquitous-use-new-completing-read webjump 'webjump)
(ido-ubiquitous-use-new-completing-read yas-expand 'yasnippet)
(ido-ubiquitous-use-new-completing-read yas-visit-snippet-file 'yasnippet)
(provide 'setup-ido)

(defvar ido-enable-replace-completing-read t
  "If t, use ido-completing-read instead of completing-read if possible.

    Set it to nil using let in around-advice for functions where the
    original completing-read is required.  For example, if a function
    foo absolutely must use the original completing-read, define some
    advice like this:

    (defadvice foo (around original-completing-read-only activate)
      (let (ido-enable-replace-completing-read) ad-do-it))")

;; ;; Replace completing-read wherever possible, unless directed otherwise
;; (defadvice completing-read
;;     (around use-ido-when-possible activate)
;;   (if (or (not ido-enable-replace-completing-read) Manual override disable ido
;;           (and (boundp 'ido-cur-list)
;;                ido-cur-list)) Avoid infinite loop from ido calling this
;;       ad-do-it
;;       (let ((allcomp (all-completions "" collection predicate)))
;;         (if allcomp
;;             (setq ad-return-value
;;                   (ido-completing-read prompt
;;                                        allcomp
;;                                        nil require-match initial-input hist def))
;;             ad-do-it))))

(use-package ido-completing-read+
  :ensure t)

;; Smex
(use-package amx
  :ensure t
  :config
  (amx-mode))
