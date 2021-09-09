;;; funcs.el --- shdennlin-org Layer packages File for Spacemacs
;;
;; Copyright (c) 2019-2021 shdennlin
;;
;; Author: shdennlin <ShawnDennisLin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun hugo-instert-file-name-func()
  (interactive)
  (let*
      ((perpath (spacemacs/copy-buffer-name))
       (path (string-trim-right perpath ".org"))
       (path (string-trim-left path ".")))
    (insert path)
    ))

(defun hugo-instert-section-path-func()
  (interactive)
  (let*
      ((perpath (spacemacs/projectile-copy-directory-path))
       (path (string-trim-left perpath "content")))
    (insert path)
    ))

(defun hugo-instert-section-path()
  (interactive)
  (let*
      ((perpath (spacemacs/projectile-copy-directory-path))
       (path (string-trim-left perpath "content")))
    (kill-line)
    (insert path)
    (message path)
    ))

(define-skeleton blog-start-template
  ""
  ""
  "#+STARTUP: content\n"
  "#+OPTIONS: \\n:t\n"
  "\n"
  "#+HUGO_BASE_DIR: ~/shdennlin-wiki/blog.shdennlin.com\n"
  "#+HUGO_SECTION: " '(hugo-instert-section-path-func) "\n"
  "#+EXPORT_FILE_NAME:\t index\n"
  "\n"
  "#+TITLE:\t\n"
  "#+AUTHOR:\tShawn Dennis Lin\n"
  "#+EMAIL:\tShawnDennisLin@gmail.com\n"
  "#+DATE:\t" '(org-time-stamp-inactive) "\n"
  "#+HUGO_AUTO_SET_LASTMOD: t\n"
  "\n"
  "#+hugo_custom_front_matter: :description\n"
  "#+hugo_custom_front_matter: :math false\n"
  "#+hugo_custom_front_matter: :slug " '(hugo-instert-file-name-func) "\n"
  "#+hugo_custom_front_matter: :image\n"
  "\n" 
  "#+HUGO_CATEGORIES: \n"
  "#+HUGO_TAGS: \n"
  "\n"
  )

(define-skeleton wiik-start-template
  ""
  ""
  "#+STARTUP: overview\n"
  "#+OPTIONS: \\n:t\n"
  "\n"
  "#+HUGO_BASE_DIR: ~/shdennlin-wiki/wiki.shdennlin.com\n"
  "#+HUGO_SECTION: " '(hugo-instert-section-path-func) "\n"
  "#+EXPORT_FILE_NAME:\t" '(hugo-instert-file-name-func) "\n"
  "\n"
  "#+TITLE:\t\n"
  "#+AUTHOR:\tShawn Dennis Lin\n"
  "#+EMAIL:\tShawnDennisLin@gmail.com\n"
  "#+DATE:\t" '(org-time-stamp-inactive) "\n"
  "\n"
  )

(define-skeleton leetcode-start-template
  ""
  ""
  "#+STARTUP: content\n"
  "#+OPTIONS: \\n:t\n"
  "\n"
  "#+HUGO_BASE_DIR: ~/shdennlin-wiki/leetcode.shdennlin.com\n"
  "#+HUGO_SECTION: " '(hugo-instert-section-path-func) "\n"
  "#+EXPORT_FILE_NAME:\t" '(hugo-instert-file-name-func) "\n"
  "\n"
  "#+TITLE:\t\n"
  "#+AUTHOR:\tShawn Dennis Lin\n"
  "#+EMAIL:\tShawnDennisLin@gmail.com\n"
  "#+DATE:\t" '(org-time-stamp-inactive) "\n"
  "\n"
  )

(provide 'shdennlin-hugo-template)
