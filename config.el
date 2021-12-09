;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Thor Kamphefner"
      user-mail-address "thorck@protonmail.com")

;; GNOME intercepts M-SPC so change this
(setq doom-leader-alt-key "C-SPC"
      doom-localleader-alt-key "C-SPC m")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-palenight)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; (setq tab-width 2)
(line-number-mode 0) ; clutter mode line
(column-number-mode 0)
(global-auto-revert-mode 1) ; revert buffers when file changes on disk; convenient.
(setq global-auto-revert-non-file-buffers t
  auto-revert-verbose nil)
(global-visual-line-mode) ; wrap long lines
(defvar tk/frame-transparency '(95 . 95))
(set-frame-parameter nil 'alpha tk/frame-transparency)

;;;;;;;;;
;; Org ;;
;;;;;;;;;
(setq org-directory "~/org/")
(setq org-agenda-files '("~/org/agenda/")
      org-log-into-drawer t
      org-agenda-start-with-log-mode t
      org-agenda-start-on-weekday t
      org-agenda-loop-over-headlines-in-active-region t
      org-agenda-skip-deadline-if-done t
      org-agenda-restore-windows-after-quit t
      org-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled
      org-agenda-todo-ignore-deadlines 'far
      org-journal-enable-agenda-integration t)
(setq org-journal-dir "~/org/journal"
  org-journal-file-format "%Y%m%d.org")

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

(add-hook! org
  (variable-pitch-mode 1)
  (tk/org-setup-tags)
  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60))


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
