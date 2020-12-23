; -*- lexical-binding: t -*-
;;; packages.el --- shdennlin-misc layer packages file for Spacemacs.
;;
;; Copyright (c) 2019-2020 shdennlin
;;
;; Author: shdennlin <ShawnDennisLin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst shdennlin-misc-packages
  '(
    evil-escape
    prodigy
    search-engine
    tabs
    )
  )

(defun shdennlin-misc/post-init-evil-escape ()
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2)
  )

(defun shdennlin-misc/post-init-prodigy()
  (setq my_computer_ipv4_address
        (substring
         (shell-command-to-string "hostname -I | cut -d' ' -f 1")
         0 -1))

  (prodigy-define-service
    :name "Hugo Personal Blog"
    :command "hugo"
    :args '("server" "-t" "toha" "-w")
    :cwd "~/shdennlin.github.io/"
    :tags '(personal)
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t
    :url "http://localhost:1313/posts")

  (prodigy-define-service
    :name "Hugo Personal Blog(WSL)"
    :command "hugo"
    :args (list "server" "-t" "toha" "-w" "--bind" my_computer_ipv4_address (concat "--baseURL=http://" my_computer_ipv4_address) "-D" "-p" "51000")
    :cwd "~/shdennlin.github.io/"
    :tags '(personal)
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t
    :url (concat "http://" my_computer_ipv4_address ":51000/posts"))
  )

(defun shdennlin-misc/post-init-search-engine()
  (setq browse-url-browser-function 'browse-url-generic
        engine/browser-function 'browse-url-generic
        browse-url-generic-program "google-chrome")
  )

(defun shdennlin-misc/post-init-tabs()
  (setq centaur-tabs-style "bar"
	      centaur-tabs-set-icons t
	      centaur-tabs-set-modified-marker t
	      centaur-tabs-show-navigation-buttons t
	      centaur-tabs-set-bar 'under
	      x-underline-at-descent-line t)
  )
;;; packages.el ends here
