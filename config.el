;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Remember, you do not need to run 'doom sync' after modifying this file!
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys

(setq user-full-name "Thor Kamphefner"
      user-mail-address "thorck@protonmail.com")
(defvar tk/test 0) ; used for testing whether something worked
;; GNOME intercepts M-SPC so change this
(setq doom-leader-alt-key "C-'"
      doom-localleader-alt-key "C-' m")
(setq doom-variable-pitch-font (font-spec :family "Cantarell" :size 14 :weight 'regular))
(setq doom-big-font (font-spec :family "Fira Code" :size 16))
(setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'regular))
(setq doom-theme 'doom-sourcerer)
(setq doom-modeline-enable-word-count t)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(defvar tk/frame-transparency '(90 . 90))
(set-frame-parameter nil 'alpha tk/frame-transparency)
(line-number-mode 0) ; clutter mode line
(column-number-mode 0)
(global-auto-revert-mode 1) ; revert buffers when file changes on disk; convenient.
(setq global-auto-revert-non-file-buffers t
  auto-revert-verbose nil)
(global-visual-line-mode) ; wrap long lines
;; (setq tab-width 2)

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

(defun tk/org-setup-tags ()
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
       ("MISC" . ?z))))

(add-hook! org-mode
  (variable-pitch-mode 1)
  (tk/org-setup-tags)
  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60))
;;(load! "org_templates.el")

(setq which-key-idle-delay .25)
(super-save-mode 1)
(setq super-save-auto-save-when-idle t
      super-save-idle-duration 5
      auto-save-default nil)

(use-package! tide :after web-mode-hook)
(add-hook! 'before-save-hook 'tide-format-before-save)
(add-hook! 'typescript-mode-hook 'tide-setup)

(undefine-key! minibuffer-local-map "C-v" "C-j")
(map! :map 'minibuffer-local-map
      :v "C-v" #'evil-scroll-page-down
      :v "C-j" #'evil-scroll-page-down)

(undefine-key! 'evil-insert-state-map "C-d")
(map! :map 'evil-insert-state-map
      :i "C-d" #'evil-delete-char)
