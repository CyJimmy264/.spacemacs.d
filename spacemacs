;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     c-c++
     ruby
     clojure
     sql
     javascript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     org
     php
     html
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     el-get

     toggle-quotes
     web-beautify
     format-sql

     org-journal
     org-plus-contrib
     crontab-mode
     feature-mode
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.4)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (fset 'toggle-parser-debug
        (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([C-home 134217848 115 101 97 tab 102 111 114 tab return 100 101 102 105 110 101 40 39 68 69 66 85 71 return 1 S-down 134217787 21 67108896 21 67108896] 0 "%d")) arg)))

  (fset 'toggle-parser-new-tests-search
        (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([C-home 134217848 115 101 97 tab 102 111 114 tab return 100 101 102 105 110 101 40 39 78 69 87 95 84 69 83 84 83 95 83 69 65 82 67 72 return 1 S-down 134217787 21 67108896 21 67108896] 0 "%d")) arg)))

  (fset 'toggle-parser-test-first
        (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([C-home 134217848 115 101 97 tab 102 111 114 tab return 100 101 102 105 110 101 40 39 84 69 83 84 95 70 73 82 83 84 return 1 S-down 134217787 21 67108896 21 67108896] 0 "%d")) arg)))

  (defun insert-psysh ()
    (interactive)
    (mwim-end-of-line-or-code)
    (newline-and-indent)
    (insert "eval(\\Psy\\sh());")
    (newline-and-indent)
    )

  (defun insert-phpdefun ()
    (interactive)
    (mwim-end-of-line-or-code)
    (newline-and-indent)
    (insert "debug(color(__FUNCTION__, 'light_purple'));")
    (newline-and-indent)
    )


  (defun lines-to-cslist (start end &optional arg)
    (interactive "r\nP")
    (let ((insertion
           (mapconcat
            (lambda (x) (format "\"%s\"" x))
            (split-string (buffer-substring start end)) ", ")))
      (delete-region start end)
      (insert insertion)
      (when arg (forward-char (length insertion)))))

  (defun change-state-to-insert ()
    (setq evil-default-state 'insert))

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place you code here."

  ;; (require 'package)
  ;; (add-to-list 'package-archives
  ;;              '("org" . "http://orgmode.org/elpa/") t)
  ;; (package-initialize)
  ;; (package-install 'org-plus-contrib)
  (setq recentf-auto-cleanup 'never)

  (el-get-bundle jpellerin/emacs-crystal-mode)

  (global-set-key (kbd "<s-f10>") 'holy-mode)
  (global-set-key (kbd "<s-f11>") 'hybrid-mode)

  (global-set-key (kbd "s-'") 'toggle-quotes)
  (global-set-key (kbd "s-(") 'sp-splice-sexp)

  (global-set-key (kbd "s-d") 'toggle-parser-debug)
  (global-set-key (kbd "s-s") 'toggle-parser-new-tests-search)
  (global-set-key (kbd "s-f") 'toggle-parser-test-first)

  (global-set-key (kbd "s-;") 'goto-line)

  ;; Сворачивание/разворачивание блоков кода
  (global-set-key (kbd "M-s-[") 'hs-hide-block)
  (global-set-key (kbd "M-s-]") 'hs-show-block)
  (global-set-key (kbd "s-{") 'hs-hide-all)
  (global-set-key (kbd "s-}") 'hs-show-all)
  (global-set-key (kbd "M-s--") 'hs-hide-level)

  ;; Структурировать содержимое буфера
  (global-set-key (kbd "M-s-i") 'spacemacs/indent-region-or-buffer)

  ;; Сохранить буфер
  (global-set-key (kbd "M-s-j") 'save-buffer)
  (global-set-key (kbd "<f7>") 'save-buffer)

  ;; Закрыть буфер
  (global-set-key (kbd "M-s-k") 'kill-this-buffer)

  ;; Закрыть окно
  (global-set-key (kbd "M-s-c") 'delete-window)

  ;; Переключение буферов
  (global-set-key (kbd "<s-menu>") 'helm-mini)
  (global-set-key (kbd "M-s-,") 'previous-buffer)
  (global-set-key (kbd "M-s-.") 'next-buffer)
  (global-set-key (kbd "s-/") 'mode-line-other-buffer)
  (global-set-key (kbd "s-,") 'previous-buffer)
  (global-set-key (kbd "s-.") 'next-buffer)

  ;; Сохранить и загрузить перспективы в/из файл(а)
  (global-set-key (kbd "M-s-w") 'persp-save-state-to-file)
  (global-set-key (kbd "M-s-e") 'persp-load-state-from-file)

  (global-set-key (kbd "M-s-p") 'insert-psysh)
  (global-set-key (kbd "M-s-f") 'insert-phpdefun)

  (defvar current-date-time-format "%d/%m/%Y %H:%M:%S"
    "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

  (defvar current-time-format "%H:%M:%S"
    "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

  (defun insert-current-date-time ()
    "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
    (interactive)
    (insert (format-time-string current-date-time-format (current-time)))
    )

  (defun insert-current-time ()
    "insert the current time (1-week scope) into the current buffer."
    (interactive)
    (insert (format-time-string current-time-format (current-time)))
    )

  (global-set-key (kbd "M-s-d") 'insert-current-date-time)
  (global-set-key (kbd "M-s-t") 'insert-current-time)

  (setq persp-save-dir "~/.config/emacs/")
  (setq org-journal-dir "~/Документы/Дневник/")

  (require 'org)
  (let ((current-prefix-arg 1))
    (call-interactively 'org-reload))

  (global-set-key (kbd "M-s-h") 'org-journal-new-entry)

  ; (add-hook 'find-file-hook 'change-state-to-insert)

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bind-map-default-evil-states (quote (insert normal motion visual)))
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(org-export-with-author t)
 '(org-export-with-title t)
 '(org-footnote-section "Ссылки")
 '(org-html-htmlize-output-type (quote css))
 '(org-journal-find-file (quote find-file))
 '(package-selected-packages
   (quote
    (crontab-mode feature-mode disaster company-c-headers cmake-mode clang-format rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby winum unfill fuzzy clojure-snippets clj-refactor inflections edn paredit peg cider-eval-sexp-fu cider seq queue clojure-mode manage-minor-mode js-auto-beautify format-sql sql-indent livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode hide-comnt uuidgen pug-mode org-projectile org org-download mwim link-hint git-link eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff goto-chg undo-tree dumb-jump diminish column-enforce-mode web-beautify toggle-quotes sublimity powerline f hydra spinner alert log4e gntp s markdown-mode parent-mode projectile request haml-mode gitignore-mode fringe-helper git-gutter+ git-gutter flycheck pkg-info epl flx magit magit-popup git-commit with-editor smartparens iedit anzu highlight web-completion-data pos-tip company yasnippet packed dash helm avy helm-core async auto-complete popup package-build bind-key bind-map evil tidy php-mode ws-butler window-numbering which-key web-mode volatile-highlights vi-tilde-fringe use-package toc-org tagedit spacemacs-theme spaceline solarized-theme smooth-scrolling smeargle slim-mode scss-mode sass-mode restart-emacs rainbow-delimiters quelpa popwin phpunit phpcbf php-extras php-auto-yasnippets persp-mode pcre2el paradox page-break-lines orgit org-repo-todo org-present org-pomodoro org-plus-contrib org-journal org-bullets open-junk-file neotree move-text monokai-theme mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum linum-relative leuven-theme less-css-mode jade-mode info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe git-gutter-fringe+ gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu emmet-mode elisp-slime-nav el-get drupal-mode diff-hl define-word company-web company-statistics company-quickhelp clean-aindent-mode buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(persp-keymap-prefix "z"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
