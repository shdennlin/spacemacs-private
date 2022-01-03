; -*- lexical-binding: t -*-
;;; packages.el --- shdennlin-programming layer packages file for Spacemacs.
;;
;; Copyright (c) 2019-2020 shdennlin
;;
;; Author: shdennlin <ShawnDennisLin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst shdennlin-programming-packages
  '(
    company
    grip-mode
    python
    highlight-indent-guides
    )
  )

(defun shdennlin-programming/post-init-company ()
  (setq company-dabbrev-code-other-buffers 'all)
  ;; enable dabbrev-expand in company completion https://emacs-china.org/t/topic/6381
  (setq company-dabbrev-char-regexp "[\\.0-9a-z-_'/]")
  ;; Trigger completion immediately.
  (setq company-idle-delay 0)
  ;; Number the candidates (use M-1, M-2 etc to select completions).
  (setq company-show-numbers t)
  )

(defun shdennlin-programming/post-init-python ()
  (spacemacs|add-company-backends
    :backends company-anaconda
    :modes python-mode)
  )

(defun shdennlin-programming/post-init-grip-mode ()
  (setq grip-github-user "shdennlin")
  (setq grip-github-password shdennlin-grip-github-password)
  (setq grip-update-after-change nil)
  (setq grip-preview-use-webkit t)
  )

(defun shdennlin-programming/pre-init-highlight-indent-guides ()
  ;; (setq highlight-indent-guides-method 'character)
  ;; (setq highlight-indent-guides-responsive 'stack)
  )
;;; packages.el ends here
