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

(setenv "PATH" (getenv "PATH"))

;; turn off shell command echo
(defun my-comint-init ()
  (setq comint-process-echoes t))
(add-hook 'shell-mode-hook 'my-comint-init)

;; set the color theme
(add-to-list 'load-path "~/.emacs.d/elpa/color-theme/")
(require 'color-theme)
(setq color-theme-is-global t)
(load "~/.emacs.d/elpa/color-theme/themes/color-theme-molokai.el")
(color-theme-molokai)
(when window-system
  ;; (set-frame-parameter (selected-frame) 'alpha '(100 100))
  ;; (add-to-list 'default-frame-alist '(alpha 100 100))
  (server-start)
  (desktop-save-mode 1)
  )

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
(add-to-list 'load-path "~/.emacs.d/elpa/magit/")
(add-to-list 'load-path "~/.emacs.d/elpa/git-commit-mode-20131124.2132/")
(add-to-list 'load-path "~/.emacs.d/elpa/git-rebase-mode-20131005.1730/")
(require 'magit)

;; set the auto completion
(add-to-list 'load-path "~/.emacs.d/elpa/popup/")
(require 'popup)
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/elpa/auto-complete/dict")
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
  (interactive)
  (highlight-lines-matching-regexp
   "\\<\\(FIXME\\|WRITEME\\|WRITEME!\\|TODO\\|BUG\\):?" 'hi-red-b)
  )

;; add elscreen mode
(add-to-list 'load-path "~/.emacs.d/elpa/elscreen/")
(require 'elscreen)
(elscreen-start)

;; add simple httpd
;; (add-to-list 'load-path "~/.emacs.d/elpa/simple-httpd/")
;; (require 'simple-httpd)
;; (setq httpd-root "/var/www")
;; (httpd-start)

;; add xquery mode
(add-to-list 'load-path "~/.emacs.d/xquery-mode/")
(require 'xquery-mode)

;; add skewer-mode
;; (add-to-list 'load-path "~/.emacs.d/elpa/skewer-mode/")
;; (add-hook 'js2-mode-hook 'skewer-mode)
;; (add-hook 'css-mode-hook 'skewer-css-mode)
;; (add-hook 'html-mode-hook 'skewer-html-mode)

;; add web mode
(add-to-list 'load-path "~/.emacs.d/elpa/web-mode/")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; add js2 mode for javascript
(add-to-list 'load-path "~/.emacs.d/elpa/js2-mode/")
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; add json mode
(add-to-list 'load-path "~/.emacs.d/elpa/json-mode/")
(require 'json-mode)
(defun flymake-jade-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                 'flymake-create-temp-intemp))
     (local-file (file-relative-name
                  temp-file
                  (file-name-directory buffer-file-name)))
     (arglist (list local-file)))
    (list "jade" arglist)))
(setq flymake-err-line-patterns
       (cons '("\\(.*\\): \\(.+\\):\\([[:digit:]]+\\)$"
              2 3 nil 1)
            flymake-err-line-patterns))
(add-to-list 'flymake-allowed-file-name-masks
         '("\\.jade\\'" flymake-jade-init))

;; add jade mode
(add-to-list 'load-path "~/.emacs.d/jade-mode")
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; search for google results
(add-to-list 'load-path "~/.emacs.d/google-this/")
(require 'google-this)
(google-this-mode 1)

;; add haskell mode
(add-to-list 'load-path "~/.emacs.d/elpa/haskell-mode-20131129.1536/")
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list
             "~/.emacs.d/elpa/haskell-mode-20131129.1536/")

;; add melpa package list
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; add octave-mode
(autoload 'octave-mode "octave-mod" nil t)
          (setq auto-mode-alist
                (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook
                    (lambda ()
                      (abbrev-mode 1)
                      (auto-fill-mode 1)
                      (if (eq window-system 'x)
                          (font-lock-mode 1))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector [
                            "dark gray"
                            "red"
                            "green"
                            "yellow"
                            "deep sky blue"
                            "magenta"
                            "cyan"
                            "white"])
 '(column-number-mode t)
 '(font-use-system-font t)
 '(haskell-mode-hook (quote (turn-on-haskell-indent)))
 '(inhibit-startup-screen t)
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

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
                        :width normal)))))
