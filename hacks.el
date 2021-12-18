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

(defun insert-date (prefix)
  "Insert the current date. With prefix-argument, use ISO format. With
  two prefix arguments, write out the day and month name."
  (interactive "p")
  (let ((format
          (cond
            ((not prefix) "%Y-%m-%d")
            ((equal prefix '(4)) "%A, %d %B %Y")))
         (system-time-locale "us_US"))
    (insert (format-time-string format))))

(defun tk/keys () (interactive)
       (shell-command "setxkbmap dvorak -option ctrl:swapcaps"))
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
