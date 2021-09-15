; -*- lexical-binding: t -*-
;;; keybindings.el --- Better Emacs Defaults Layer key bindings File
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(global-unset-key (kbd "C-SPC"))

(spacemacs/set-leader-keys "od" 'occur-dwim)
(spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)

(spacemacs/declare-prefix  "oe"  "engineering")
(spacemacs/set-leader-keys "oel" 'shdennlin/leetcode-build-environment)

(spacemacs/declare-prefix  "ot"  "Toggle")
(spacemacs/set-leader-keys "otc" 'vline-mode)
(spacemacs/set-leader-keys "otC" 'vline-global-mode)

(spacemacs/declare-prefix  "oo"  "org-mode")
(spacemacs/set-leader-keys "oot" 'org-start-template)
(spacemacs/set-leader-keys "oos" 'shdennlin-save-org-notes-all-file)
(spacemacs/set-leader-keys "ooi" 'shdennlin-journal-insert-picture)
(spacemacs/set-leader-keys "ooc" 'shdennlin/add-clock-log)
(spacemacs/set-leader-keys "oc"  'org-capture)

(spacemacs/declare-prefix  "ow"  "website")
(spacemacs/set-leader-keys "owp" 'manual-instert-file-path-base-content-directory)
(spacemacs/set-leader-keys "owb" 'blog-start-template)
(spacemacs/set-leader-keys "oww" 'wiik-start-template)
(spacemacs/set-leader-keys "owl" 'leetcode-template)

(spacemacs/declare-prefix  "om"  "MobileOrg")
(spacemacs/set-leader-keys "omp" 'org-mobile-push)
(spacemacs/set-leader-keys "omf" 'org-mobile-pull)

(spacemacs/declare-prefix  "og"  "org-gcal")
(spacemacs/set-leader-keys "ogs" 'org-gcal-sync)
(spacemacs/set-leader-keys "ogd" 'org-gcal-delete-at-point)
(spacemacs/set-leader-keys "ogp" 'org-gcal-post-at-point)
(spacemacs/set-leader-keys "ogr" 'org-gcal-request-token)

(spacemacs/declare-prefix  "oq"  "quick-file")
(spacemacs/set-leader-keys "oqu" 'shdennlin-open-UsefulURL)
(spacemacs/set-leader-keys "oqo" 'shdennlin-open-org-note)
(spacemacs/set-leader-keys "oqa" 'shdennlin-open-anki)
(spacemacs/set-leader-keys "oqw" 'shdennlin-open-wiki)
(spacemacs/set-leader-keys "oqb" 'shdennlin-open-blog)
(spacemacs/set-leader-keys "oqk" 'shdennlin-open-work)

(spacemacs/declare-prefix  "ov"  "vc")
(spacemacs/set-leader-keys "ovu" 'git-config-insert-user)

(define-key evil-normal-state-map (kbd "<RET>") 'spacemacs/evil-search-clear-highlight)

(define-key evil-normal-state-map (kbd "zk") 'evil-unimpaired/insert-space-above)
(define-key evil-normal-state-map (kbd "zj") 'evil-unimpaired/insert-space-below)

(global-set-key (kbd "<f9>") 'spacemacs/kill-this-buffer)
