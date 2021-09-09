; -*- lexical-binding: t -*-
;;; funcs.el --- shdennlin-org Layer packages File for Spacemacs
;;
;; Copyright (c) 2019-2021 shdennlin
;;
;; Author: shdennlin <ShawnDennisLin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(define-skeleton org-start-template
  "Header info for a emacs-org file."
  "Title:"
  "#+STARTUP: content\n"
  "#+TITLE:\t\n"
  "#+AUTHOR:\tShawn Dennis Lin\n"
  "#+EMAIL:\tShawnDennisLin@gmail.com\n"
  "#+DATE:\t" '(org-time-stamp-inactive) "\n"
  )

(defun shdennlin-save-org-notes-all-file ()
  (interactive)
  (spacemacs/find-file-split (concat org-agenda-dir "/."))
  (projectile-save-project-buffers)
  (spacemacs/delete-window)
  )

(defun shdennlin-journal-insert-picture()
  (interactive)
  (let ((current-day-path (concat "[["
                                  "journal-picture-dir:/"
                                  (format-time-string "%Y/")
                                  (format-time-string "%Y-%m-%d-%A")
                                  ".jpg"
                                  "]]")))
    (insert current-day-path)
 ))

(defun shdennlin/add-clock-log()
  (interactive)
  (insert "CLOCK: ")
  (org-time-stamp-inactive)
  (insert "--")
  (org-time-stamp-inactive)
  (org-evaluate-time-range)
  )

