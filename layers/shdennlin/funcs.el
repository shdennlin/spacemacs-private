; -*- lexical-binding: t -*-
;;; keybindings.el --- zilongshanren Layer packages File for Spacemacs
;;
;; Copyright (c) 2015-2016 shdennlin
;;
;; Author: shdennlin <shdennlin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; dwin = do what I mean
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

(defun show-markdown-dwim ()
  (interactive)
  ;; (call-interactively 'ein:worksheet-toggle-cell-type-km)
  (call-interactively 'spacemacs/evil-insert-line-below)
  (call-interactively 'evil-join)
  (call-interactively 'ein:worksheet-goto-next-input-km)
  )

(defun toggle-relative-line-numbers-in-ein ()
  (interactive)
  (call-interactively 'spacemacs/toggle-relative-line-numbers-on)
  (call-interactively 'ein:worksheet-goto-next-input-km)
  (call-interactively 'spacemacs/toggle-relative-line-numbers-on)
  (call-interactively 'ein:worksheet-goto-next-input-km)
  ;; (call-interactively 'spacemacs/toggle-relative-line-numbers-on)
  )

(defun connect-remote ()
  (interactive)
  (dired "/ssh:pi@192.168.12.5:/home/pi/"))

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
  (interactive)
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

