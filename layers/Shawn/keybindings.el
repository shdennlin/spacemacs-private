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

(spacemacs/set-leader-keys "oo" 'occur-dwim)
;; (global-set-key (kbd "M-s o") 'occur-dwim)

(spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)

(defun show-markdown-dwim ()
  (interactive)
  ;; (call-interactively 'ein:worksheet-toggle-cell-type-km)
  (call-interactively 'spacemacs/evil-insert-line-below)
  (call-interactively 'evil-join)
  (call-interactively 'ein:worksheet-goto-next-input-km)
  )
(spacemacs/set-leader-keys "or" 'show-markdown-dwim)


(defun toggle-relative-line-numbers-in-ein ()
  (interactive)
  (call-interactively 'spacemacs/toggle-relative-line-numbers-on)
  (call-interactively 'ein:worksheet-goto-next-input-km)
  (print "a")

  (call-interactively 'spacemacs/toggle-relative-line-numbers-on)
  (call-interactively 'ein:worksheet-goto-next-input-km)
  (print "b")

  ;; (call-interactively 'spacemacs/toggle-relative-line-numbers-on)
  )
(spacemacs/set-leader-keys "ol" 'toggle-relative-line-numbers-in-ein)

(defun connect-remote ()
  (interactive)
  (dired "/ssh:pi@192.168.12.5:/home/pi/"))
