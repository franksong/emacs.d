;;; c/c++ configure

;;; auto-complete is defined

;;; yasnippet
(require-package 'yasnippet)

(require 'yasnippet)
(yas-global-mode 1)

;;; auto-complete-c-headers
(require-package 'auto-complete-c-headers)

(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1")
  (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/6.0/include")
  (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include"))

(add-hook 'c-mode-hook 'my:ac-c-header-init)
(add-hook 'c++-mode-hook 'my:ac-c-header-init)

;;; iedit
(require-package 'iedit)
;; Fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;;; flymake-google-cpplint
;; start flymake-google-cpplint-load
(require-package 'flymake-google-cpplint)
;; let's define a function for flymake initialization
(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
  (flymake-google-cpplint-load))

(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

;;; flymake-cursor
(require-package 'flymake-cursor)

;;; google-c-style
(require-package 'google-c-style)
;; start google-c-style with emacs
(require 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)

;;; cedet
;; turn on Semantic
(semantic-mode 1)
;; let's define a function which adds semantic as a suggestion backend to auto complete
;; and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete ()
  (add-to-list 'ac-sources 'ac-source-semantic))

(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;; turn on ede mode
(global-ede-mode 1)


;;; c-mode tab-width
(defun my:tab-width-config ()
  (setq c-basic-offset 4))
(add-hook 'c-mode-common-hook 'my:tab-width-config)

(provide 'init-c-mode)
