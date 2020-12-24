; -*- lexical-binding: t -*-
;;; packages.el --- shdennlin-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2019-2020 shdennlin
;;
;; Author: shdennlin <ShawnDennisLin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst shdennlin-org-packages
  '(
    (org :location built-in)
    org-superstar
    org-pomodoro
    org-gcal
    )
  )

(defun shdennlin-org/post-init-org-superstar ()
  (progn
    (setq org-superstar-headline-bullets-list '("☰" "☷" "☯" "☭"))
    ))

(defun shdennlin-org/post-init-org ()
  (with-eval-after-load 'org
    (progn
      (setq system-time-locale "C") ;; let date language be English
      (setq org-startup-indented t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; org-mode Appearance Beautification
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      (setq org-emphasis-alist
            (quote
             (("*" bold)
              ("/" italic)
              ("_" underline)
              ("=" org-code verbatim)
              ("~" org-code verbatim)
              ("+" (:strike-through t)))))
      (setq org-edit-src-content-indentation 0)

      ;; (setq org-todo-keywords
      ;;       ('((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
      ;;          (sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)"))))
      ;; (setq org-todo-keywords
      ;;       '((sequence "TODO(t)" "ONGOING(o)" "MAYBE(m)" "WAIT(w)" "DELEGATED(d)" "|"
      ;;                   "DONE(f)" "CANCELLED(c)" "STUCK(s)")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; MobileOrg
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

      (defvar org-directory "" "location of your Org files on your local system")
      (defvar org-mobile-inbox-for-pull "" "name of the file where new notes will be stored")
      (defvar org-mobile-directory "" "blog-admin")

      (cond
       ((spacemacs/system-is-mswindows)
        (setq
         org-directory "d:/org-notes"
         org-mobile-inbox-for-pull "d:/org-notes/flagged.org"
         org-mobile-directory "d:/Dropbox/Apps/MobileOrg")
        (defcustom org-mobile-checksum-binary
          (or
           ;; https://doyakin.com/emacs/win-mobile-org-%E8%A8%AD%E5%AE%9A%E3%83%A1%E3%83%A2/
           ;; (executable-find "d:/org-notes/WinMD5.exe")
           (executable-find "d:/org-notes/tools/fciv.exe")
           (executable-find "shasum")
           (executable-find "sha1sum")
           (executable-find "md5sum")
           (executable-find "md5"))
          "Executable used for computing checksums of agenda files."
          :group 'org-mobile
          :type 'string)
        )
       ((spacemacs/system-is-linux)
        (setq
         org-directory "~/org-notes"
         org-mobile-inbox-for-pull "~/org-notes/flagged.org"
         org-mobile-directory ""
         ))
       )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; org-capture
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

      ;; C-n for the next org agenda item
      ;; (define-key org-agenda-mode-map (kbd "C-p") 'org-agenda-previous-item)

      ;; (with-eval-after-load 'org-agenda
      ;;   (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
      ;;   (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
      ;;     "." 'spacemacs/org-agenda-transient-state/body)
      ;;   (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
      ;;     "p" 'org-agenda-priority)
      ;;   ;; 默认显示节假日
      ;;   (setq org-agenda-include-diary t)
      ;;   )
      ;; org-columns-default-format
      ;; (setq org-columns-default-format
      ;;       "%25ITEM %TODO %3PRIORITY %TIMESTAMP")
      ;; (add-to-list 'org-agenda-custom-commands
      ;;              '("t" "List of all TODO entries" alltodo ""
      ;;                ((org-agenda-view-columns-initially t))))

      ;; define the org-agenda refile targets
      (setq org-agenda-file-gtd          (expand-file-name "gtd.org"          org-agenda-dir))
      (setq org-agenda-file-journal      (expand-file-name "journal.org"      org-agenda-dir))
      (setq org-agenda-file-note         (expand-file-name "notes.org"        org-agenda-dir))
      (setq org-agenda-file-blog         (expand-file-name "blog.org"         org-agenda-dir))
      (setq org-agenda-file-emacs        (expand-file-name "emacs.org"        org-agenda-dir))
      (setq org-agenda-file-code-snippet (expand-file-name "snippet.org"      org-agenda-dir))
      (setq org-agenda-file-work         (expand-file-name "work.org"         org-agenda-dir))
      (setq org-agenda-file-side-project (expand-file-name "side-project.org" org-agenda-dir))
      (setq org-default-notes-file       (expand-file-name "gtd.org"          org-agenda-dir))
      (setq org-agenda-files             (list org-agenda-dir))

      ;; org-capture-templates
      ;; the %i would copy the selected text into the template
      ;; http://www.howardism.org/Technical/Emacs/journaling-org.html
      (setq org-capture-templates
            '(
              ("t" "Todo"            entry (file+headline org-agenda-file-gtd           "Workspace")
               "* TODO [#B] %?\n%i\n%U"       :empty-lines 1)
              ("w" "work"            entry (file+headline org-agenda-file-work          "Work")
               "* TODO [#A] %?\n%i\n%U"       :empty-lines 1)
              ("p" "Side-Project"    entry (file+headline org-agenda-file-side-project  "Side-Project")
               "* TODO [#B] %?\n%i\n%U"       :empty-lines 1)
              ("b" "Blog Ideas"      entry (file+headline org-agenda-file-blog          "Blog Ideas")
               "* TODO [#B] %?\n%i\n%U"       :empty-lines 1)
              ("e" "Emacs"           entry (file+headline org-agenda-file-emacs         "Hacking Emacs")
               "* TODO [#B] %?\n%i\n%U"       :empty-lines 1)
              ("n" "notes"           entry (file+headline org-agenda-file-note          "Quick notes")
               "* %?\n%i\n%U"                 :empty-lines 1)
              ("f" "Firefox"         entry (file+headline org-agenda-file-note          "Quick notes")
               "* TODO [#C] %?\n%i\n%U"       :empty-lines 1)
              ("s" "Code Snippet"    entry (file          org-agenda-file-code-snippet)
               "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
              ("j" "Journal Entry"   entry (file+datetree org-agenda-file-journal)
               "* %?"                         :empty-lines 1)
              ("y" "TszYou"          entry (file+headline org-agenda-file-note          "TszYou")
               "* TODO [#A] %?\n%i\n%U"       :empty-lines 1)
              ;; ("p" "Protocol"        entry (file+headline org-agenda-file-note    "Inbox")
              ;;  "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
              ;; ("L" "Protocol Link"   entry (file+headline org-agenda-file-note    "Inbox")
              ;;  "* %? [[%:link][%:description]] \nCaptured On: %U")
              ))

      ;;An entry without a cookie is treated just like priority ' B '.
      ;;So when create new task, they are default 重要且紧急
      (setq org-agenda-custom-commands
            '(
              ("w" . "任務安排")
              ("wa" "重要&緊急任務" tags-todo "+PRIORITY=\"A\"")
              ("wb" "重要&不緊急任務" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
              ("wc" "不重要&緊急任務" tags-todo "+PRIORITY=\"C\"")
              ("b" "Blog" tags-todo "BLOG")
              ("p" . "項目安排")
              ("pw" tags-todo "PROJECT+WORK+CATEGORY=\"work\"")
              ("pl" tags-todo "PROJECT+DREAM+CATEGORY=\"shdennlin\"")
              ("W" "Weekly Review"
               ((stuck "") ;; review stuck projects as designated by org-stuck-projects
                (tags-todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
                ))))

      (with-eval-after-load 'org
        (progn
          ))
      )))

(defun shdennlin-org/post-init-org-pomodoro ()
  (setq org-pomodoro-format "P~%s")
  (setq org-pomodoro-long-break-format "LB~%s")
  (setq org-pomodoro-short-break-format "SB~%s")
  (setq org-pomodoro-manual-break t)
  )

(defun shdennlin-org/init-org-gcal ()
  (with-eval-after-load 'org-gcal
    (progn
      (setq org-gcal-client-id shdennlin-org-gcal-client-id
            org-gcal-client-secret shdennlin-org-gcal-client-secret
            org-gcal-fetch-file-alist `(("shawndennislin@gmail.com" . ,org-agenda-file-work)
                                        ("shawndennislin@gmail.com" . ,org-agenda-file-gtd)
                                        ("shawndennislin@gmail.com" . ,org-agenda-file-gtd)
                                        ))
      )
    )
  )

;;; packages.el ends here
