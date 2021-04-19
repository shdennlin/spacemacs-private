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

(defvar org-agenda-dir "" "gtd org files location")
(defvar deft-dir "" "deft org files location")
(defvar blog-admin-dir "" "blog-admin files location")
(defvar wiki-dir "" "personal wiki files location")
(defvar work-dir "" "personal work note location")
(defvar journal-picture-dir "" "my journal picture location")

(cond
 ((spacemacs/system-is-mswindows)
  (setq
   org-agenda-dir "d:/org-notes"
   deft-dir "d:/org-notes"
   blog-admin-dir "~/shdennlin.github.io"
   wiki-dir "d:/shdennlin-wiki/wiki-note"
   work-dir "d:/work"
   journal-picture-dir "d:/gdrive-ga4567896/journal-picture"
   ))
 ((spacemacs/system-is-linux)
  (setq
   org-agenda-dir "~/org-notes"
   deft-dir "~/org-notes"
   blog-admin-dir "~/shdennlin.github.io"
   wiki-dir "~/shdennlin-wiki/wiki-note"
   work-dir "~/work"
   journal-picture-dir "~/gdrive-ga4567896/journal-picture"
   ))
 ((spacemacs/system-is-mac)
  (setq
   org-agenda-dir "~/org-notes"
   deft-dir "~/org-notes"
   blog-admin-dir "~/shdennlin.github.io"
   wiki-dir "~/shdennlin-wiki/wiki-note"
   work-dir "~/work"
   journal-picture-dir "~/gdrive-ga4567896/journal-picture"
   ))
 )
