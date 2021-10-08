;; Transparency
;(set-frame-parameter (selected-frame) 'alpha '(94 85))
;(add-to-list 'default-frame-alist '(alpha 94 85))

;;; ~/.emacs.config/.emacs.ui
;; Custom variables
(custom-set-variables
 '(company-frontends (quote (company-preview-frontend company-echo-frontend))))

;; Enable syntax highlighting
(global-font-lock-mode t)

;; Font: Inconsolate
(set-face-attribute 'default nil :family "Fira Code" :height 180)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8) 

;; Dirtree stuff
(custom-set-variables
 '(tree-widget-image-enable nil))

;; Hl-Line
(global-hl-line-mode)
;(set-face-background 'hl-line "brightcyan")

;; Hideshow
(load-library "hideshow")
(global-set-key (kbd "C-+") 'hs-show-block)
(global-set-key (kbd "C-\-") 'hs-hide-block)
(setq hs-isearch-open 'x)
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'python-mode-hook     'hs-minor-mode)

;; Line numbers
(global-display-line-numbers-mode)

;; Powerline
(use-package powerline
  :ensure t
  :config
  (powerline-vim-theme))

;; Remove scrollbars, menu bars and toolbars
(when (fboundp 'menu-bar-mode) (menu-bar-mode 1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Remove splash
(setq inhibit-startup-message t)

;; Themes
(add-to-list 'custom-theme-load-path "~/.confy/emacs/themes/")
(load-theme 'solarized-light t)

;; For buffers with the same name
(require 'uniquify)

;; Use y and n for questions
(fset 'yes-or-no-p 'y-or-n-p)

(setq visible-bell       nil
      ring-bell-function #'ignore)
