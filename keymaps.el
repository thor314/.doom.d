;;; keymaps.el -*- lexical-binding: t; -*-

(undefine-key! minibuffer-local-map "C-v" "C-j")
(map! :map 'minibuffer-local-map
      :vm "C-v" #'evil-scroll-page-down
      :vm "C-j" #'evil-scroll-page-down)

(undefine-key! evil-insert-state-map "C-d" "C-t" "C-T")
(map! :map 'evil-insert-state-map
      :in "C-t" #'transpose-chars
      :in "C-T" #'transpose-sexps
      :in "C-d" #'evil-delete-char)

;; evil will screw with ya, we must screw back
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)
(map! :after evil
      :nom "s" #'evil-avy-goto-char
      :nom "S" #'evil-avy-goto-word-1
      :n "t" #'transpose-chars
      :n "T" #'transpose-sexps
      :n "w" #'evil-window-next
      :n "W" #'+evil/next-frame)
