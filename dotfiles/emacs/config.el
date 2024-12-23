;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-



;; ██████████         █████ ██████   ██████   █████████     █████████   █████████
;;░░███░░░░███       ░░███ ░░██████ ██████   ███░░░░░███   ███░░░░░███ ███░░░░░███
;; ░███   ░░███       ░███  ░███░█████░███  ░███    ░███  ███     ░░░ ░███    ░░░
;; ░███    ░███       ░███  ░███░░███ ░███  ░███████████ ░███         ░░█████████
;; ░███    ░███       ░███  ░███ ░░░  ░███  ░███░░░░░███ ░███          ░░░░░░░░███
;; ░███    ███  ███   ░███  ░███      ░███  ░███    ░███ ░░███     ███ ███    ░███
;; ██████████  ░░████████   █████     █████ █████   █████ ░░█████████ ░░█████████
;;░░░░░░░░░░    ░░░░░░░░   ░░░░░     ░░░░░ ░░░░░   ░░░░░   ░░░░░░░░░   ░░░░░░░░░

;; Doom Emacs Configuration by djstillxyz - https://github.com/djstillxyz
                           
;; TABLE OF CONTENTS:
;;
;; Basic Information ----------------> 1.0
;;      Email -----------------------> 1.1
;; Customization --------------------> 2.0
;;      Theme -----------------------> 2.1
;;      Fonts -----------------------> 2.2
;;      Splashscreen ----------------> 2.3
;;      Transparency ----------------> 2.4
;;      Editor Behavior--------------> 2.5
;; Hotkeys --------------------------> 3.0
;;      DJMACS ----------------------> 3.0
;; Org Mode -------------------------> 4.0
;;      Directory -------------------> 4.1
;;      Headers ---------------------> 4.2
;;      Packages --------------------> 4.3
;; LaTeX ----------------------------> 5.0
;;      PDF-viewer ------------------> 5.1
;;      General Hotkeys -------------> 5.2

;; SECTION 1.1 -> Email

;; Used to maintain GPG keys, Email, etc.
(setq user-full-name "Derek Still"
      user-mail-address "djstill@proton.me")


;; SECTION 2.1 -> Theme

