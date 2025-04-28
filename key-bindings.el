;;; key-bindings.el --- Key bindings for my Emacs -*- lexical-binding: t; -*-

;; Author: Og Maciel <og@maciel.com>
;; Maintainer: Og Maciel
;; Created: 2025-04-25
;; Keywords: convenience, keybindings
;; URL: https://omaciel.github.io

;;; Commentary:

;; This file configures my personal Emacs key bindings.
;; It defines custom shortcuts to improve productivity.

;;; Code:

;; Navigating through code changes
(global-set-key (kbd "C-x n") 'diff-hl-next-hunk)
(global-set-key (kbd "C-x p") 'diff-hl-previous-hunk)
(global-set-key (kbd "C-x r") 'diff-hl-revert-hunk)

;; diff-hl
(global-set-key (kbd "C-x n") 'diff-hl-next-hunk)
(global-set-key (kbd "C-x p") 'diff-hl-previous-hunk)
(global-set-key (kbd "C-x r") 'diff-hl-revert-hunk)


;; Using Multiple Cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines) ;; edit multiple lines
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Top and bottom of buffer
(global-set-key (kbd "C-c g") 'beginning-of-buffer)
(global-set-key (kbd "C-c G") 'end-of-buffer)

;; Make resizing windows easy using Control + Arrow keys
(global-set-key (kbd "C-S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-S-<down>") 'shrink-window)
(global-set-key (kbd "C-S-<up>") 'enlarge-window)

;; vterm
;; Create a custom function to pop vterm at the bottom
(defun my/vterm-toggle ()
  "Toggle a vterm window at the bottom of the frame."
  (interactive)
  (let ((buffer (get-buffer "*vterm*")))
    (if buffer
        ;; If vterm already exists, jump to it
        (if (get-buffer-window buffer)
            (delete-window (get-buffer-window buffer))
          (progn
            (split-window-below)
            (other-window 1)
            (switch-to-buffer buffer)))
      ;; Else, create a new vterm
      (progn
        (split-window-below)
        (other-window 1)
        (vterm)))))

;; Bind it to C-c t
(global-set-key (kbd "C-c t") #'my/vterm-toggle)

;; Zoom mode
(global-set-key (kbd "C-c +") 'text-scale-increase)
(global-set-key (kbd "C-c -") 'text-scale-decrease)

;;; key-bindings.el ends here
