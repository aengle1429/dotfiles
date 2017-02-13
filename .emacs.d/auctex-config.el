;; everything here is from
;; http://stackoverflow.com/questions/7899845/emacs-synctex-skim-how-to-correctly-set-up-syncronization-none-of-the-exi
(setq
 ;; Set the list of viewers for Mac OS X.
 TeX-view-program-list
 '(("Preview.app" "open -a Preview.app %o")
   ("Skim" "open -a Skim.app %o")
   ("displayline" "displayline %n %o %b")
   ("open" "open %o"))
 ;; Select the viewers for each file type.
 TeX-view-program-selection
 '((output-dvi "open")
   (output-pdf "Skim")
   (output-html "open")))

;; above is from http://tex.stackexchange.com/questions/180637/my-pdf-is-not-shown-in-skim-unless-the-application-is-already-running

;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

(server-start); start emacs in server mode so that skim can talk to it
