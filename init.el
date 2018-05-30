(package-initialize)

(require 'org)
(require 'ob-tangle)
(require 'org-ref)

(setq init-dir (file-name-directory (or load-file-name (buffer-file-name))))
(org-babel-load-file (expand-file-name "loader_SP.org" init-dir))
(put 'dired-find-alternate-file 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(package-selected-packages
   (quote
    (org-ref zenburn-theme yasnippet-snippets writegood-mode wc-mode use-package solarized-theme smex smartparens slime reveal-in-osx-finder pdf-tools pandoc-mode panda-theme org-journal org-gcal org-bullets org-beautify-theme ob-ipython nlinum-hl multiple-cursors monokai-theme matlab-mode material-theme markdown-mode magit iedit hlinum helm-swoop helm-projectile fill-column-indicator expand-region exec-path-from-shell ess elpy dracula-theme counsel company-jedi company-go company-anaconda color-theme-sanityinc-tomorrow cdlatex autopair auto-complete auctex anti-zenburn-theme ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

