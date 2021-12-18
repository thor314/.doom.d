;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.

;;(package! yasnippet-snippets)
(package! git-link)
(use-package! git-link :commands git-link)
(package! super-save)
(package! tide) ;; typescript
(package! telega)
(package! stumpwm-mode)
