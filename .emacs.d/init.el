;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(require 'evil)
(evil-mode 1)

(setenv "PATH"
	(concat
	 "/usr/texbin" ":"
	 "/usr/local/bin" ":"
	 (getenv "PATH")
	 )
	)
   (setq exec-path (append exec-path '("/usr/local/bin")))
(setq c-default-style "linux"
          c-basic-offset 4); c stuff
(setenv "PATH" (concat (getenv "PATH") ":/library/TeX/texbin"))
(global-visual-line-mode 1); Proper line wrapping
(global-hl-line-mode 0); Highlight current row
(show-paren-mode 1); Matches parentheses and such in every mode
(set-fringe-mode '(0 . 0)); Disable fringe because I use visual-line-mode
(set-face-background hl-line-face "#f2f1f0"); Same color as greyness in gtk
(setq inhibit-splash-screen t); Disable splash screen
(setq visible-bell t); THIS IS BUGGED Flashes on error
(setq calendar-week-start-day 1); Calender should start on Monday
(add-to-list 'default-frame-alist '(height . 59)); Default frame height.

(linum-mode 't) ;line numbers, possibly laggy for larger files
; maybe uncomment? (exec-path-from-shell-initialize) ;maybe uncomment this
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd ":") 'evil-ex) ;swap : and ; for RSI
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;;; AUCTeX
;; Customary Customization, p. 1 and 16 in the manual, and http://www.emacswiki.org/emacs/AUCTeX#toc2
(setq TeX-parse-self t); Enable parse on load.
(setq TeX-auto-save t); Enable parse on save.
(setq-default TeX-master nil)

(setq TeX-PDF-mode t); PDF mode (rather than DVI-mode)

(add-hook 'TeX-mode-hook 'flyspell-mode); Enable Flyspell mode for TeX modes such as AUCTeX. Highlights all misspelled words.
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode); Enable Flyspell program mode for emacs lisp mode, which highlights all misspelled words in comments and strings.
(setq ispell-dictionary "english"); Default dictionary. To change do M-x ispell-change-dictionary RET.
(add-hook 'TeX-mode-hook
	  (lambda () (TeX-fold-mode 1))); Automatically activate TeX-fold-mode.
(setq LaTeX-babel-hyphen nil); Disable language-specific hyphen insertion.

;; " expands into csquotes macros (for this to work babel must be loaded after csquotes).
(setq LaTeX-csquotes-close-quote "}"
      LaTeX-csquotes-open-quote "\\enquote{")

;; LaTeX-math-mode http://www.gnu.org/s/auctex/manual/auctex/Mathematics.html
(add-hook 'TeX-mode-hook 'LaTeX-math-mode)

;;; RefTeX
;; Turn on RefTeX for AUCTeX http://www.gnu.org/s/auctex/manual/reftex/reftex_5.html
(add-hook 'TeX-mode-hook 'turn-on-reftex)

(eval-after-load 'reftex-vars; Is this construct really needed?
  '(progn
     (setq reftex-cite-prompt-optional-args t); Prompt for empty optional arguments in cite macros.
     ;; Make RefTeX interact with AUCTeX, http://www.gnu.org/s/auctex/manual/reftex/AUCTeX_002dRefTeX-Interface.html
     (setq reftex-plug-into-AUCTeX t)
     ;; So that RefTeX also recognizes \addbibresource. Note that you
     ;; can't use $HOME in path for \addbibresource but that "~"
     ;; works.
     (setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))
					;     (setq reftex-default-bibliography '("UNCOMMENT LINE AND INSERT PATH TO YOUR BIBLIOGRAPHY HERE")); So that RefTeX in Org-mode knows bibliography
     (setcdr (assoc 'caption reftex-default-context-regexps) "\\\\\\(rot\\|sub\\)?caption\\*?[[{]"); Recognize \subcaptions, e.g. reftex-citation
     (setq reftex-cite-format; Get ReTeX with biblatex, see http://tex.stackexchange.com/questions/31966/setting-up-reftex-with-biblatex-citation-commands/31992#31992
	   '((?t . "\\textcite[]{%l}")
	     (?a . "\\autocite[]{%l}")
	     (?c . "\\cite[]{%l}")
	     (?s . "\\smartcite[]{%l}")
	     (?f . "\\footcite[]{%l}")
	     (?n . "\\nocite{%l}")
	     (?b . "\\blockcquote[]{%l}{}")))))

;; Fontification (remove unnecessary entries as you notice them) http://lists.gnu.org/archive/html/emacs-orgmode/2009-05/msg00236.html http://www.gnu.org/software/auctex/manual/auctex/Fontification-of-macros.html
(setq font-latex-match-reference-keywords
      '(
	;; biblatex
	("printbibliography" "[{")
	("addbibresource" "[{")
	;; Standard commands
	;; ("cite" "[{")
	("Cite" "[{")
	("parencite" "[{")
	("Parencite" "[{")
	("footcite" "[{")
	("footcitetext" "[{")
	;; ;; Style-specific commands
	("textcite" "[{")
	("Textcite" "[{")
	("smartcite" "[{")
	("Smartcite" "[{")
	("cite*" "[{")
	("parencite*" "[{")
	("supercite" "[{")
					; Qualified citation lists
	("cites" "[{")
	("Cites" "[{")
	("parencites" "[{")
	("Parencites" "[{")
	("footcites" "[{")
	("footcitetexts" "[{")
	("smartcites" "[{")
	("Smartcites" "[{")
	("textcites" "[{")
	("Textcites" "[{")
	("supercites" "[{")
	;; Style-independent commands
	("autocite" "[{")
	("Autocite" "[{")
	("autocite*" "[{")
	("Autocite*" "[{")
	("autocites" "[{")
	("Autocites" "[{")
	;; Text commands
	("citeauthor" "[{")
	("Citeauthor" "[{")
	("citetitle" "[{")
	("citetitle*" "[{")
	("citeyear" "[{")
	("citedate" "[{")
	("citeurl" "[{")
	;; Special commands
	("fullcite" "[{")))

(setq font-latex-match-textual-keywords
      '(
	;; biblatex brackets
	("parentext" "{")
	("brackettext" "{")
	("hybridblockquote" "[{")
	;; Auxiliary Commands
	("textelp" "{")
	("textelp*" "{")
	("textins" "{")
	("textins*" "{")
	;; supcaption
	("subcaption" "[{")))

(setq font-latex-match-variable-keywords
      '(
	;; amsmath
	("numberwithin" "{")
	;; enumitem
	("setlist" "[{")
	("setlist*" "[{")
	("newlist" "{")
	("renewlist" "{")
	("setlistdepth" "{")
	        ("restartlist" "{")))

