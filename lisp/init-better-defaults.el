(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

(global-linum-mode t)
(add-hook 'prog-mode-hook 'linum-mode)
;;(delete-selection-mode t)

(setq make-backup-files nil)

(setq auto-save-default nil)

(require 'recentf)
(recentf-mode 1)			
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; less typing when Emacs ask you yes or n
(fset 'yes-or-no-p 'y-or-n-p)
;; always delete and copy recursively
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)
(setq dired-dwim-target t)

(provide 'init-better-defaults)

