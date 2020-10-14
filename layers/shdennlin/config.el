;;; config.el --- Better Emacs Defaults Layer configuration variables File
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Thomas de Beauchêne <thomas.de.beauchene@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(add-hook 'python-mode-hook 'spacemacs/toggle-relative-line-numbers)
(add-hook 'ace-pinyin-mode 'spacemacs/toggle-relative-line-numbers)
(add-hook 'ein:markdown-mode-hook 'spacemacs/toggle-relative-line-numbers)