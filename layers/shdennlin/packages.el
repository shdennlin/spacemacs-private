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
    (shdennlin-account :location local)
    ))

(message "shdennlin-test-pre")

(defun shdennlin/post-init-shdennlin-account ()
  (use-package shdennlin-account
    :ensure t
    :init (message "Load shdennlin-account info")
    (error "Load shdennlin-account info error")
    ))

(message "shdennlin-test-end")
