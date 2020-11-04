;;; packages.el --- shdennlin layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:  <shdennlin@SHAWN-NB>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `shdennlin-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `shdennlin/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `shdennlin/pre-init-PACKAGE' and/or
;;   `shdennlin/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst shdennlin-packages
  '(
    company
    elpy
    evil-escape
    ipython-notebook
    org
    (vline :location local)
    )
  )

;(require 'vline)

(defun shdennlin/init-elpy()
  (use-package elpy
    :ensure t
    :init
    (elpy-enable)
    )
  )

(defun shdennlin/post-init-evil-escape ()
  (setq evil-escape-key-sequence "jk")
  (setq evil-escape-delay 0.2)
  )


(defun shdennlin/post-init-ipython-notebook ()
  (cond
   ((string-equal system-type "windows-nt")
    (progn
      (setq jupyter-server-command "~/../../anaconda3/envs/tf-gpu/Scripts/jupyter")
      ))
   ((string-equal system-type "darwin") ;  macOS
    (progn
      ))
   ((string-equal system-type "gnu/linux")
    (progn
      (setq jupyter-server-command "/home/shawn/anaconda3/envs/tf-gpu/bin/jupyter")
      )))

  (setq output-area-inlined-images t)
  )

;; Add the relevant packages to the layer
(setq python-packages
      '(company
        (company-anaconda :toggle (configuration-layer/package-usedp 'company))))

(defun shdennlin/post-init-company ()
  (progn
    (setq company-dabbrev-code-other-buffers 'all)
    ;; enable dabbrev-expand in company completion https://emacs-china.org/t/topic/6381
    (setq company-dabbrev-char-regexp "[\\.0-9a-z-_'/]")

    (when (configuration-layer/package-usedp 'company)
      (spacemacs|add-company-backends :modes shell-script-mode makefile-bsdmake-mode sh-mode lua-mode nxml-mode conf-unix-mode json-mode graphviz-dot-mode js2-mode js-mode))

  ))

(defun shdennlin/init-vline ()
  (use-package vline
    :config
    ;; if you want to change color, you can use below to get color ==>>
    ;; (face-attribute hl-line-face :background)
    (set-face-background vline-face "#44475a")
    ))


(defun shdennlin/post-init-org()
  (setq system-time-locale "C") ;; let date language be English
  (setq org-startup-indented t)
  (setq org-emphasis-alist
    (quote
     (("*" bold)
      ("/" italic)
      ("_" underline)
      ("=" org-code verbatim)
      ("~" org-code verbatim)
      ("+"
       (:strike-through t)))))
  (setq org-edit-src-content-indentation 0)
  )

;;; packages.el ends here
