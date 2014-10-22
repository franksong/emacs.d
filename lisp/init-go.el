(require-package 'go-mode)
(require-package 'go-autocomplete)
(require-package 'go-eldoc)
(require-package 'gotest)

(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))

(defun my-go-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
    (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe))
(add-hook 'go-mode-hook 'my-go-mode-auto-pair)

(provide 'init-go)
