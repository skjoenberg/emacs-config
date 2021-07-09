;(require 'workgroups2)
;(setq wg-prefix-key (kbd "C-c C-q")
;      wg-session-file "~/.emacs.d/.emacs_workgroups"
;      wg-no-confirm-on-destructive-operation t)
;
;(global-set-key (kbd "M-1") 'wg-switch-to-workgroup-at-index-0)
;(global-set-key (kbd "M-2") 'wg-switch-to-workgroup-at-index-1)
;(global-set-key (kbd "M-3") 'wg-switch-to-workgroup-at-index-2)
;(global-set-key (kbd "M-4") 'wg-switch-to-workgroup-at-index-3)
;
;(defun wg-write-file()
;  (wg-write-session-file wg-session-file))
;
;(add-hook 'auto-save-hook 'wg-write-file)
;(add-hook 'kill-emacs-hook 'wg-write-file)
;(add-hook 'after-init-hook 'wg-open-session)
;(workgroups-mode 1)
