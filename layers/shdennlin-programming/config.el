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