;;(setq doom-theme 'doom-tokyo-night) ;;tokyo-night

(setq doom-theme 'gruvvy)


;; SECTION 2.2 -> Fonts

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;;
;;
(setq doom-font (font-spec :family "monospace" :size 17)
      doom-variable-pitch-font (font-spec :family "sans" :size 17))

;; Changes default text color
(custom-set-faces!
  '(default :foreground "#FFFFFF"))





;; SECTION 2.3 -> SplashScreen

;; Change Emacs Icon
;;(setq fancy-splash-image "~/.dotfiles/extras/jupiter.png")
(setq fancy-splash-image "~/.config/DJ-hyprland/dotfiles/extras/emacs/images/jupiter.png")

;; Adds footnote on SplashScreen
(add-hook! '+doom-dashboard-functions :append
  (insert "\n" (+doom-dashboard--center +doom-dashboard--width "Your hand in mine, two lovers lost in time ")))




;; SECTION 2.4 -> Transparency

;; Sets transparency of background
(add-to-list 'default-frame-alist '(alpha-background . 100))


;; SECTION 2.5 -> Editor Behavior

;; Removes line numbers when editing text files
(remove-hook! 'text-mode-hook
              #'display-line-numbers-mode)

;; Sets behavior of line numbers
(setq display-line-numbers-type 'relative)


;; SECTION 3.1 -> DJMACS

(cua-mode 1)

;; Rebinds copy
(map! :leader
      (:prefix ("d" . "djmacs")
      :desc "Copy text"
      "c" #'kill-ring-save))

;; Rebinds undo
(map! :leader
      (:prefix ("d" . "djmacs")
      :desc "Undo"
      "u" #'undo))

;; Rebinds insert mode
(map! :leader
      (:prefix ("d" . "djmacs")
      :desc "Insert mode"
      "i" #'evil-insert))

;; Rebinds movement keys in normal mode
  ;;(map! :n "M-j" (lambda () (interactive) (evil-previous-line 5)))
  ;;(map! :n "M-l" (lambda () (interactive) (evil-next-line 5)))
  ;;(map! :n "M-i" (lambda () (interactive) (evil-previous-line 1)))
  ;;(map! :n "M-m" (lambda () (interactive) (evil-next-line 1)))

;; Rebinds movement keys in insert mode
  ;;(map! :i "C-i" (lambda () (interactive) (evil-backward-char 1)))
  ;;(map! :i "C-k" (lambda () (interactive) (evil-forward-char 1)))
  ;;(map! :i "C-u" (lambda () (interactive) (evil-previous-line 1)))
  ;;(map! :i "C-j" (lambda () (interactive) (evil-next-line 1)))

;; Rebinds set-mark
(map! :i "M-k" #'set-mark-command)

;; Rebinds (Ctrl-l) to select a line
(defun select-current-line ()
  "Select the current line."
  (interactive)
  (move-beginning-of-line nil)
  (set-mark (line-end-position)))

(global-set-key (kbd "C-l") 'select-current-line)

;; Binds Hotkeys for skipping to beginning and end of lines
(with-eval-after-load 'evil
  (define-key evil-insert-state-map (kbd "C-q") 'move-beginning-of-line))

(global-set-key (kbd "C-e") 'move-end-of-line)

;; SECTION 4.1 -> Org Directory

;; Sets default location to look for org files
(setq org-directory "~/notes/orgs")




;; section 4.2 -> Headers

;; Customize Org mode header colors
(custom-set-faces!
  '(org-level-1 :foreground "#478980" :weight bold)  ; Adjust " #bc472e " to the desired color
  ;'(org-level-2 :foreground "#3A29DD")  ; Adjust " #bc472e " to the desired color
  ;'(org-level-3 :foreground "#3A29DD")  ; Adjust " #bc472e " to the desired color
  ;; Add more lines for higher-level headers if needed
  )



;; SECTION 4.3 -> Packages

;; Initializes org-modern-mode to start by default
(add-hook 'org-mode-hook #'org-modern-mode)
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
(with-eval-after-load 'org (global-org-modern-mode))




;; SECTION 5.0 -> LaTeX


;; Only change sectioning colour
(setq font-latex-fontify-sectioning 'color)
;; super-/sub-script on baseline
(setq font-latex-script-display (quote (nil)))
;; Do not change super-/sub-script font
(custom-set-faces
 '(font-latex-subscript-face ((t nil)))
 '(font-latex-superscript-face ((t nil)))
 )
;; Exclude bold/italic from keywords
(setq font-latex-deactivated-keyword-classes
    '("italic-command" "bold-command" "italic-declaration" "bold-declaration"))


;; Changes default pdf viewer that emacs calls on
;;(with-eval-after-load 'tex
;;    (add-to-list 'TeX-view-program-selection
;;                 '(output-pdf "Zathura")))

(add-hook 'LaTeX-mode-hook #'outline-minor-mode) ;; https://www.gnu.org/software/auctex/manual/auctex/Folding.html

;; Auto enables 'C-c =' to search the table of contents
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)


;; SECTION 5.1 -> PDF Viewer


;; Changes default pdf viewer that emacs calls on
;;(with-eval-after-load 'tex
;;    (add-to-list 'TeX-view-program-selection
;;                 '(output-pdf "PDF-Tools")))

(setq TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

;; SECTION 5.2 -> General Hotkeys


;; Hotkey to fold buffer in latex
(map! :leader
      (:prefix ("d l" . "djmacs LaTeX")
      :desc "Fold buffer"
     "f" #'outline-hide-body))

;; Hotkey to show section in latex
(map! :leader
      (:prefix ("d l" . "djmacs LaTeX")
      :desc "Show section"
     "s" #'outline-show-subtree) )

;; Hotkey to export
(add-hook 'latex-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-e") 'org-export-dispatch)))





;; GETS YASNIPPETS + COMPANY WORKING

(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))


(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))


(add-hook 'LaTeX-mode-hook 'company-fuzzy-mode)

(add-hook 'company-mode-hook 'company-box-mode)


;;(set-face-foreground 'doom-modeline-evil-insert-state "#fbec9f")


(add-hook 'c++-mode-hook #'lsp)
(add-hook 'LaTeX-mode-hook #'lsp)

;;---------------------------------------------------------
;; Org agenda stuff

;; Ensure Org and Org Super Agenda are installed
(setq org-agenda-span 7
      org-agenda-start-day "+0d"
      org-agenda-skip-timestamp-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t
      org-agenda-skip-scheduled-if-deadline-is-shown t
      org-agenda-skip-timestamp-if-deadline-is-shown t
      org-log-into-drawer t)

(setq org-agenda-prefix-format '((agenda . "  %i ")  ;; Ensure `%i` is present
                                (todo . " %i ")
                                (tags . " %i ")
                                (search . " %i ")))


(setq org-agenda-current-time-string "")
(setq org-agenda-time-grid '((daily) () "" ""))

(setq org-agenda-hide-tags-regexp ".*")

;;(setq org-agenda-category-icon-alist
;;      `(("Appointments" . "~/Downloads/calendar.svg")
;;
;;))
(add-hook 'org-agenda-mode-hook 'olivetti-mode)

(setq org-agenda-category-icon-alist
      `(
        ("appointments" ,(list (nerd-icons-codicon "nf-cod-calendar")) nil nil :ascent center)
        ("birthdays" ,(list (nerd-icons-faicon "nf-fa-birthday_cake"))  nil nil :ascent center)
        ("non_urgent" ,(list (nerd-icons-faicon "nf-fa-hourglass_1"))  nil nil :ascent center)
        ("urgent" ,(list (nerd-icons-mdicon "nf-md-alarm_light_outline"))  nil nil :ascent center)
        ))
      ;;`(("appointments" ,(list (nerd-icons-faicon "nf-fa-smile_o")) nil nil :ascent center)))


