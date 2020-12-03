; -*- lexical-binding: t -*-
;;; packages.el --- shdennlin-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2019-202 shdennlin
;;
;; Author: Shawn Dennis Lin <ShawnDennisLin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst shdennlin-org-packages
  '(
    (org :location built-in)
    ;; org-pomodoro
    )
  )

(defun shdennlin/post-init-org()
  (setq system-time-locale "C") ;; let date language be English
  (setq org-startup-indented t)
  (setq org-emphasis-alist
        (quote
         (("*" bold)
          ("/" italic)
          ("_" underline)
          ("=" org-code verbatim)
          ("~" org-code verbatim)
          ("+"
           (:strike-through t)))))
  (setq org-edit-src-content-indentation 0)
  )
