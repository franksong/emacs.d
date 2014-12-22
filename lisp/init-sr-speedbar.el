(require-package 'sr-speedbar)
(require 'speedbar)

;; (add-hook 'after-init-hook '(lambda () (sr-speedbar-toggle)))
(speedbar-add-supported-extension ".go")

(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 30)
;; (setq speedbar-show-unknown-files t)
(global-set-key (kbd "<f1>") 'sr-speedbar-toggle)

(provide 'init-sr-speedbar)
