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

(defun shdennlin/insert-current-date-time ()
  (insert (format-time-string "[%Y-%m-%d %a]" (current-time)))
  )

(defun shdennlin/leetcode-build-environment (file-name)
  (interactive "sEnter file name: ")
  (let*
      (
       (q1 (car (split-string file-name "\\.")))
       (q2 (car (last (split-string file-name "\\.") nil)))
       (qnumber (string-to-number q1))
       (q1 (format "%03d" (string-to-number q1)))
       (file-name (concat q1 q2))
       (file-name (replace-regexp-in-string " " "_" file-name))
       (py-file-name (concat file-name ".py"))
       (py-file-path (concat leetcode-dir "/content/.solution_record/python3/" py-file-name))
       (org-file-name (concat "." file-name ".org"))
       (org-file-dir (concat leetcode-dir "/content/"))
       )

    ;; build org file
    (kill-new org-file-name)
    (counsel-find-file "" org-file-dir)
    (leetcode-template)
    (save-buffer)

    ;; build py file
    (spacemacs/find-file-split py-file-path)
    (spacemacs/toggle-maximize-buffer)
    (company-mode -1)
    (flycheck-mode -1)
    (pyvenv-workon "py39")
    (insert "from typing import List\n\n")
    (insert "if __name__ == '__main__':\n\ts = Solution()\n\tprint()")
    (save-buffer)
    (goto-line 2)

    ;; open leetcode-description buffer
    (leetcode)
    (sit-for 10)
    (quit-window)
    (sit-for 1)
    (leetcode-show-problem qnumber)
    (sit-for 6)

    ;; back to py file
    (winum-select-window-1)
    ))

(defun shdennlin/leetcode-quick-python ()
  (interactive)
  (let*
      ((file-name "/tmp/leetcode-temp.py"))
    ;; ;; build py file
    (write-region "" nil file-name)
    (spacemacs/find-file-split file-name)
    (spacemacs/toggle-maximize-buffer)
    (company-mode -1)
    (flycheck-mode -1)
    (pyvenv-workon "py39")
    (insert "from typing import List\n\n")
    (insert "if __name__ == '__main__':\n\ts = Solution()\n\tprint()")
    (save-buffer)
    (goto-line 2)
    ))

(defun shdennlin//shell-command-to-buffer (command buffer-name)
  "Run a `command' and append its output to buffer `buffer-name'."
  (with-current-buffer (get-buffer-create buffer-name)
    (goto-char (point-max))
    (insert (shell-command-to-string command))))
