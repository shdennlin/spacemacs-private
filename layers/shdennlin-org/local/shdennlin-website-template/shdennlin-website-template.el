;;; funcs.el --- shdennlin-o014_Longest_Common_Prefixgest_Common_Prefixr packages File for Spacemacs
;;
;; Copyright (c) 2019-2021 shdennlin
;;
;; Author: shdennlin <ShawnDennisLin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun insert-file-name-func()
  "read file name and insert to current location
example:
.014_Longest_Common_Prefix.org => 014_Longest_Common_Prefix"
  (let*
      ((perpath (spacemacs/copy-buffer-name))
       (path (string-trim-right perpath ".org"))
       (path (string-trim-left path ".")))
    (insert path)
    ))

(defun instert-file-path-base-content-directory-func()
  " instert file path
NOTE: base directory: <project root directory/content>"
  (let*
      ((perpath (spacemacs/projectile-copy-directory-path))
       (path (string-trim-left perpath "content")))
    (insert path)
    ))

(defun manual-instert-file-path-base-content-directory()
  " instert file path manual (will kill-line after courser)
NOTE: base directory: <project root directory/content>"
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
  "#+EXPORT_FILE_NAME:\t index\n"
  "#+TITLE:\t\n"
  "#+AUTHOR:\tShawn Dennis Lin\n"
  "#+EMAIL:\tShawnDennisLin@gmail.com\n"
  "#+DATE:\t" '(org-time-stamp-inactive) "\n"
  "#+HUGO_AUTO_SET_LASTMOD: t\n"
  "\n"
  "#+hugo_custom_front_matter: :description\n"
  "#+hugo_custom_front_matter: :math false\n"
  "#+hugo_custom_front_matter: :slug " '(insert-file-name-func) "\n"
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
  "#+EXPORT_FILE_NAME:\t" '(insert-file-name-func) "\n"
  "#+TITLE:\t\n"
  "#+AUTHOR:\tShawn Dennis Lin\n"
  "#+EMAIL:\tShawnDennisLin@gmail.com\n"
  "#+DATE:\t" '(org-time-stamp-inactive) "\n"
  "#+HUGO_AUTO_SET_LASTMOD: t\n"
  "\n"
  )

(defun leetcode-build-org-title-func()
  "build leetcode org title from file-nae

example:
.014_Longest_Common_Prefix.org
to
014. Longest Common Prefix"
  (let*
      ((perpath (spacemacs/copy-buffer-name))
       (file-name (string-trim-right perpath ".org"))
       (file-name (string-trim-left file-name "."))
       (file-name (replace-regexp-in-string "_" " " file-name))
       (file-name (concat (substring file-name 0 3) "." (substring file-name 3 nil)))
       )
    (insert file-name)
    ))

(defun leetcode-build-org-question-link-func()
  "build leetcode org question link from file-name

example:
014_Longest_Common_Prefix
to
https://leetcode.com/problems/longest-common-prefix/"
  (let*
      ((perpath (spacemacs/copy-buffer-name))
       (file-name (string-trim-right perpath ".org"))
       (file-name (string-trim-left file-name "."))
       (file-name (replace-regexp-in-string "_" "-" file-name))
       (file-name (substring file-name 4 nil))
       (file-name (downcase file-name))
       )
    (insert (concat "https://leetcode.com/problems/" file-name "/"))
    )
  )

(defun leetcode-build-org-solutionlink-func()
  "build leetcode org solution link from file-name

example:
014_Longest_Common_Prefix
to
[[https://github.com/shdennlin/leetcode/blob/main/content/.solution_record/python3/014_Longest_Common_Prefix.py][014 Longest Common Prefix.py]] "
  (let*
      ((perpath (spacemacs/copy-buffer-name))
       (file-name (string-trim-right perpath ".org"))
       (file-name (string-trim-left file-name "."))
       (link-name (concat file-name ".py"))
       (description (replace-regexp-in-string "_" " " file-name))
       (description (concat description ".py"))
       (link (concat "[[https://github.com/shdennlin/leetcode/blob/main/content/.solution_record/python3/" link-name "][" description "]]"))
       )
    (insert link)
    )
  )

(define-skeleton leetcode-template
  ""
  ""
  "#+STARTUP: content
#+OPTIONS: \\n:t
#+OPTIONS: toc:nil\n"
  "\n"
  "#+EXPORT_FILE_NAME:\t" '(insert-file-name-func) "\n"
  "\n"
  "#+TITLE:\tLeetCode " '(leetcode-build-org-title-func) "\n"
  "#+AUTHOR:\tShawn Dennis Lin\n"
  "#+EMAIL:\tShawnDennisLin@gmail.com\n"
  "#+DATE:\t" '(shdennlin/insert-current-date-time) "\n"
  "\n"
  "* LeetCode " '(leetcode-build-org-title-func) "\n"
  "\n"
  "Question link: " '(leetcode-build-org-question-link-func) "\n"
  "
** Solution

{% mdtabs title=\"Python\" %}
#+begin_src python
#+end_src
{% endmdtabs %}

My Solution Link: " '(leetcode-build-org-solutionlink-func)
  )

(provide 'shdennlin-website-template)
