; set username and title frame
(setq user-mail-address "zhang.t.honglin@gmail.com")
(setq frame-title-format '("" "%b"))

;; initialization configuration
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(global-linum-mode t)
(global-hl-line-mode 1)
(show-paren-mode)
(setq-default fill-column 80)
(setq-default auto-fill-mode 1)
(mouse-avoidance-mode 'animate)
(global-auto-revert-mode t)
(setq-default indent-tabs-mode nil)

;; scroll smoothly
(setq scroll-step 1 scroll-conservatively 10000)

;; set the indentation to two spaces for java mode
(add-hook 'java-mode-hook (lambda () (setq c-basic-offset 2)))

;; treat cli and ui differently
(when window-system
  ;; (set-frame-parameter (selected-frame) 'alpha '(100 100))
  ;; (add-to-list 'default-frame-alist '(alpha 100 100))
  (server-start)
  (desktop-save-mode 1)
  )

;; include melpa packages
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; turn off shell command echo
(defun my-comint-init ()
  (setq comint-process-echoes t))
(add-hook 'shell-mode-hook 'my-comint-init)

;; set the mouse scroll
(defun smooth-scroll (increment)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.06)
  (scroll-up increment))

;; set the color theme
(load-theme 'monokai t)

;; LaTeX settings
(mapc (lambda (mode)
        (add-hook 'LaTeX-mode-hook mode))
      (list ;'auto-fill-mode
       'LaTeX-math-mode
       'turn-on-reftex))
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-auto-untabify t ; remove all tabs before saving
                  TeX-engine 'default ; ('xetex) | ('default)
                  TeX-show-compilation t) ; display compilation windows
            (TeX-global-PDF-mode t) ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            (setq Tex-source-correlate-mode t)
           ;(define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
            ))
(setq TeX-view-program-list
      '(("evince" "evince %o")))
(setq TeX-view-program-selection
      '((output-pdf "evince")
        (output-dvi "evince")))
(setq TeX-insert-quote t)
(ispell-change-dictionary "american" t)
(setq-default ispell-program-name "aspell")
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

(add-hook 'doc-view-mode-hook 'auto-revert-mode)

;; set ido to help choose files
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; an advanced "ido" to help choose functions
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; ;; set emacs-git plugin
(require 'magit)
(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")

;; set the auto completion
(require 'popup)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/elpa/auto-complete/dict")
(ac-config-default)

;; set highlight indentation
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#465457")
(set-face-background 'highlight-indentation-current-column-face "#465457")
(define-globalized-minor-mode global-highlight-indentation-mode
  highlight-indentation-mode highlight-indentation-mode)
(global-highlight-indentation-mode)

;; highlight weird whitespaces
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; helm, the anything in emacs
(require 'helm-config)

;; set up haskell mode
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t)
  )
(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

;; set up flycheck haskell
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   [
    "dark gray"
    "red" "green"
    "yellow"
    "deep sky blue"
    "magenta"
    "cyan"
    "white"
    ]
   )

 '(column-number-mode t)
 '(font-use-system-font t)
 '(haskell-mode-hook (quote (turn-on-haskell-indent)))
 '(inhibit-startup-screen t)
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (
                :family "Ubuntu Mono"
                        :foundry "unknown"
                        :slant normal
                        :weight normal
                        :height 128
                        :width normal)
               ))
    )
 )
