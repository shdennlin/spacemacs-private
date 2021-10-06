

(global-set-key (kbd "<f8>") 'shdennlin/temp)
(defun shdennlin/temp ()
  (interactive)
  (save-buffer)
  (run-with-timer .1 nil 'spacemacs/python-execute-file t)
  (run-with-timer .1 nil 'execute-kbd-macro (kbd "C-a"))
  (run-with-timer .1 nil 'execute-kbd-macro (kbd "C-k"))
  (run-with-timer .1 nil 'insert "/home/shdennlin/anaconda3/bin/ipython main.py")
  (run-with-timer .1 nil 'execute-kbd-macro (kbd "RET"))
  (run-with-timer .1 nil 'execute-kbd-macro (kbd "<escape>"))
  )
