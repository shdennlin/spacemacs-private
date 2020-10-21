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
  "#+TITLE:\n"
  "#+AUTHOR:\tShawn Dennis Lin\n"
  "#+EMAIL:\tShawnDennisLin@gmail.com\n"
  "#+DATE:\t" '(org-time-stamp-inactive) "\n"
  )
