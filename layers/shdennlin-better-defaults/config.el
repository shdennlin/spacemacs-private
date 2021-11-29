; -*- lexical-binding: t -*-
;;; config.el --- shdennlin-better-defaults Layer packages File for Spacemacs
;;
;; Copyright (c) 2019-2020 shdennlin
;;
;; Author: shdennlin <ShawnDennisLin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


(show-paren-mode t)
(setq tramp-default-method "ssh")

(cond ((eq system-type 'windows-nt)
       (setq browse-url-firefox-program "C:/Program Files/Mozilla Firefox/firefox.exe")
       (setq browse-url-generic-program "C:/Program Files/Mozilla Firefox/firefox.exe"
             browse-url-browser-function 'browse-url-generic)

       )
      ((eq system-type 'gnu/linux)
       (setq browse-url-firefox-program "~/app/Firefox/firefox")
       (setq browse-url-browser-function 'browse-url-firefox)

       )
      ((eq system-type 'darwin)
       (setq browse-url-browser-function 'browse-url-firefox)
       ))
