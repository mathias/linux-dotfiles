(setq inhibit-startup-message t)
(tool-bar-mode -1)

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/")
	     '("melpa" . "https://melpa.org/packages"))
;(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

;; Always try to install packages (rather than having to pass :ensure t to every package:
(setq use-package-always-ensure t)

(require 'bind-key)

;; Packages:

(use-package counsel)

(use-package elixir-mode :defer t)

(use-package elm-mode :defer t)

(use-package git-link :defer t)

(use-package keyfreq
  :defer nil
  :config
  (progn
    (if (not (fboundp 'reduce))
	(defalias 'reduce 'cl-reduce))
    (keyfreq-mode 1)
    (keyfreq-autosave-mode 1)))

(use-package magit
  :defer nil)

(use-package markdown-mode
  :mode ("\\.md\\'" . markdown-mode)
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))
  :config
  (progn
    (visual-line-mode t)
    (flyspell-mode t)))

;; highlight matching parentheses
;; (use-package mic-paren
;;   :config
;;   (progn
;;     (setq paren-highlight-offscreen t)
;;     (setq paren-match-face 'highlight)
;;     (paren-activate)))
(use-package paren
  :config (progn
	    (setq show-paren-delay 0)
	    (show-paren-mode)))

(use-package paredit
  :defer t
  :init
  (progn
    (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
    (add-hook 'clojure-mode-hook          #'enable-paredit-mode)
    (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
    (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
    (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
    (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
    (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
    (add-hook 'scheme-mode-hook           #'enable-paredit-mode))
  :bind (:map paredit-mode-map
	      ("M-)" . paredit-forward-slurp-sexp)
	      ("M-(" . paredit-wrap-round)))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package smex
  :defer t
  :config
  (progn
    ;; Can be omitted. This might cause a (minimal) delay when Smex is auto-initialized on its first run:
    (smex-initialize)

    ;; remap M-x
    (global-set-key (kbd "M-x") 'smex)
    (global-set-key (kbd "M-X") 'smex-major-mode-commands)
    ;; This is your old M-x.
    (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)))

;; (use-package swiper
;;   :bind (("C-s" . swiper)
;; 	 ("C-r" . swiper)
;; 	 ("C-c C-r" . ivy-resume)
;; 	 ("M-x" . counsel-M-x)
;; 	 ("C-x C-f" . counsel-find-file)
;; 	 ("C-c k" . counsel-ag))
;;   :config
;;   (progn
;;     (ivy-mode 1)
;;     (setq ivy-use-virtual-buffers t)
;;     (setq enable-recursive-minibuffers t)
;;     (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)))

(use-package which-key
  :config
  (which-key-mode))

;; do the right thing to kill with C-w when no active region:
(use-package whole-line-or-region
  :config (progn   (whole-line-or-region-mode)))

(use-package writegood-mode
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . writegood-mode))
    (add-to-list 'auto-mode-alist '("\\.md\\'" . writegood-mode))
    (add-to-list 'auto-mode-alist '("\\.txt\\'" . writegood-mode)))
  :bind (("C-c g" . writegood-mode)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(wombat))
 '(package-selected-packages
   '(ivy whole-line-or-region mic-paren which-key rainbow-delimiters keyfreq counsel use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
