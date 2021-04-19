; -*- lexical-binding: t -*-
;;; funcs.el --- zilongshanren Layer packages File for Spacemacs
;;
;; Copyright (c) 2019-2020 shdennlin
;;
;; Author: shdennlin <ShawnDennisLin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(define-skeleton org-start-template
  "Header info for a emacs-org file."
  "Title:"
  "#+STARTUP: content\n"
  "#+TITLE:\t\n"
  "#+AUTHOR:\tShawn Dennis Lin\n"
  "#+EMAIL:\tShawnDennisLin@gmail.com\n"
  "#+DATE:\t" '(org-time-stamp-inactive) "\n"
  )

(defun hugo-org-instert-file-name-func()
  "insert file-name to org-file which use to write blog and backend is hugo

org-file location must to as same as markdown file"
  (let*
      ((perpath (spacemacs/copy-buffer-name))
       (path (string-trim-right perpath ".org"))
       (path (string-trim-left path ".")))
    (insert path)
    ))

(defun hugo-org-instert-section-path-func()
  "insert path to org-file which use to write blog and backend is hugo

org-file location must to as same as markdown file"
  (interactive)
  (let*
      ((perpath (spacemacs/projectile-copy-directory-path))
       (path (string-trim-left perpath "content")))
    (insert path)
    ))

(defun hugo-org-instert-section-path()
  "insert path to org-file which use to write blog and backend is hugo

org-file location must to as same as markdown file"
  (interactive)
  (let*
      ((perpath (spacemacs/projectile-copy-directory-path))
       (path (string-trim-left perpath "content")))
    (kill-line)
    (insert path)
    (message path)
    ))

(define-skeleton hugo-content-org-start-template
  "Header info for a emacs-org file."
  "Title:"
  "#+STARTUP: content\n"
  "#+OPTIONS: \\n:t\n"
  "#+TITLE:\t\n"
  "#+EXPORT_FILE_NAME:\t" '(hugo-org-instert-file-name-func) "\n"
  "#+AUTHOR:\tShawn Dennis Lin\n"
  "#+EMAIL:\tShawnDennisLin@gmail.com\n"
  "#+DATE:\t" '(org-time-stamp-inactive) "\n"
  "\n"
  "#+HUGO_WEIGHT: auto\n"
  "#+HUGO_AUTO_SET_LASTMOD: t\n"
  "\n"
  "#+SEQ_TODO: TODO DRAFT DONE\n"
  "#+PROPERTY: header-args :eval no\n"
  "\n"
  "#+HUGO_BASE_DIR: ~/shdennlin.github.io\n"
  "#+HUGO_SECTION: " '(hugo-org-instert-section-path-func) "\n"
  "\n"
  "#+hugo_menu: :menu sidebar :name  :identifier  :parent :weight auto\n"
  "#+HUGO_CATEGORIES: \n"
  "#+HUGO_TAGS: \n"
  "#+HUGO_DRAFT: false\n"
  "#+hugo_custom_front_matter: :hero \n"
  "\n"
  "\n"
  "#+HUGO: more\n"
  )

(define-skeleton hugo-content-index_md-template
  "template in _index.md for Hugo"
  "Title:"
  "+++\n"
  "title = \"\"\n"
  "draft = false\n"
  "[menu.sidebar]\n"
  "  weight = \"auto\"\n"
  "  identifier = \"\"\n"
  "  name = \"\"\n"
  "  parent = \"\"\n"
  "+++"
  )

(defun hugo-copy-service-url-with-current-post()
  (interactive)
  (let*
      ((ipv4_address (substring (shell-command-to-string "hostname -I | cut -d' ' -f 1") 0 -1))
       (full_path (spacemacs/projectile-copy-directory-path))
       (section_path (string-trim-left full_path "content"))
       (file_name (spacemacs/copy-buffer-name))
       (file_name (string-trim-right file_name ".org"))
       (file_name (string-trim-left file_name "."))
       (full_path (concat "http://" ipv4_address ":51000" section_path file_name))
       )
    (kill-new full_path)
    (message full_path)
    )
  )

(defun shdennlin-save-org-notes-all-file ()
  (interactive)
  (spacemacs/find-file-split (concat org-agenda-dir "/."))
  (projectile-save-project-buffers)
  (spacemacs/delete-window)
  )

(defun shdennlin-journal-insert-picture()
  (interactive)
  (let ((current-day-path (concat "[["
                                  "journal-picture-dir:/"
                                  (format-time-string "%Y/")
                                  (format-time-string "%Y-%m-%d-%A")
                                  ".jpg"
                                  "]]")))
    (insert current-day-path)
 ))

(defun shdennlin/add-clock-log()
  (interactive)
  (insert "CLOCK: ")
  (org-time-stamp-inactive)
  (insert "--")
  (org-time-stamp-inactive)
  (org-evaluate-time-range)
  )

