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
    ;; http://www.howardism.org/Technical/Emacs/journaling-org.html
    (setq org-capture-templates
          '(
            ("j" "Journal Entry"
             entry (file+datetree "~/journal.org")
             "* %?"
             :empty-lines 1)
            ))
    )
  )

;;; packages.el ends here
