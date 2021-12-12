;;; programming.el -*- lexical-binding: t; -*-

(setq org-directory "~/org/"
      org-agenda-files '("~/org/agenda/")
      org-log-into-drawer t
      org-agenda-start-with-log-mode t
      org-agenda-skip-deadline-if-done t
      org-agenda-restore-windows-after-quit t
      org-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled
      org-agenda-todo-ignore-deadlines 'far
      org-journal-enable-agenda-integration t
      org-journal-dir "~/org/journal"
      org-journal-file-format "%Y%m%d.org")

(setq org-agenda-custom-commands ; options - todo, tags, tags-todo
      '(
        ;;("y" agenda;;) ;; appointments: todo
        ("c" "Crypto" tags-todo "CRYPTO")
        ("e" "Emacs" tags-todo "EMACS")
        ;; ex multi letter
        ;;("g" . "HOME+Name tags searches")
        ;;("gl" tags "+home+HABIT")
        ;;("gp" tags "+home+EMACS")
        ("h" "Habit" tags-todo "HABIT")
        ("l" "Linux" tags-todo "LINUX")
        ("m" "Math" tags-todo "MATH")
        ("r" "Rust" tags-todo "RUST")
        ("p" "Personal" tags-todo "PERS")
        ("w" "Write" tags-todo "WRITE")
        ("z" "Misc" tags-todo "MISC")
        ;; demo of more powerful agenda template
        ;; ("d" "Dashboard"
        ;;   ;; bug: ==== bit is 5 chars too long for my screen
        ;;   ((agenda "" ((org-deadline-warning-days 7)))
        ;;     (todo "NEXT"
        ;;       ((org-agenda-overriding-header "Next Tasks")))
        ;;     (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))
        ))

(setq org-roam-directory "~/org/roam"
      org-roam-capture--file-name-default "<%Y-%m%-%d>-${slug}")

(setq org-tag-alist
      '((:startgroup)
        ;; Put mutually exclusive tags here
        (:endgroup)
        ("CRYPTO" . ?c)
        ("EMACS" . ?e)
        ("HABIT" . ?h)
        ("LINUX" . ?l)
        ("MATH" . ?m)
        ("NOTE" . ?n)
        ("PERS" . ?p)
        ("RUST" . ?r)
        ("WRITE" . ?w)
        ("MISC" . ?z)))

(add-hook! org-mode
  (variable-pitch-mode 1)
  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60))
