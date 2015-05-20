;;; package --- init-lua
(require-package 'lua-mode)

(setq lua-indent-level 4)
(defun my-lua-setup ()
  (setq indent-tabs-mode nil))
(add-hook 'lua-mode-hook 'my-lua-setup)

(provide 'init-lua)
