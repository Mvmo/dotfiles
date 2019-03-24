
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(set-frame-font "Consolas-16" nil t)
(global-set-key (kbd "C-z") 'undo)

(custom-set-variables
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages (quote (elcord helm))))
(custom-set-faces
 )

(global-set-key (kbd "C-o") 'helm-find-files)
