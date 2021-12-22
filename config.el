;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
(setq user-full-name "Thor Kamphefner"
      user-mail-address "thorck@protonmail.com")

(if (member "Cantarell" (font-family-list))
    (setq doom-variable-pitch-font (font-spec :family "Cantarell" :size 14 :weight 'regular))
     (setq doom-variable-pitch-font (font-spec :family "Sans" :size 14 :weight 'regular)))
(if (member "Fira Code" (font-family-list))
    (progn
      (setq doom-font (font-spec :family "Fira Code" :size 13 :weight 'regular))
      (setq doom-big-font (font-spec :family "Fira Code" :size 16)))
  (setq doom-font (font-spec :family "DejaVu Sans Mono" :size 14 :weight 'regular)))
;; outrun-electric, sourcerer, and rouge, laserwave, spacegrey, moonlight are faves
(setq doom-theme 'doom-outrun-electric)

;; GNOME intercepts M-SPC so change this
(setq doom-leader-alt-key "C-'"
      doom-localleader-alt-key "C-' m")

(setq doom-modeline-enable-word-count t)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(defvar tk/frame-transparency '(93 . 80))
;;(set-frame-parameter frame 'alpha tk/frame-transparency)
(defun tk/transparency ()
  (interactive)
  (dolist (frame (frame-list))
    (set-frame-parameter frame 'alpha tk/frame-transparency)))
(tk/transparency)
(advice-add 'make-frame :after #'tk/transparency)

(setq ispell-personal-dictionary "~/.doom.d/.config/pws")
(setq abbrev-file-name "~/.doom.d/.config/abbrev_defs.el")
(setq +snippets-dir "~/.doom.d/.config/snippets")

(line-number-mode 0) ; clutter mode line
(column-number-mode 0)
(global-auto-revert-mode 1) ; revert buffers when file changes on disk; convenient.
(display-time-mode 1)
(setq display-time-load-average-threshold .80) ;; don't show unless system load is high
(global-diff-hl-mode)
  (setq abbrev-file-name
        "~/.emacs.d/.local/etc/.abbrev_defs.el")
(setq-default abbrev-mode t)
(setq global-auto-revert-non-file-buffers t
  auto-revert-verbose nil)
(global-visual-line-mode) ; wrap long lines
;; (setq tab-width 2)
(setq which-key-idle-delay .25)
(super-save-mode 1)
(setq super-save-auto-save-when-idle t
      super-save-idle-duration 10
      auto-save-default nil)
(setq super-save-hook-triggers (append super-save-hook-triggers '(doom-switch-window-hook)))
;; (setq warning-suppress-types '(yasnippet backquote-change))
(use-package telega
  :commands (telega))

;; 2021-12-22 not able to get company completes in popup buffer
;; (add-to-list 'company-backends 'company-nixos-options)
;; (add-hook! 'nix-mode-hook #'company-mode)

(setq telega-user-use-avatars nil
  telega-use-tracking-for '(any pin unread)
  telega-emoji-use-images t
  ;;telega-completing-read-function #'ivy-completing-read
  ;;telega-msg-rainbow-title nil
  telega-chat-fill-column 75)
(setq company-idle-delay .5)
(load! "hacks.el")
(load! "org.el")
(load! "programming.el")
(load! "keymaps.el")
(load! "org_templates.el")

(use-package! stumpwm-mode :defer-incrementally t)
