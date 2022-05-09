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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-capture
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cond
 ((spacemacs/system-is-mswindows)
  (defvar website-basedir "d:/shdennlin-wiki/website/")
  (defvar base-dir "d:/")
  (defvar daily-translate-basedir "d:/")
  )
 ((or (spacemacs/system-is-linux) (spacemacs/system-is-mac))
  (defvar website-basedir "~/shdennlin-wiki/website/")
  (defvar base-dir "~/")
  (defvar daily-translate-basedir "~/engineering/program_desing/python/ahk/output/")
  ))

(defvar org-agenda-dir "" "gtd org files location")
(defvar deft-dir "" "deft org files location")
(defvar blog-dir "" "personal blog files location")
(defvar wiki-dir "" "personal wiki files location")
(defvar leetcode-dir "" "personal leetcode files location")
(defvar work-dir "" "personal work note location")
(defvar journal-picture-dir "" "my journal picture location")

(setq
 org-agenda-dir      (concat website-basedir "org-notes")
 blog-dir            (concat website-basedir "blog.shdennlin.com")
 wiki-dir            (concat website-basedir "wiki.shdennlin.com")
 leetcode-dir        (concat website-basedir "leetcode.shdennlin.com")
 work-dir            (concat base-dir        "work")
 ;; journal-picture-dir "d:/gdrive-ga4567896/journal-picture"
 )
