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

(spacemacs/set-leader-keys "od" 'occur-dwim)
(spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)

(spacemacs/declare-prefix  "ot"  "Toggle")
(spacemacs/set-leader-keys "otc" 'vline-mode)
(spacemacs/set-leader-keys "otC" 'vline-global-mode)

(spacemacs/declare-prefix  "oo"  "org-mode")
(spacemacs/set-leader-keys "oot" 'org-start-template)
(spacemacs/set-leader-keys "oos" 'shdennlin-save-org-notes-all-file)
(spacemacs/set-leader-keys "ooj" 'shdennlin-journal-picture)
(spacemacs/set-leader-keys "ooi" 'shdennlin-journal-insert-picture)
(spacemacs/set-leader-keys "oc"  'org-capture)

(spacemacs/declare-prefix  "oh"  "Hugo")
(spacemacs/set-leader-keys "ohs" 'hugo-content-org-start-template)
(spacemacs/set-leader-keys "ohi" 'hugo-content-index_md-template)
(spacemacs/set-leader-keys "ohp" 'hugo-org-instert-section-path)
(spacemacs/set-leader-keys "ohu" 'hugo-copy-service-url-with-current-post)

(spacemacs/declare-prefix  "om"  "MobileOrg")
(spacemacs/set-leader-keys "omp" 'org-mobile-push)
(spacemacs/set-leader-keys "omf" 'org-mobile-pull)

(spacemacs/declare-prefix  "og"  "org-gcal")
(spacemacs/set-leader-keys "ogs" 'org-gcal-sync)
(spacemacs/set-leader-keys "ogd" 'org-gcal-delete-at-point)
(spacemacs/set-leader-keys "ogp" 'org-gcal-post-at-point)

(spacemacs/declare-prefix  "ov"  "vc")
(spacemacs/set-leader-keys "ovu" 'git-config-insert-user)

(define-key evil-normal-state-map (kbd "<RET>") 'spacemacs/evil-search-clear-highlight)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))
