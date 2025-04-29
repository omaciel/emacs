;;; key-packages.el --- Default packages for my Emacs -*- lexical-binding: t; -*-

;; Author: Og Maciel <og@maciel.com>
;; Maintainer: Og Maciel
;; Created: 2025-04-25
;; Keywords: convenience, packages
;; URL: https://omaciel.github.io

;;; Commentary:

;; This file configures my personal Emacs key bindings.
;; It defines default packages to be installed.

;;; Code:

(require 'package)

;; Add MELPA and GNU ELPA to package archives
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-always-ensure t)  ;; Auto-install if not present

(require 'use-package)

;; Now configure your packages

(use-package company
  :ensure t
  :hook ((go-mode . company-mode))
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1))

(use-package counsel-projectile
  :ensure t
  :after (projectile counsel)
  :config
  (counsel-projectile-mode))

(use-package diff-hl
  :ensure t
  :hook ((prog-mode . diff-hl-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :config
  (diff-hl-flydiff-mode) ;; update diffs on the fly
  (diff-hl-margin-mode)) ;; fallback for terminal mode

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; go install golang.org/x/tools/gopls@latest
;; go install golang.org/x/tools/cmd/goimports@latest
(use-package go-mode
  :ensure t
  :hook ((go-mode . lsp-deferred)
         (go-mode . gofmt-before-save))
  :config
  (setq gofmt-command "goimports")) ;; auto-format with goimports

(use-package go-tag
  :ensure t
  :after go-mode
  :bind (:map go-mode-map
              ("C-c t a" . go-tag-add)
              ("C-c t r" . go-tag-remove)))

(use-package lsp-mode
  :ensure t
  :commands lsp lsp-deferred
  :hook ((go-mode . lsp-deferred))
  :init
  (setq lsp-keymap-prefix "C-c l") ;; or your preferred prefix
  :config
  (setq lsp-auto-guess-root t
        lsp-enable-snippet nil      ;; disable snippet completion
        lsp-prefer-flymake nil))    ;; use flycheck instead

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point
        lsp-ui-sideline-enable t))

(use-package magit)

;; Markdown files
(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode)
  :init (setq markdown-command "pandoc"))

(use-package multiple-cursors
  :ensure t)

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (setq projectile-project-search-path '("~/go/src/")) ;; Optional, your workspace
  (setq projectile-completion-system 'default)
  (setq projectile-track-known-projects-automatically t))

;; Make sure vterm is available
;; brew install cmake libtool
(use-package vterm
  :ensure t)


(use-package which-key
  :ensure t
  :config (which-key-mode))

;; Enable windmove using Shift + Arrows
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Themes
(use-package catppuccin-theme)
(use-package solarized-theme)


;;; packages.el ends here
