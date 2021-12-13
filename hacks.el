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

;; (insert-date 4)
