(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 (cond ((eq system-type 'windows-nt)
        '(ein:jupyter-server-command "~/../../anaconda3/envs/tf-gpu/Scripts/jupyter")
        )
       ((eq system-type 'gnu/linux)
        '(ein:jupyter-server-command "/home/shawn/anaconda3/envs/tf-gpu/bin/jupyter")
        )
       ((eq system-type 'darwin)
        ))
 '(ein:output-area-inlined-images t)
 '(package-selected-packages
   (quote
    (vi-tilde-fringe sphinx-doc org-rich-yank ivy-avy magit nord-theme ghub treepy magit-popup magit-section git-gutter-fringe+ fringe-helper git-gutter+ flyspell-correct browse-at-remote ron-mode fcitx pyim pyim-basedict xr pangu-spacing find-by-pinyin-dired chinese-conv ace-pinyin pinyinlib toml-mode racer flycheck-rust cargo rust-mode helm-gtags godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc ggtags flycheck-golangci-lint dap-mode posframe lsp-treemacs bui lsp-mode treemacs pfuture ht dash-functional counsel-gtags company-go go-mode ox-gfm org-journal yaml-mode hyde phpunit phpcbf php-extras php-auto-yasnippets geben drupal-mode company-phpactor phpactor composer php-runtime company-php ac-php-core xcscope php-mode web-mode web-beautify tagedit slim-mode scss-mode sass-mode pug-mode prettier-js impatient-mode simple-httpd helm-css-scss helm helm-core haml-mode emmet-mode counsel-css company-web web-completion-data add-node-modules-path org-superstar magic-latex-buffer company-reftex company-auctex auctex pos-tip visual-fill-column vterm all-the-icons memoize spaceline powerline persp-mode spinner org-category-capture alert log4e gntp markdown-mode window-purpose imenu-list parent-mode package-lint flycheck flx git-commit with-editor dash smartparens anzu iedit clang-format paredit list-utils exec-path-from-shell transient projectile pkg-info epl counsel swiper ivy yasnippet packed f s ace-window avy auto-complete popup org-plus-contrib hydra lv evil goto-chg undo-tree bind-map bind-key async dockerfile-mode docker tablist json-mode docker-tramp json-snatcher json-reformat elpy neotree python yapfify pytest pyenv-mode py-isort pippel pipenv pyvenv pip-requirements live-py-mode importmagic epc ctable concurrent cython-mode company-anaconda blacken anaconda-mode pythonic ein polymode deferred anaphora websocket names chinese-word-at-point dracula-theme ibuffer-projectile youdao-dictionary yasnippet-snippets xterm-color ws-butler writeroom-mode winum which-key wgrep volatile-highlights uuidgen use-package unfill treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil toc-org terminal-here symon symbol-overlay string-inflection spaceline-all-the-icons smex smeargle shell-pop restart-emacs request rainbow-delimiters popwin pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-cliplink org-bullets org-brain open-junk-file nameless mwim multi-term move-text mmm-mode markdown-toc magit-svn magit-gitflow macrostep lorem-ipsum link-hint ivy-yasnippet ivy-xref ivy-purpose ivy-hydra indent-guide hybrid-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-make google-translate golden-ratio gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy font-lock+ flyspell-correct-ivy flycheck-pos-tip flycheck-package flycheck-elsa flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emr elisp-slime-nav editorconfig dumb-jump dotenv-mode diminish devdocs define-word counsel-projectile company column-enforce-mode clean-aindent-mode centered-cursor-mode auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent ace-link ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ml/hhuge ((t (:height 1.7))))
 '(ml/huge ((t (:height 1.55))))
 '(ml/title ((t (:inherit font-lock-function-name-face :height 1.3))))
 '(show-paren-match ((t (:background "red" :foreground "#8be9fd" :weight bold)))))

