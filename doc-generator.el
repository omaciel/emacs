(defun my/generate-keybindings-doc ()
  "Generate Markdown documentation for custom Emacs keybindings."
  (interactive)
  (let ((output-file (expand-file-name "documentation.md" user-emacs-directory))
        (files '("key-bindings.el"))
        (bindings '()))
    ;; Scan each file for global-set-key patterns
    (dolist (file files)
      (let ((filepath (expand-file-name file user-emacs-directory)))
        (when (file-exists-p filepath)
          (with-temp-buffer
            (insert-file-contents filepath)
            (goto-char (point-min))
            (while (re-search-forward "(global-set-key (kbd \"\\([^\"]+\\)\") '\\([^)\n]+\\))" nil t)
              (let ((key (match-string 1))
                    (command (match-string 2)))
                (push (list key command file) bindings)))))))
    ;; Now generate the markdown
    (with-temp-file output-file
      (insert "# 📚 Emacs Custom Keybindings\n\n")
      (insert "This document lists **custom Emacs keybindings** found in the user's configuration files.\n\n")
      (insert "| 🔑 Keybinding | 🎬 Command | 📂 Defined in |\n")
      (insert "|:-------------|:-----------|:--------------|\n")
      (dolist (binding (reverse bindings))
        (insert (format "| `%s` | `%s` | `%s` |\n"
                        (nth 0 binding) (nth 1 binding) (nth 2 binding))))
      (insert "\n---\n")
      (insert "_Generated automatically by `my/generate-keybindings-doc`._\n"))))

(defun my/auto-generate-keybindings-doc ()
  "Automatically regenerate keybindings documentation when saving key-bindings.el."
  (when (and buffer-file-name
             (string-equal (file-name-nondirectory buffer-file-name) "key-bindings.el"))
    (message "🔄 Updating keybindings documentation...")
    (my/generate-keybindings-doc)))

;; Attach the hook to after-save
(add-hook 'after-save-hook 'my/auto-generate-keybindings-doc)

;; doc-generator.el ends here
