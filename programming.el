;;; programming.el --- Configuration for programming tasks -*- lexical-binding: t; -*-

;; Author: Og Maciel <og@maciel.com>
;; Maintainer: Og Maciel
;; Created: 2025-04-25
;; Keywords: init, startup
;; URL: https://omaciel.github.io

;;; Commentary:

;; This contains configurations specific to software development.

;;; Code:

;; Enable line numbers in all programming modes
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Company mode
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

;; Go - lsp-mode
;; Set up before-save hooks to format buffer and add/delete imports.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Start LSP Mode
(add-hook 'go-mode-hook #'lsp-deferred)

;; Disable backup files
(setq make-backup-files nil)

;;; programming.el ends here.