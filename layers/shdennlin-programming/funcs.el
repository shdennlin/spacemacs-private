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

(defun shdennlin/c++-compile&run ()
  (interactive)
    (save-buffer)
    (setq shdennlin-c++-buffer (file-name-base))
    (add-hook 'compilation-finish-functions 'shdennlin//c++-run)
    ;; compile
    (message "INFO: %s" (format "g++ %s.cpp -o %s.out" (file-name-base) (file-name-base)))
    (compile (format "g++ %s.cpp -o %s.out" (file-name-base) (file-name-base)))
    )

(defun shdennlin//c++-run (buffer msg)
  (when (string= msg "finished\n")
    (message "INFO: compile %s " (format "./%s.out" shdennlin-c++-buffer))
    (compile (format "./%s.out" shdennlin-c++-buffer))
    )
  (remove-hook 'compilation-finish-functions 'shdennlin//c++-run)
  )

