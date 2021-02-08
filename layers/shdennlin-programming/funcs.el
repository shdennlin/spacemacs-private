; -*- lexical-binding: t -*-
;;; funcs.el --- shdennlin-programming Layer packages File for Spacemacs
;;
;; Copyright (c) 2019-2020 shdennlin
;;
;; Author: shdennlin <ShawnDennisLin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(define-skeleton git-config-insert-user
  "add git config [user]"
  "insert [user]"
  "[user]\n"
	"\temail = shawndennislin@gmail.com\n"
	"\tname = Shawn Dennis Lin\n"
	"\tusername = shdennlin"
  )
