; -*- lexical-binding: t -*-
;;; packages.el --- shdennlin-programming layer packages file for Spacemacs.
;;
;; Copyright (c) 2019-2020 shdennlin
;;
;; Author: shdennlin <ShawnDennisLin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst shdennlin-programming-packages
  '(
    company
    ipython-notebook
    java
    )
  )

(defun shdennlin-programming/post-init-ipython-notebook ()
  ;; (cond
  ;;  ((string-equal system-type "windows-nt")
  ;;   (progn
  ;;     (setq jupyter-server-command "~/../../anaconda3/envs/tf-gpu/Scripts/jupyter")
  ;;     ))
  ;;  ((string-equal system-type "darwin") ;  macOS
  ;;   (progn
  ;;     ))
  ;;  ((string-equal system-type "gnu/linux")
  ;;   (progn
  ;;     (setq jupyter-server-command "/home/shawn/anaconda3/envs/tf-gpu/bin/jupyter")
  ;;     )))

  (setq output-area-inlined-images t)
  )

(defun shdennlin-programming/post-init-java ()
  (progn
    (setq lsp-java-java-path "C:/Program Files/Java/jdk-15.0.2/bin/java")
    (setq lsp-java-workspace-dir "D:/work/java/01_emacs_test")
    ))

(defun shdennlin-programming/post-init-company ()
  (progn
    (setq company-dabbrev-code-other-buffers 'all)
    ;; enable dabbrev-expand in company completion https://emacs-china.org/t/topic/6381
    (setq company-dabbrev-char-regexp "[\\.0-9a-z-_'/]")

    (when (configuration-layer/package-usedp 'company)
      (spacemacs|add-company-backends :modes shell-script-mode makefile-bsdmake-mode sh-mode lua-mode nxml-mode conf-unix-mode json-mode graphviz-dot-mode js2-mode js-mode))

    ))

;;; packages.el ends here

;; (if (spacemacs/system-is-mswindows)
;;     (setq
;;      org-agenda-dir "d:/org-notes"
;;      deft-dir "d:/org-notes"
;;      blog-admin-dir "d:/zilongshanren.com")
;;   (setq
;;    org-agenda-dir "~/org-notes"
;;    deft-dir "~/org-notes"
;;    blog-admin-dir "~/zilongshanren.com"))
