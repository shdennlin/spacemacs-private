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
