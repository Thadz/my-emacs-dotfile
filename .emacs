(setq user-mail-address "xxx@gmail.com")
(setq user-website "xxx")
(setq frame-title-format '("" "%b"))

(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)
(global-linum-mode t)
(global-hl-line-mode t)
(setq scroll-error-top-bottom t)

(when window-system
					;(speedbar t) ; start speedbar if we're using a window system
  (set-frame-parameter (selected-frame) 'alpha '(100 100))
  (add-to-list 'default-frame-alist '(alpha 100 100))
  (add-to-list 'load-path "~/.emacs.d/color-theme/")
  (load "~/.emacs.d/color-theme/themes/color-theme-molokai.el")
  (require 'color-theme)
  (color-theme-initialize)
					;(color-theme-robin-hood)
  (color-theme-molokai))

(load "~/.emacs.d/ace/ace.el")
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(add-to-list 'load-path "~/.emacs.d/cedet-1.1/common")
(autoload 'cedet "~/.emacs.d/cedet-1.1/common/cedet.el")
(require 'cedet)
(add-to-list 'load-path "~/.emacs.d/jdee-2.4.0.1/lisp")
(require 'jde)
(add-to-list 'auto-mode-alist '("\\.java$" . jde-mode))
(defun screen-width nil -1)
(define-obsolete-function-alias 'make-local-hook 'ignore "21.1")

(add-to-list 'load-path "~/.emacs.d/smex")
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete)
(global-auto-complete-mode 1)

(add-to-list 'load-path "~/.emacs.d/o-blog")
(require 'o-blog)

(add-to-list 'load-path "~/.emacs.d")
(require 'htmlize)

(add-to-list 'load-path "~/.emacs.d/magit-master")
(require 'magit)

(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0")
(autoload 'yasnippet "yasnippet")
					;(yas--initialize)
					;(yas/load-directory "~/.emacs.d/elpa/yasnippet-0.8.0/snippets")

(add-to-list 'load-path "~/.emacs.d/ecb-2.40")
(require 'ecb)
(setq ecb-tip-of-the-day nil)
					;(setq stack-trace-on-error t)
(mapc (lambda (mode)
	(add-hook 'LaTeX-mode-hook mode))
      (list ;'auto-fill-mode
	    'LaTeX-math-mode
	    'turn-on-reftex
	    'linum-mode))
(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (setq TeX-auto-untabify t ; remove all tabs before saving
		  TeX-engine 'default ; (xetex) use xelatex default
		  TeX-show-compilation t) ; display compilation windows
	    (TeX-global-PDF-mode t) ; PDF mode enable, not plain
	    (setq TeX-save-query nil)
	    (imenu-add-menubar-index)
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

(defun smooth-scroll (increment)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.06)
  (scroll-up increment))

(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

(global-set-key [(mouse-5)] '(lambda () (interactive) (smooth-scroll 1)))
(global-set-key [(mouse-4)] '(lambda () (interactive) (smooth-scroll -1)))

					;(split-window-vertically) 
					;(split-window-horizontally)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(doc-view-continuous t)
 '(ecb-options-version "2.40")
 '(inhibit-startup-screen t)
 '(jde-enable-abbrev-mode t)
 '(jde-javadoc-describe-method-template "\"* \" (jde-javadoc-code name)")
 '(jde-jdk (quote ("1.6.0")))
 '(jde-jdk-registry (quote (("1.6.0" . "/usr/local/jdk1.7.0_09"))))
 '(jde-junit-working-directory "/usr/local/jdk1.7.0_09/")
 '(jde-sourcepath (quote ("~/workspace")))
 '(show-paren-mode t)
 '(tempo-interactive t)
 '(text-mode-hook (quote (text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(yas-snippet-dirs (quote ("/home/zhang/.emacs.d/elpa/yasnippet-0.8.0/snippets")) nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Mensch" :foundry "bitstream" :slant normal :weight normal :height 113 :width normal)))))

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;;(define-key global-map "\C-cl" 'org-store-link)
;;(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; (add-to-list 'load-path "~/.emacs.d/flymake-cursor")
;; (require 'flymake-cursor)
;; (add-hook 'find-file-hooks 'flymake-find-file-hook)
;; (custom-set-variables
;;      '(help-at-pt-timer-delay 0.9)
;;      '(help-at-pt-display-when-idle '(flymake-overlay)))
;; (define-key global-map "\C-c\C-f" 'flymake-goto-next-error)

(add-to-list 'load-path "~/.emacs.d/clojure-mode/")
(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

(add-to-list
 'auto-mode-alist
 '("\\.m$" . octave-mode))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(desktop-save-mode 1)

(mouse-avoidance-mode 'animate)

(global-auto-revert-mode t)

;; (setq scroll-margin 3
;;       scroll-conservatively 10000)
