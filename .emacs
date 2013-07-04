;; set username and title frame
(setq user-mail-address "zhang.t.honglin@gmail.com")
(setq frame-title-format '("" "%b"))

;; initialization configuration
(server-start)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(global-linum-mode t)
(global-hl-line-mode 1)
(show-paren-mode)
(setq-default fill-column 80)
(setq-default auto-fill-mode 1)
(desktop-save-mode 1)
(mouse-avoidance-mode 'animate)
(global-auto-revert-mode t)
(setq-default indent-tabs-mode nil)

;; turn off shell command echo
(defun my-comint-init ()
  (setq comint-process-echoes t))
(add-hook 'shell-mode-hook 'my-comint-init)

;; set the color theme
(when window-system
  (set-frame-parameter (selected-frame) 'alpha '(100 100))
  (add-to-list 'default-frame-alist '(alpha 100 100))
  (add-to-list 'load-path "~/.emacs.d/elpa/color-theme-20080305.834/")
  (require 'color-theme)
  (setq color-theme-is-global t)
  (load "~/.emacs.d/elpa/color-theme-20080305.834/themes/color-theme-molokai.el")
  (color-theme-molokai)
  )

;; set the mouse scroll
(defun smooth-scroll (increment)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.06)
  (scroll-up increment))

;; set ido to help choose files
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; an advanced "ido" to help choose functions
(add-to-list 'load-path "~/.emacs.d/smex")
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; set emacs-git plugin
(add-to-list 'load-path "~/.emacs.d/elpa/magit-20130624.2315/")
(require 'magit)

;; set the auto completion
(add-to-list 'load-path "~/.emacs.d/elpa/popup-20130324.1305/")
(require 'popup)
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20130503.2013/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130503.2013/dict")
(ac-config-default)

;; set highlight indentation
(add-to-list 'load-path "~/.emacs.d/highlight-indentation/")
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#465457")
(set-face-background 'highlight-indentation-current-column-face "#465457")

;; set the indentation to two spaces for java mode
(add-hook 'java-mode-hook (lambda () (setq c-basic-offset 2)))

;; scroll smoothly
(setq scroll-step 1 scroll-conservatively 10000)

;; highlight todos
(defun hilite-todos()
  (highlight-lines-matching-regexp "\\<\\(FIXME\\|WRITEME\\|WRITEME!\\|TODO\\|BUG\\):?" 'hi-red-b)
  )


;; search for google results
(defun google-this ()
  "Googles a query or region if any"
  (interative)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (if mark-active
        (buffer-substring (region-beginning) (region-end))
      (read-string "Google: ")))))
(global-set-key (kbd "C-x g") 'google-this)

;; add haskell mode
(add-to-list 'load-path "~/.emacs.d/elpa/haskell-mode-13.7/")
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "~/.emacs.d/elpa/haskell-mode-13.7/")
(custom-set-variables
 '(haskell-mode-hook '(turn-on-haskell-indent)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["dark gray" "red" "green" "yellow" "deep sky blue" "magenta" "cyan" "white"])
 '(column-number-mode t)
 '(font-use-system-font t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 128 :width normal)))))
