;;; init.el --- My Emacs "start up" script -*- lexical-binding: t; -*-

;; Author: Og Maciel <og@maciel.com>
;; Maintainer: Og Maciel
;; Created: 2025-04-25
;; Keywords: init, startup
;; URL: https://omaciel.github.io

;;; Commentary:

;; This file bootstraps Emacs by initializing package management,
;; setting up the user interface, programming environment, and
;; loading modular configuration files.

;; It defines default font settings, installs key packages like
;; lsp-mode, company, projectile, and customizes keybindings.

;; This file assumes Emacs 28 or later.

;;; Code:

;; System
(if (eq system-type
        'darwin)
    (add-to-list 'exec-path
                 "/usr/local/bin"))

;; Startup
(setq initial-buffer-choice t)
(setq initial-scratch-message "")

;; Interface
(setq frame-title-format "%b - Carpe Diem")
(setq visible-bell t)

;; 🛠️ Quality-of-life improvements
(setq kill-whole-line t)
(prefer-coding-system 'utf-8-unix)
(setq inhibit-eol-conversion t)
(global-auto-revert-mode 1)

;; Minimal UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)

;; Set font for both GUI and Terminal Emacs on macOS
(defvar my/default-font "Menlo")
(defvar my/default-font-size 140) ;; 140 = 14pt

(defun my/set-default-font ()
  "Default font for my Emacs."
  (set-face-attribute 'default nil
                      :family my/default-font
                      :height my/default-font-size))

(if (daemonp)
    ;; For emacs --daemon + emacsclient
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (my/set-default-font))))
  ;; Normal GUI or terminal Emacs
  (my/set-default-font))


;; Text editing
(column-number-mode)
(electric-pair-mode)
(show-paren-mode)
(global-hl-line-mode -1)
(setq-default indent-tabs-mode nil)
(set-default 'cursor-type 'hbar)

(defvar my/config-dir (file-name-directory (or load-file-name buffer-file-name))
  "The root directory of the Emacs configuration.")

;; Install packages
(load (expand-file-name "packages.el" my/config-dir))
;; Coding configurations
(load (expand-file-name "programming.el" my/config-dir))
;; Look and Feel
(load (expand-file-name "appearance.el" my/config-dir))
;; Keybindings
(load (expand-file-name "key-bindings.el" my/config-dir))

;; Always set customizations into a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;;; init.el ends here.
