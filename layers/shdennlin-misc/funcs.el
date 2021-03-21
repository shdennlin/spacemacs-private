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

(defun shdennlin-open-blog ()
  (interactive)
  (spacemacs/counsel-find-file (concat blog-admin-dir "/content/posts/"))
  )

(defun shdennlin-open-org-note ()
  (interactive)
  (spacemacs/counsel-find-file org-agenda-dir)
  )

(defun shdennlin-open-UsefulURL ()
  (interactive)
  (find-file (concat org-agenda-dir "/UsefulURL.org"))
  )

(defun shdennlin-open-anki ()
  (interactive)
  (spacemacs/counsel-find-file (concat org-agenda-dir "/anki/"))
  )

(defun shdennlin-open-wiki ()
  (interactive)
  (dired wiki-dir)
  (counsel-projectile-find-file)
  )

(defun shdennlin-open-work ()
  (interactive)
  ;; (spacemacs/counsel-find-file (concat work-dir "/work-note.org"))
  (find-file (concat work-dir "/work-note.org"))
  )
