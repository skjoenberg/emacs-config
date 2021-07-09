;; Better buffer selection
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(key-chord-define-global "øø" 'ido-switch-buffer)

;; Magit
(key-chord-define-global "ææ" 'magit-status)

;; set shortcut to kill whole emacs session
(global-set-key (kbd "C-x c") 'save-buffers-kill-emacs)

;; Marking
(global-set-key (kbd "C-SPC") 'set-mark-command)
