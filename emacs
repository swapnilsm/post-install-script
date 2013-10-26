;;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode nil)

(require 'compile)

(global-font-lock-mode 1)

(setq inhibit-startup-message t)

(show-paren-mode 1)

(setq transient-mark-mode t)

(add-to-list 'load-path "~/.emacs.d")

;;; diff to unified format
(setq diff-switches "-u")

(defalias 'iwb 'iwb)

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))


;; hide menu bar
(menu-bar-mode nil)

(column-number-mode t)

(defalias 'cb 'comment-box)
(defalias 'cr 'comment-region)
(defalias 'ur 'uncomment-region)