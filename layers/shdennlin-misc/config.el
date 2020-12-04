; -*- lexical-binding: t -*-
;;; config.el --- shdennlin-misc Layer packages File for Spacemacs
;;
;; Copyright (c) 2019-2020 shdennlin
;;
;; Author: shdennlin <ShawnDennisLin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table
  '(
    ("zme"   "shdennlin")
    ("zmm"   "ShawnDennisLin@gmail.com")
    ("zmu"   "http://shdennlin.githug.io")

    ;; emacs regex
    ("zd"    "\\([0-9]+?\\)")
    ("zstr"  "\\([^\"]+?\\)\"")
    ))
(setq save-abbrevs 'silently)
(setq abbrev-file-name "~/.emacs_abbrev.el")
