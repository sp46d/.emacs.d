(setq user-full-name "Sanghyuk Park")
(setq user-mail-address "sanghyuk.park85@gmail.com")

(require 'package)
(setq exec-path (cons "/usr/local/bin" exec-path))
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(setq scimax-dir "~/.emacs.d/scimax")
(add-to-list 'load-path "~/.emacs.d/scimax")
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(package-initialize)

;; Bootstrap 'use-package'
(require 'org-install)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package dired
  :bind ("C-c d w" . wdired-change-to-wdired-mode))

(global-set-key (kbd "C-x d") 'dired)
(global-set-key (kbd "C-x C-d") 'dired)
(global-set-key (kbd "C-c d f") 'delete-frame)

(setq inhibit-splash-screen t)
(defun startup-echo-area-message () "Ready")
(setq visible-bell t)
(column-number-mode t)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(setq delete-by-moving-to-trash t)
(setq ffap-require-prefix t)

(defun my/set-frame-size-on-startup ()
  (interactive)
  (progn
	(add-to-list 'default-frame-alist
				 (cons 'width 140))
	(add-to-list 'default-frame-alist
				 (cons 'height (/ (x-display-pixel-height)
								  (frame-char-height))))
	(add-to-list 'default-frame-alist (cons 'left 80))))

(my/set-frame-size-on-startup)

;; (defun set-frame-size-according-to-resolution ()
;;   (interactive)
;;   (if window-system
;; 	  (progn
;; 		(if (> (x-display-pixel-width) 1300)
;; 			(add-to-list 'default-frame-alist (cons 'width 155))
;; 		  (add-to-list 'default-frame-alist (cons 'width 155)))
;; 		(add-to-list 'default-frame-alist
;; 					 (cons 'height (/ (x-display-pixel-height)
;; 									  (frame-char-height))))
;; 		(add-to-list 'default-frame-alist (cons 'left 230))
;; 		)))

;; (set-frame-size-according-to-resolution)

  ;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

(fset 'yes-or-no-p 'y-or-n-p)

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'alt)

(setq default-directory "~/")
(put 'dired-find-alternate-file 'disabled nil)

;; (set-face-attribute 'default nil :font "Menlo-12")
(setq-default line-spacing 0.2)

;; (set-face-attribute 'default nil :font "Source Code pro-14")
(set-face-attribute 'default nil :font "InconsolataGo-14")
;; (set-face-attribute 'default nil :font "DejaVu Sans Mono-12")
;; (set-face-attribute 'default nil :font "Hack-12")

(add-hook 'dired-mode-hook 'hl-line-mode)
(add-hook 'package-menu-mode-hook 'hl-line-mode)
(add-hook 'org-agenda-mode-hook 'hl-line-mode)

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(defun isearch-exit-other-end (rbeg rend)
  "Exit isearch, but at the other end of the search string.
This is useful when followed by an immediate kill."
  (interactive "r")
  (isearch-exit)
  (goto-char isearch-other-end))
(define-key isearch-mode-map [(control return)] 'isearch-exit-other-end)

(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; (global-linum-mode t)
;; (setq linum-format "%5d ")
;; (use-package hlinum
;;   :ensure t
;;   :config (hlinum-activate))

(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")

(setq create-lockfiles nil)

(delete-selection-mode 1)

(setq scroll-margin 5
	  scroll-step 1
	  scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(setq sentence-end-double-space nil)

(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-copy-env "PATH"))

;; (defun set-exec-path-from-shell-PATH ()
;;   (let ((path-from-shell (replace-regexp-in-string
;;                           "[ \t\n]*$"
;;                           ""
;;                           (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
;;     (setenv "PATH" path-from-shell)
;;     (setq eshell-path-env path-from-shell) ; for eshell users
;;     (setq exec-path (split-string path-from-shell path-separator))))

;; (when window-system (set-exec-path-from-shell-PATH))

(set-register ?i '(file . "~/.emacs.d/init.el"))
(set-register ?l '(file . "~/.emacs.d/loader_SP.org"))
(set-register ?a '(file . "~/Dropbox/org/BeOrg/inbox.org"))
(set-register ?b '(file . "~/Dropbox/Bibliography/references.bib"))
(set-register ?p '(file . "~/Dropbox/org/BeOrg/projects.org"))
(set-register ?n '(file . "~/Dropbox/org/BeOrg/notes.org"))
(set-register ?t '(file . "~/Dropbox/org/BeOrg/todo.org"))

(setq ispell-program-name "aspell")
(add-to-list 'ispell-skip-region-alist '("^#+BEGIN_SRC" . "^#+END_SRC"))
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))
(global-set-key (kbd "C-c i r") 'ispell-region)
(global-set-key (kbd "C-c i b") 'ispell-buffer)

(define-key ctl-x-map "\C-i"
  #'endless/ispell-word-then-abbrev)

(defun endless/simple-get-word ()
  (car-safe (save-excursion (ispell-get-word nil))))

(defun endless/ispell-word-then-abbrev (p)
  "Call 'ispell-word', then create an abbrev for it. With prefix P, create local abbrev. Otherwise it will be global.
If there's nothing wrong with the word at point, keep looking for a typo until the beginning of buffer. You can 
skip typos you don't want to fix with 'SPC', and you can abort completely with 'C-g'."
  (interactive "P")
  (let (bef aft)
    (save-excursion
      (while (if (setq bef (endless/simple-get-word))
         (if (ispell-word nil 'quiet)
             nil
           (not (bobp)))
           (not (bobp)))
    (backward-word)
    (backward-char))
      (setq aft (endless/simple-get-word)))
    (if (and aft bef (not (equal aft bef)))
    (let ((aft (downcase aft))
          (bef (downcase bef)))
      (define-abbrev
        (if p local-abbrev-table global-abbrev-table)
        bef aft)
      (message "\"%s\" now expands to \"%s\" %sally"
           bef aft (if p "loc" "glob")))
      (user-error "No typo at or before point"))))

(setq save-abbrevs 'silently)
(setq-default abbrev-mode t)

;; (global-set-key (kbd "C-c q") 'switch-to-prev-buffer)
;; (global-set-key (kbd "C-c n") 'switch-to-next-buffer)

(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

(global-set-key (kbd "M-j")
				(lambda ()
                  (interactive)
                  (join-line -1)))

(global-set-key (kbd "C-S-n")
                (lambda ()
                  (interactive)
                  (ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 5))))

(global-set-key (kbd "C-S-f")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-char 5))))

(global-set-key (kbd "C-S-b")
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-char 5))))

(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
	(previous-line 1)
    (move-to-column col)))

(global-set-key (kbd "<C-S-down>") 'move-line-down)
(global-set-key (kbd "<C-S-up>") 'move-line-up)

(global-set-key [remap goto-line] 'goto-line-with-feedback)

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

(defun mydired-sort ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header 
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))

(defadvice dired-readin
  (after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding marks."
  (mydired-sort))

(global-visual-line-mode)

(use-package fill-column-indicator
  :ensure t
  :config
  (setq fci-rule-column 80)
  (add-hook 'prog-mode-hook 'fci-mode))

(defvar-local company-fci-mode-on-p nil)

(defun company-turn-off-fci (&rest ignore)
  (when (boundp 'fci-mode)
	(setq company-fci-mode-on-p fci-mode)
	(when fci-mode (fci-mode -1))))

(defun company-maybe-turn-on-fci (&rest ignore)
  (when company-fci-mode-on-p (fci-mode 1)))

(add-hook 'company-completion-started-hook 'company-turn-off-fci)
(add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
(add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)

(setq frame-title-format
	  '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(use-package solarized-theme
  :ensure t
  :init 
  (progn (setq solarized-use-variable-pitch nil)
         (setq solarized-scale-org-headlines nil)
  	       (load-theme 'solarized-light t)))
    	 ;; (load-theme 'solarized-dark t)))


         ;;  =============================
         ;; Solarized light
         ;; =============================
         ;; (custom-set-faces
         ;;   ;; '(linum ((t (:foreground "#93a1a1" :underline nil :slant normal :weight normal :height 1.0 :width normal))))
         ;;   '(linum-highlight-face ((t (:inherit default :background "#268bd2" :foreground "#fdf6e3")))))
         ;; =============================
         ;; Solarized dark
         ;; =============================
         ;; (custom-set-faces
         ;;   '(linum ((t (:foreground "#586e75" :underline nil :slant normal :weight normal :height 1.0 :width normal))))
         ;;   '(linum-highlight-face ((t (:inherit default :background "#268bd2" :foreground "#002b36")))))

;; (use-package zenburn-theme
;;   :ensure t
;;   :init
;;   (load-theme 'zenburn t))

;; (use-package anti-zenburn-theme 
;;   :ensure t
;;   :init
;;   (load-theme 'anti-zenburn t))

;; (use-package material-theme 
;;   :ensure t
;;   :init
;;   (load-theme 'material t)
;;   )

;; (use-package color-theme-sanityinc-tomorrow
;;   :ensure t
;;   :config
;;   (color-theme-sanityinc-tomorrow--define-theme day))

;; (use-package panda-theme
;;   :ensure t
;;   :config
;;   (load-theme 'panda t))

(use-package ace-window
  :ensure t
  :bind
  ("C-t" . ace-window))

(use-package tex                   
    :ensure auctex
    :mode ("\\.tex\\'" . TeX-latex-mode)
    :init (setenv "PATH" (concat "/Library/TeX/texbin:" (getenv "PATH")))
    :config (progn
              (setq reftex-plug-into-AUCTeX t
                    TeX-save-query nil)
              (add-hook 'TeX-mode-hook (lambda () (reftex-mode 1)))
              (add-hook 'TeX-mode-hook 'turn-on-cdlatex)
              (add-hook 'TeX-mode-hook (lambda () (autopair-mode -1)))))

  (setq TeX-PDF-mode t)

  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (push
               '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
                 :help "Run latexmk on file")
               TeX-command-list)))
  (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

  (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
  (setq TeX-view-program-list
        '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b")))



(custom-set-variables
 '(TeX-source-correlate-method 'synctex)
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t))

;; (use-package reftex
;;   :ensure t
;;   :config
;;   (setq reftex-cite-prompt-optional-args t)); Prompt for empty optional arguments in cite

(show-paren-mode 1)
(use-package autopair
  :ensure t
  :diminish autopair-mode
  :init (autopair-global-mode)
  :config (setq autopair-blink nil))

;; (use-package smartparens
;;   :ensure t
;;   :bind
;;   (("C-M-a" . sp-beginning-of-sexp)
;;    ("C-M-e" . sp-end-of-sexp)
;;    ("C-M-f" . sp-forward-sexp)
;;    ("C-M-b" . sp-backward-sexp))
;;   :config 
;;   (progn
;;     (setq sp-show-pair-from-inside nil)
;;     (require 'smartparens-config)
;;     (require 'smartparens-python)
;;     (smartparens-global-mode t)
;;     (show-smartparens-global-mode t)))

;; (add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
;; (add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)

(use-package avy
  :ensure t
  :bind (("C-c j" . avy-goto-char)
		 ("C-c k" . avy-goto-char-2)))

;; (require 'company)
;; (setq company-tooltip-align-annotations t)
;; (setq company-selection-wrap-around t)
;; (setq company-tooltip-flip-when-above t)
;; (setq company-idle-delay 0.0)
;; (add-hook 'after-init-hook 'global-company-mode)
(use-package company
  :ensure t
  :diminish
  :config
  (add-hook 'after-init-hook 'global-company-mode)

  (setq company-idle-delay t)

  (use-package company-go
    :ensure t
    :config
    (add-to-list 'company-backends 'company-go))

  (use-package company-anaconda
    :ensure t
    :config
    (add-to-list 'company-backends 'company-anaconda)))

(eval-after-load 'company
  '(progn
	 (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
	 (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)))

(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
     (define-key company-active-map (kbd "<backtab>") 'company-select-previous)))

(setq company-dabbrev-downcase nil)

(use-package wc-mode
  :ensure t
  :bind
    ("C-c w" . wc-mode))

(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)
		 ("C-c 9" . er/mark-inside-pairs)
		 ("C-c 0" . er/mark-outside-pairs)
		 ("C-c i i" . er/mark-inside-quotes)
		 ("C-c i o}" . er/mark-outside-quotes)))

(use-package google-this
  :ensure t
  :bind (("C-c g t" . google-this)
         ("C-c g l" . google-this-line)
         ("C-c g w" . google-this-word)
         ("C-c g e" . google-this-error)
         ("C-c g r" . google-this-region)))

;; (use-package iedit
;;   :ensure t)

(use-package counsel
  :ensure t)
(use-package swiper
  :ensure t
  :diminish (ivy-mode . "")
  :init (ivy-mode 1)
  :bind*
  (("C-S-s" . swiper)
   ("C-x C-b" . switch-to-buffer)
   ("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("C-x l" . counsel-locate))
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 10)
  (setq ivy-display-style 'fancy)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-count-format "(%d/%d) "))
(ido-mode -1)

(use-package smex
  :ensure t)

;; (defun my-swiper-recenter (&rest args)
;;   "Recenter display after swiper"
;;   (recenter))
;; (advice-add 'swiper :after #'my-swiper-recenter)

;; (use-package helm
;;   :ensure t
;;   :diminish helm-mode
;;   :init
;;   (progn
;; 	(require 'helm-config)
;; 	(setq helm-candidate-number-limit 100)
;; 	(setq helm-idle-delay 0.0
;; 		  helm-input-idle-delay 0.01
;; 		  helm-quick-update t)
;; 	(helm-mode))
;;   (global-unset-key (kbd "C-x c"))
;;   :bind*
;;   (("C-x C-f" . helm-find-files)
;;    ("C-x C-b" . helm-mini)
;;    ("C-x b" . helm-mini)
;;    ("M-x" . helm-M-x)
;;    ("C-c h" . helm-command-prefix)
;;    ("C-c r" . helm-resume))
;;   :bind
;;   (:map helm-map
;; 		("<tab>" . helm-execute-persistent-action)
;; 		("C-i" . helm-execute-persistent-action)
;; 		("C-z" . helm-select-action))
;;   :config
;;   (setq helm-split-window-in-side-p t
;; 		helm-ff-file-name-history-use-recentf t
;; 		helm-echo-input-in-header-line t)
;;   (progn
;; 	(setq helm-autoresize-max-height 30
;; 		  helm-autoresize-min-height 15)
;; 	(helm-autoresize-mode 1)))

;; (use-package helm-swoop
;;   :ensure t
;;   :bind*
;;   (("C-S-s" . helm-swoop)
;;    ("C-c s" . helm-multi-swoop))
;;   :init
;;   (setq helm-swoop-pre-input-function
;; 		(lambda () ""))
;;   (setq helm-swoop-speed-or-color t))

(use-package interleave :ensure t)

(use-package magit 
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package multiple-cursors
  :ensure t
  :bind (("C->" . mc/mark-next-like-this)
		 ("C-<" . mc/mark-previous-like-this)
		 ("C-c C-<" . mc/mark-all-like-this)
		 ("C-c mr" . mc/mark-all-in-region)
		 ("M-S-<mouse-1>" . mc/add-cursor-on-click)))

(use-package org-journal :ensure t
  :bind (("C-c ij" . org-journal-new-entry))
  :config
  (setq org-journal-dir "~/Dropbox/org/.org/journal/"))
  ;; (add-to-list 'auto-mode-alist '(".*/[0-9]*$" . org-mode)))

(use-package reveal-in-osx-finder :ensure t
  :bind ("C-c o" . reveal-in-osx-finder))

(use-package yasnippet
  :ensure t
  :bind
  (("C-x y n" . yas-new-snippet)
   ("C-x y v" . yas-visit-snippet-file))
  :diminish yas-minor-mode
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/yasnippet-snippets")
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
  (yas-global-mode)
  (global-set-key (kbd "M-/") 'company-yasnippet))

(use-package pdf-tools
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :ensure t
  :init (add-hook 'pdf-view-mode-hook 'pdf-view-fit-page-to-window))
;; (use-package org-pdfview
;;   :load-path "~code/emacs/org-pdfview"
;;   :after pdf-tools)

(use-package org 
  :ensure t
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c b" . org-iswitchb)
         ("C-c p" . org-set-property)
         ("C-c c" . org-capture)
         ("C-c t" . org-babel-tangle))
  :config
  ;; When add files recursively to the agenda
  ;; (load-library "find-lisp")
  ;; (setq org-agenda-files (find-lisp-find-files "~/Dropbox/Emacs" "\.org$"))
  ;; (add-hook 'org-mode-hook 'org-display-inline-images)
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((R . t)
     (latex . t)
     (python . t)
     (ipython . t)
     (shell . t))))

(add-hook 'org-capture-mode-hook 'delete-other-windows)
(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode t))
          t)
(global-set-key (kbd "C-c C-w") 'org-refile)

(setq org-pretty-entities nil
	  org-fontify-whold-heading-line t
	  org-fontify-done-headline t
	  org-fontify-quote-and-verse-blocks t
	  org-src-window-setup 'current-window
	  org-highlight-latex-and-related '(latex)
	  org-log-done 'time
      org-confirm-babel-evaluate nil
      org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-src-preserve-indentation t)
;; (setq org-src-window-setup 'current-window)

(setq org-capture-templates
      '(("i" "Inbox" entry (file "~/Dropbox/org/BeOrg/inbox.org")
         "* %?\n:PROPERTIES:\n:CREATED: %u\n:END:")
        ("a" "Appointment" entry (file  "~/Dropbox/org/appt_gcal.org")
         "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
        ("h" "Honey" entry (file  "~/Dropbox/org/honey_gcal.org")
         "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
        ("s" "School" entry (file  "~/Dropbox/org/school_gcal.org")
         "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")))

(setq org-refile-targets
      '(("~/Dropbox/org/BeOrg/todo.org" :level . 1)
        ("~/Dropbox/org/BeOrg/notes.org" :level . 1)
        ("~/Dropbox/org/someday.org" :level . 1)
        ("~/Dropbox/org/BeOrg/projects.org" :level . 2)))
(setq org-link-frame-setup (quote ((vm . vm-visit-folder-other-frame)
                                   (vm-imap . vm-visit-imap-folder-other-frame)
                                   (gnus . org-gnus-no-new-news)
                                   (file . find-file)
                                   (wl . wl-other-frame))))
(setq org-archive-location (concat "~/Dropbox/org/archive/archive-"
                                   (format-time-string "%Y%m" (current-time)) ".org_archive::"))
(setq org-reverse-note-order t)

(setq org-directory "~/Dropbox/org")
(setq org-agenda-files
      '("~/Dropbox/org/BeOrg/inbox.org"
        "~/Dropbox/org/BeOrg/projects.org"
        "~/Dropbox/org/BeOrg/todo.org"
        "~/Dropbox/org/BeOrg/notes.org"
        "~/Dropbox/org/appt_gcal.org"
        "~/Dropbox/org/honey_gcal.org"
        "~/Dropbox/org/school_gcal.org"))
(setq org-agenda-window-setup (quote current-window))
(setq org-deadline-warning-days 7)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)

(setq org-todo-keywords
      '((sequence "TODO(t)" "IN-PROGRESS(i)" "|" "DONE(d)")))
(setq org-todo-keyword-faces
      '(("TODO" :foreground "orange red" :weight bold)
        ("IN-PROGRESS" :foreground "#268bd2" :weight bold)))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-gcal
  :ensure t
  :config
  (setq org-gcal-client-id "525899375201-00hs1dks72ihc8vcrj013dv03ssg0qj2.apps.googleusercontent.com"
        org-gcal-client-secret "sosBUGNTGwz4W6Df9VgRKC6T"
        org-gcal-file-alist '(("sanghyuk.park85@gmail.com" .  "~/Dropbox/org/appt_gcal.org")
                              ("4vqpvq9t0c6ks3m33ljjfecmto@group.calendar.google.com" .  "~/Dropbox/org/honey_gcal.org")
                              ("fhpns3sdcd9nakpug3kthkp0q0@group.calendar.google.com" .  "~/Dropbox/org/school_gcal.org"))))

(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))

;; (setq org-structure-template-alist
;; 	  '(("s" "#+BEGIN_SRC ?\n\n#+END_SRC" "<src lang=\"?\">\n\n</src>")
;;         ("r" "#+BEGIN_SRC R\n?\n#+END_SRC" "<src lang=\"R\">\n?\n</src>")
;;         ("l" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC" "<src lang=\"emacs-lisp\">\n?\n</src>")
;;         ("p" "#+BEGIN_SRC python\n?\n#+END_SRC" "<src lang=\"python\">\n?\n</src>")))

(use-package cdlatex :ensure t
  :config
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex))

;; see org-ref for use of these variables
(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
(setq reftex-default-bibliography '("~/Dropbox/bibliography/references.bib"))
(setq org-ref-default-bibliography '("~/Dropbox/bibliography/references.bib")
      org-ref-pdf-directory "~/Dropbox/bibliography/papers/")

;; Org-ref notes configuration
;; Tell org-ref to let helm-bibtex find notes for it
(setq org-ref-notes-function
      (lambda (thekey)
        (let ((bibtex-completion-bibliography (org-ref-find-bibliography)))
          (bibtex-completion-edit-notes
           (list (car (org-ref-get-bibtex-key-and-file thekey)))))))

(add-hook 'org-mode-hook
          (lambda ()
            (define-key org-mode-map  (kbd "C-c i n") 'org-ref-open-notes-at-point)))

;; Helm-bibtex configuration
(use-package helm-bibtex
  :ensure t
  :bind ("C-c h b" . helm-bibtex)
  :init
  (setq helm-bibtex-full-frame nil)
  (setq bibtex-completion-notes-path "~/Dropbox/bibliography/Notes/")
  (setq bibtex-completion-bibliography '("~/Dropbox/bibliography/references.bib")
        bibtex-completion-library-path '("~/Dropbox/bibliography/papers/"))
  (setq bibtex-completion-pdf-open-function
        (lambda (fpath)
          (call-process "open" nil 0 nil "-a" "/Applications/Skim.app" fpath)))
  (setq helm-bibtex-notes-template-multiple-files
        (format
         "#+TITLE: Notes on: ${title}\n#+INTERLEAVE_PDF: ~/Dropbox/Bibliography/Papers/${=key=}.pdf\n#+PUB_AUTHORS:\t${author}\n#+PUB_YEAR: \t${year}\n\n"))
  :config
  (setq bibtex-completion-pdf-symbol "f")
  (setq bibtex-completion-notes-symbol "n")
  (setq bibtex-completion-display-formats
        '((t . "${=type=:7}: ${author: 20} (${year:4}) ${title:*} :${=has-pdf=:1}${=has-note=:1}:"))))

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/ess")
(add-hook 'ess-mode-hook 'company-mode)
(require 'ess-site)
(setq ess-ask-for-ess-directory nil)
(ess-toggle-underscore nil)
(setq ess-use-auto-complete t)
(setq ess-tab-complete-in-script t)
(setq ess-help-own-frame 'one)
(setq inferior-ess-same-window nil)
(add-to-list
 'auto-mode-alist
 '("\\.bug$" . R-mode))

(setq ess-R-font-lock-keywords
    '((ess-R-fl-keyword:modifiers . t)
     (ess-R-fl-keyword:fun-defs . t)
     (ess-R-fl-keyword:keywords . t)
     (ess-R-fl-keyword:assign-ops)
     (ess-R-fl-keyword:constants . t)
     (ess-fl-keyword:fun-calls . t)
     (ess-fl-keyword:numbers)
     (ess-fl-keyword:operators)
     (ess-fl-keyword:delimiters)
     (ess-fl-keyword:=)
     (ess-R-fl-keyword:F&T)
     (ess-R-fl-keyword:%op%)))

(use-package ob-ipython
  :ensure t
  :init
  (require 'scimax-org-babel-ipython-upstream)
  :config
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i --simple-prompt"))

(use-package elpy
  :ensure t
  :pin elpy
  :config
  (elpy-enable)
  (add-hook 'python-mode-hook 'elpy-mode)
  (add-hook 'inferior-python-mode-hook 'python-shell-switch-to-shell)
  (setq python-shell-unbuffered nil)
  (setq python-shell-prompt-detect-failure-warning nil)
  (setq python-shell-prompt-detect-enabled nil)
  (setq python-shell-completion-native-enable nil))

(use-package anaconda-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