; ; these are set by M-x customize-variables!
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(exec-path
   (quote
    ("/Users/aengle/anaconda/bin" "/usr/local/cuda/bin" "/Library/Frameworks/Python.framework/Versions/3.5/bin" "/opt/local/bin" "/opt/local/sbin" "/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/opt/X11/bin" "/Library/TeX/texbin" "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_9" "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_9" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin" "/usr/local/bin" "/usr/local/smlnj/bin")))
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (anaconda-mode monokai-theme solarized-theme zenburn-theme python-mode color-theme-solarized auto-complete evil sml-mode auctex)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(py-python-command "/Users/engle/anaconda/bin/python")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background-mode nil)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'auto-complete-config)
(ac-config-default)

; move all of this to ~/.emacs.d/init.el, can version control that directory

(setq visible-bell t)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(show-paren-mode 1)

; (require 'bar-cursor)
; (bar-cursor-mode t)

; (add-to-list 'load-path "/home/aengle/local-lisp/utils")
; (require 'rect-mark)

(global-set-key (kbd "<M-up>") 'enlarge-window)
(global-set-key (kbd "<M-down>") 'shrink-window)

(global-set-key (kbd "<f8>") (lambda () (interactive) (message (buffer-filename))))
; (require 'markdown-modemap)
; (define-key markdown-mode-map (kbd "<f9>") 'ispell-buffer)

(add-hook 'markdown-mode-hook 'flyspell-mode)
(scroll-bar-mode t)
