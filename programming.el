;;; programming.el -*- lexical-binding: t; -*-

(use-package! tide :after web-mode-hook)
(add-hook! 'before-save-hook 'tide-format-before-save)
(add-hook! 'typescript-mode-hook 'tide-setup)
