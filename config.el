(setq user-full-name "Shishir Prasad"
      user-mail-address "shishir@ibrew-hub.com")

(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 tab-width 2)                                                        ; Set width for tabs

(map! :leader
 (:prefix-map("d" . "Dired")
      :desc "Dired"
      "d" #'dired
      :leader
      :desc "Dired jump to current"
      "j" #'dired-jump
      (:after dired
       (:map dired-mode-map
        :leader
        :desc "Peep-dired image previews"
        "p" #'peep-dired
        :leader
        :desc "Dired view file"
        "v" #'dired-view-file))))
(evil-define-key 'normal peep-dired-mode-map (kbd "j") 'peep-dired-next-file
  (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

(setq doom-theme 'doom-acario-dark)

;(setq doom-theme 'doom-dracula)
;(setq doom-dracula-brighter-comments t)

( map! :leader
       (:prefix-map ("e" . "Edit and EWW")
       :desc "Edit agenda file"
       "a" #'(lambda () (interactive) (find-file "~/Org/agenda.org"))
       :leader
       :desc "Edit doom config.org"
       "c" #'(lambda () (interactive) (find-file "~/.doom.d/config.org"))
       :leader
       :desc "Edit eshell aliases"
       "e" #'(lambda () (interactive) (find-file "~/.doom.d/aliases"))
       :leader
       :desc "Edit doom init.el"
       "i" #'(lambda () (interactive) (find-file "~/.doom.d/init.el"))
       :leader
       :desc "Edit doom packages.el"
       "p" #'(lambda () (interactive) (find-file "~/.doom.d/packages.el"))))

(defun org-journal-file-header-func (time)
  "Custom function to create journal header."
  (concat
   (pcase org-journal-file-type
     (`daily "#+TITLE: Daily Journal\n#+STARTUP: showeverything")
     (`weekly "#+TITLE: Weekly Journal\n#+STARTUP: folded")
     (`monthly "#+TITLE: Monthly Journal\n#+STARTUP: folded")
     (`yearly "#+TITLE: Yearly Journal\n#+STARTUP: folded"))))


(after! org
  (require 'org-bullets)  ; Nicer bullets in org-mode
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-directory "~/org/"
        org-agenda-files '("~/org/gtd/projects.org"
                           "~/org/gtd/meetings.org"
                           "~/org/gtd/home.org"
                           "~/org/gtd/work.org"
                           "~/org/gtd/ideas.org"
                           "~/org/gtd/inbox.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-log-done 'time
        org-journal-dir "~/org/gtd/journal/"
        org-journal-enable-agenda-integration t
        org-journal-file-type 'monthly
        org-journal-file-format "%B,%Y.org"
        org-journal-carryover-items "TODO=\"TODO\"|TODO=\"NEXT\"|TODO=\"PROJ\"|TODO=\"STRT\"|TODO=\"WAIT\"|TODO=\"HOLD\""
        org-journal-date-format "%B %d, %Y (%A)"

        org-journal-file-header 'org-journal-file-header-func
        org-hide-emphasis-markers t
        org-todo-keywords
        '((sequence
           "TODO(t)"  ; A task that needs doing & is ready to do
           "PROJ(p)"  ; Project with multiple task items.
           "NEXT(n)"  ; Task is next to be worked on.
           "WAIT(w)"  ; Something external is holding up this task
           "|"
           "DONE(d)"  ; Task successfully completed
           "KILL(k)")))) ; Task was cancelled, aborted or is no longer applicable

(setq display-line-numbers-type t)

(setq browse-url-browser-function 'eww-browse-url)
(map! :leader
      :desc "Eww web browser"
      "e w" #'eww
      :leader
      :desc "Eww reload page"
      "e R" #'eww-reload
      :leader
      :desc "Search web for text between BEG/END"
      "s w" #'eww-search-words)

(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(setq avy-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?n ?s))
