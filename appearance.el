;;; appearance.el --- Handles theme and look and feel -*- lexical-binding: t; -*-

;; Author: Og Maciel <og@maciel.com>
;; Maintainer: Og Maciel
;; Created: 2025-04-25
;; Keywords: init, startup
;; URL: https://omaciel.github.io

;;; Commentary:

;; This file defines the look and feel of Emacs.

;;; Code:

(setq catppuccin-flavor 'mocha)
(catppuccin-reload)

(defvar my/current-catppuccin-flavor 'mocha
  "Tracks the current Catppuccin flavor (mocha or latte).")

(defun my/toggle-catppuccin-theme ()
  "Toggle between Catppuccin mocha and latte flavors with a minibuffer message."
  (interactive)
  (setq my/current-catppuccin-flavor
        (if (eq my/current-catppuccin-flavor 'mocha)
            'latte
          'mocha))
  (setq catppuccin-flavor my/current-catppuccin-flavor)
  (catppuccin-reload)
  (message "%s Switched to Catppuccin %s!"
           (if (eq catppuccin-flavor 'mocha) "🌙" "🔆")
           (capitalize (symbol-name catppuccin-flavor))))

(global-set-key (kbd "C-c C-t") #'my/toggle-catppuccin-theme)

;;; appearance.el ends here.