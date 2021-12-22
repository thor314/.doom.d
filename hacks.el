;;; hacks.el -*- lexical-binding: t; -*-
;;; mah hacky lil frens

(defun tk/prev-end-line ()
  (interactive)
  (forward-line -1)
  (evil-end-of-line))

(defun tk/split-window-horizontally ()
  (interactive)
  (split-window-horizontally)
  (consult-buffer))

(defun insert-date ()
  "Insert the current date. With prefix-argument, use ISO format. With
  two prefix arguments, write out the day and month name."
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun tk/keys () (interactive)
       (shell-command "setxkbmap dvorak -option ctrl:swapcaps"))
(tk/keys)
(defun tk/logout () (interactive)
       (if (y-or-n-p "log out? ")
       (shell-command "pkill -KILL -u $USERNAME")))
(defun tk/append-package! (package)
  "Append a package to my packages.el file"
  (interactive "s")
  (save-excursion
    (with-temp-buffer
      (insert-file-contents "~/.doom.d/packages.el")
      (goto-char (point-max))
      (insert (format "(package! %s)" package))
      (write-file "~/.doom.d/packages.el"))
    (with-temp-buffer
      (insert-file-contents "~/.doom.d/config.el")
      (goto-char (point-max))
      (insert (format "(use-package! %s)" package))
      (write-file "~/.doom.d/config.el"))))
(defun tk/windows ()
  (interactive)
  (org-journal-new-entry 1)
  (org-agenda "a" "a")
  (other-window 1))
(defun tk/nix-config-file ()
  (interactive)
  (doom/sudo-find-file "/etc/nixos/configuration.nix")
  (evil-goto-line 50)
  (recenter))
(defun tk/hacks ()
  (interactive)
  (find-file "~/.doom.d/hacks.el")
  (goto-char (point-max))
  (recenter))
(defun tk/keymaps ()
  (interactive)
  (find-file "~/.doom.d/keymaps.el")
  (goto-char (point-max))
  (recenter))
(defun tk/insert-space-behind (count)
  (interactive "p")
  (save-excursion
    (forward-char (+ 1 (- count)))
    (insert-char #x20)))
(defun tk/insert-space-ahead (count)
  (interactive "p")
  (save-excursion
    (forward-char count)
    (insert-char #x20)))
(defun tk/delete-previous-line (count)
  (interactive "p")
  (save-excursion
    (forward-line (- count))
    (kill-line count)))
(defun tk/delete-next-line (count)
  (interactive "p")
  (save-excursion
    (forward-line)
    (kill-line count)))
(defun tk/insert-space-ahead (count)
  (interactive "p")
  (save-excursion
    (forward-char count)
    (insert-char #x20)))
