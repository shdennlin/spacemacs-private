; -*- lexical-binding: t -*-
;;; config.el --- shdennlin-programming Layer packages File for Spacemacs
;;
;; Copyright (c) 2019-2020 shdennlin
;;
;; Author: shdennlin <ShawnDennisLin@gmail.com>
;; URL: https://github.com/shdennlin/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Add the relevant packages to the layer
(setq python-packages
      '(company
        (company-anaconda :toggle (configuration-layer/package-usedp 'company))))

(add-hook 'java-mode-hook #'lsp)
;; (add-hook 'lsp-mode-hook #'lsp-lens-mode)
;; (add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)

(add-hook 'python-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends) '((company-anaconda company-dabbrev-code) company-dabbrev))))
