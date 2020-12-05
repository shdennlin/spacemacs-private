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
    org
    ;; org-pomodoro
    )
  )

(defun shdennlin-org/post-init-org ()
  (progn
    (setq system-time-locale "C") ;; let date language be English
    (setq org-startup-indented t)
    (setq org-emphasis-alist
          (quote
           (("*" bold)
            ("/" italic)
            ("_" underline)
            ("=" org-code verbatim)
            ("~" org-code verbatim)
            ("+" (:strike-through t)))))
    (setq org-edit-src-content-indentation 0)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; org-capture
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; define the org-agenda refile targets
    (setq org-agenda-file-note         (expand-file-name "notes.org"     org-agenda-dir))
    (setq org-agenda-file-gtd          (expand-file-name "gtd.org"       org-agenda-dir))
    (setq org-agenda-file-work         (expand-file-name "work.org"      org-agenda-dir))
    (setq org-agenda-file-journal      (expand-file-name "journal.org"   org-agenda-dir))
    (setq org-agenda-file-code-snippet (expand-file-name "snippet.org"   org-agenda-dir))

    (setq org-default-notes-file       (expand-file-name "gtd.org"       org-agenda-dir))
    (setq org-agenda-file-blogposts    (expand-file-name "all-posts.org" org-agenda-dir))
    (setq org-agenda-files             (list org-agenda-dir))

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

    ;; org-capture-templates
    ;; the %i would copy the selected text into the template
    ;; http://www.howardism.org/Technical/Emacs/journaling-org.html
    (setq org-capture-templates
          '(
            ("j" "Journal Entry" entry
             (file+datetree org-agenda-file-journal)
             "* %?"
             :empty-lines 1)
            ("t" "Todo" entry
             (file+headline org-agenda-file-gtd "Workspace")
             "* TODO [#B] %?\n  %i%^T"
             :empty-lines 1)
            ))


    ;;An entry without a cookie is treated just like priority ' B '.
    ;;So when create new task, they are default 重要且紧急
    (setq org-agenda-custom-commands
          '(
            ("w" . "任务安排")
            ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
            ("wb" "重要且不紧急的任务" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
            ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
            ("b" "Blog" tags-todo "BLOG")
            ("p" . "项目安排")
            ("pw" tags-todo "PROJECT+WORK+CATEGORY=\"work\"")
            ("pl" tags-todo "PROJECT+DREAM+CATEGORY=\"shdennlin\"")
            ("W" "Weekly Review"
             ((stuck "") ;; review stuck projects as designated by org-stuck-projects
              (tags-todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
              ))))
    )
  )

;;; packages.el ends here
