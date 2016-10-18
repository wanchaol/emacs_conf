(require 'cl)
(when (>= emacs-major-version 24)
    (require 'package)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
    )

;;add whatever packages you want here
(defvar wanchaol/packages '(
				   company
				   monokai-theme
				   hungry-delete
				   swiper
				   counsel
				   smartparens
				   js2-mode
				   nodejs-repl
				   exec-path-from-shell
				   popwin
				   
				   )  "Default packages")

(setq package-selected-packages wanchaol/packages)

(defun wanchaol/packages-installed-p ()
    (loop for pkg in wanchaol/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))

(unless (wanchaol/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg wanchaol/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))

;; let emacs could find the execuable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(require 'hungry-delete)
(global-hungry-delete-mode)

;; no need to require since the function def is auto load
(smartparens-global-mode t)


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; config js2-mode for js files
(setq auto-mode-alist
	  (append
	   '(("\\.js\\'" . js2-mode))
	   auto-mode-alist))

(global-company-mode t)
(load-theme 'monokai t)
(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
