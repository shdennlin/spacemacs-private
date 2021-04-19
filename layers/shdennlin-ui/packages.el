; -*- lexical-binding: t -*-
;;; packages.el --- shdennlin-ui layer packages file for Spacemacs.
;;
;; Copyright (c) 2019-2020 shdennlin
;;
;; Author: shdennlin <ShawnDennisLin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst shdennlin-ui-packages
  '(
    (vline :location local)
    dired
    )
  )

(defun shdennlin-ui/init-vline ()
  (use-package vline
    :config
    ;; if you want to change color, you can use below to get color ==>>
    ;; (face-attribute hl-line-face :background)
    (set-face-background vline-face "#44475a")
    ))

(defun shdennlin-ui/post-init-dired ()
  (setq dired-listing-switches "-alh")
  )
;;; packages.el ends here
