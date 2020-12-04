; -*- lexical-binding: t -*-
;;; config.el --- Better Emacs Defaults Layer configuration variables File
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Thomas de Beauchêne <thomas.de.beauchene@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(add-hook 'python-mode-hook 'spacemacs/toggle-relative-line-numbers)
(add-hook 'ace-pinyin-mode 'spacemacs/toggle-relative-line-numbers)
(add-hook 'ein:markdown-mode-hook 'spacemacs/toggle-relative-line-numbers)

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


(defvar org-agenda-dir ""
  "gtd org files location")

(defvar deft-dir ""
  "deft org files locaiton")

(defvar blog-admin-dir ""
  "blog-admin files location")

(cond
 ((spacemacs/system-is-mswindows)
  (setq
   org-agenda-dir "d:/org-notes"
   deft-dir "d:/org-notes"
   blog-admin-dir "d:/shdennlin.github.io"))
 ((spacemacs/system-is-linux)
  (setq
   org-agenda-dir "~/org-notes"
   deft-dir "~/org-notes"
   blog-admin-dir "~/shdennlin.github.io"))
 )
