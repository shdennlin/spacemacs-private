; -*- lexical-binding: t -*-
;;; packages.el --- shdennlin layer packages file for Spacemacs.
;;
;; Copyright (c) 2019-2020 shdennlin
;;
;; Author: shdennlin <ShawnDennisLin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst shdennlin-packages
  '(
    (shdennlin-privacy :location local)
    ))

(defun shdennlin/init-shdennlin-privacy ()
  "Initialize shdennlin-account"
  (if (file-exists-p "./local/shdennlin-privacy")
    (use-package shdennlin-privacy
      :init
      )
    )
  )
