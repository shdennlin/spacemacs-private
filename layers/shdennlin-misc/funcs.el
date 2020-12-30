; -*- lexical-binding: t -*-
;;; funcs.el --- shdennlin-misc Layer packages File for Spacemacs
;;
;; Copyright (c) 2019-2020 shdennlin
;;
;; Author: shdennlin <ShawnDennisLin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun connect-remote ()
  (interactive)
  (dired "/ssh:pi@192.168.12.5:/home/pi/"))
