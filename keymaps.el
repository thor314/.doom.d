;;; keymaps.el -*- lexical-binding: t; -*-
;;; Philosophy:
;;; C-<key> should be used for commonly used commands, across all modes
;;; C-S-<key> and M-<key> should do similar actions
;;; Generally prefer leader keybinds when not in editing-mode
;;; Notes on setting up keybinds: keybinding is tricky. Workflow:
;;; - 1. Enter desired mode, query the variable evil-state
;;; - 2. Try setting up the map. Note to use `:mode' for major-modes
;;;   and `:map' for minor-modes.
;;; - 3. `gr' that line, or `SPC m e e'.  `doom/reload'. If the keymap
;;;   is not as expected:
;;;   It is likely being overwritten by some feature. Try to determine
;;;   the feature, and add :after `feature' to the map. Restart Emacs.
;;; - 4. If that fails, determine what map is setting the key and use
;;;   the `undefine-key' macro to unset the key.
;;; - 5. If all else fails, try restarting. I haven't yet figured out
;;;   how to remap keys that have been "remapped", eg "p" and "u" in
;;;   `helpful-mode'. My work around was to just choose another key.

(undefine-key! minibuffer-local-map "C-v" "C-j")
(map! :map minibuffer-local-map
      :m "C-v" #'evil-scroll-page-down
      :m "C-j" #'evil-scroll-page-down)

(map! :mode helpful-mode ;;:after evil-normal
 :m "n" #'evil-scroll-page-down
 :m "-" #'evil-scroll-page-up
 :m "C-v" #'evil-scroll-page-down
 :m "C-j" #'evil-scroll-page-down)

(undefine-key! evil-insert-state-map "C-d" "C-t" "C-T" "C-." "C-p" "C-P" "M-p" "C-n")
(map!
 :i "C-p" #'evil-previous-line
 :i "C-n" #'evil-next-line
 :i "C-v" #'evil-paste-after
 :i "M-v" #'evil-paste-pop
 :i "C-t" #'transpose-chars
 :i "C-T" #'transpose-sexps
 :i "C-d" #'evil-delete-char)

;; evil will screw with ya, we must screw back
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)
(map! :after evil
      :desc "insert space" :nm "[ SPC" #'tk/insert-space-behind
      :nm "] SPC" #'tk/insert-space-ahead
      :nm "] d" #'tk/delete-next-line
      :nm "[ d" #'tk/delete-previous-line
      :nim "C-e" #'doom/forward-to-last-non-comment-or-eol
      :nm "u" #'evil-undo
      :nm "U" #'evil-redo ;; unbound, make it useful
      :nim "C-u" #'evil-undo ;; insert mode should have a natural undo
      :nim "C-M-u" #'evil-redo
      ;; C-i and M-i: insert stuff? not sure yet what better, but this is lame
      ;; :nm "H" #'
      ;; :nm "L" #'
      :nim "C-n" #'evil-next-line ; pop paste is silly here
      :nim "M-n" #'next-error ; trying these two out; moved insert paste to C/M-v
      :nim "M-p" #'previous-error
      :nim "C-s" #'+default/search-buffer ;; trying this out, may replace with avy
      :nm "_" #'tk/prev-end-line
      :nm "0" #'evil-next-line-1-first-non-blank
      :nom "s" #'evil-avy-goto-char
      :nom "S" #'evil-avy-goto-word-1
      ;;:nom "." )#'
      ;; :nom ">" #'
      ;; :nom "<" #'
      :n "t" #'transpose-chars
      :n "T" #'transpose-sexps
      :nim "C-t" #'transpose-chars
      :n "w" #'evil-window-next
      :n "W" #'+evil/next-frame
      :inom "C-w" #'tk/split-window-horizontally
      :inom "C-S-w" #'delete-other-windows)

(map! :leader
      "e" #'eshell
      "E" #'project-eshell
      "q C-l" #'tk/logout
      "0 0" #'tk/aoeu
      "0 8" #'tk/caps_arghh
      "0 9" #'tk/asdf
      (:prefix "f"
       :desc "Get NixOS conf" "n" #'tk/nix-config-file)
      (:prefix "h"
       (:prefix "d"
        "k" #'tk/keymaps)
        "h" #'tk/hacks)
      (:prefix "i"
       :desc "Insert Date"      "d" #'insert-date))

(map! :map rustic-mode-map
      :localleader
      (:prefix ("b" . "build")
       :desc "cargo add"      "a" #'+rust/cargo-add
       :desc "cargo audit"   "A" #'+rust/cargo-audit))

(map! :leader
      (:prefix "h"
       (:prefix "d"
        :desc "open my keymaps" "k" #'tk/keymaps
        :desc "open my hacks" "h" #'tk/hacks)))

;; BUG: 'g' does not refresh the magit buffer
(map! :map magit-mode-map
      :nm "g"  #'magit-refresh-buffer)


(map! :map inferior-python-mode-map
      ;; less annoying than insert-mode dancing.
      :nim "RET" #'comint-send-input)

;; (undefine-key! evil-org-mode-map "C-d")
(map! :map evil-org-mode-map
      :nim "C-d" #'evil-delete-char
      )
