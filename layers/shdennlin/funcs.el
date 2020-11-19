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

(define-skeleton org-hugo-start-template
  "Header info for a emacs-org file."
  "Title:"
  "#+STARTUP: content\n"
  "#+TITLE:\t\n"
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
  "#+HUGO_BASE_DIR: \n"
  "#+HUGO_SECTION: /posts/\n"
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

(define-skeleton org-hugo-_index-template
  "Header info for a emacs-org file."
  "Title:"
  "#+TITLE:\t\n"
  "#+HUGO_BASE_DIR: \n"
  "#+HUGO_SECTION: /posts/\n"
  "#+hugo_menu: :menu sidebar :name  :identifier :parent :weight auto\n"
  )
