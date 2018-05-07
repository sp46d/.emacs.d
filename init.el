(package-initialize)

(setq scimax-dir "~/.emacs.d/scimax")
(add-to-list 'load-path "~/.emacs.d/scimax")

(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))

(require 'org)
(require 'ob-tangle)
(require 'ob-ipython)
(require 'scimax-org-babel-ipython-upstream)
;; (require 'org-ref)

(setq init-dir (file-name-directory (or load-file-name (buffer-file-name))))
(org-babel-load-file (expand-file-name "loader_SP.org" init-dir))
(put 'dired-find-alternate-file 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(TeX-source-correlate-method (quote synctex))
 ;; '(TeX-source-correlate-mode t)
 ;; '(TeX-source-correlate-start-server t)
 '(ess-R-font-lock-keywords
   (quote
    ((ess-R-fl-keyword:modifiers . t)
     (ess-R-fl-keyword:fun-defs . t)
     (ess-R-fl-keyword:keywords . t)
     (ess-R-fl-keyword:assign-ops . t)
     (ess-R-fl-keyword:constants . t)
     (ess-fl-keyword:fun-calls . t)
     (ess-fl-keyword:numbers . t)
     (ess-fl-keyword:operators . t)
     (ess-fl-keyword:delimiters . t)
     (ess-fl-keyword:= . t)
     (ess-R-fl-keyword:F&T . t)
     (ess-R-fl-keyword:%op% . t))))
 '(package-selected-packages
   (quote
    (zenburn-theme yasnippet-snippets writegood-mode wc-mode use-package solarized-theme smex smartparens slime reveal-in-osx-finder pdf-tools pandoc-mode panda-theme org-journal org-gcal org-bullets org-beautify-theme ob-ipython nlinum-hl multiple-cursors monokai-theme matlab-mode material-theme markdown-mode magit iedit hlinum helm-swoop helm-projectile fill-column-indicator expand-region exec-path-from-shell ess elpy dracula-theme counsel company-jedi company-go company-anaconda color-theme-sanityinc-tomorrow cdlatex autopair auto-complete auctex anti-zenburn-theme ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

