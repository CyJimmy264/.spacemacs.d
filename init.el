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
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     go
     yaml
     c-c++
     crystal
     ruby
     clojure
     sql
     javascript
     yaml
     php
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     org
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
     history

     el-get
     robe

     toggle-quotes
     transpose-mark

     web-beautify
     format-sql

     org-journal
     org-plus-contrib

     apache-mode
     twig-mode
     feature-mode
     rjsx-mode

     geben
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

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
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
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
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.4)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
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
  (package-initialize)

  (fset 'toggle-parser-debug
        (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([C-home 134217848 115 101 97 tab 102 111 114 tab return 100 101 102 105 110 101 40 39 68 69 66 85 71 return 1 S-down 134217787 21 67108896 21 67108896] 0 "%d")) arg)))

  (fset 'toggle-parser-new-tests-search
        (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([C-home 134217848 115 101 97 tab 102 111 114 tab return 100 101 102 105 110 101 40 39 78 69 87 95 84 69 83 84 83 95 83 69 65 82 67 72 return 1 S-down 134217787 21 67108896 21 67108896] 0 "%d")) arg)))

  (fset 'toggle-parser-test-first
        (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([C-home 134217848 115 101 97 tab 102 111 114 tab return 100 101 102 105 110 101 40 39 84 69 83 84 95 70 73 82 83 84 return 1 S-down 134217787 21 67108896 21 67108896] 0 "%d")) arg)))

  (defun insert-4spcs ()
    (interactive)
    (insert "    ")
    )

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

  (defun insert-phpdeclafun ()
    (interactive)
    (mwim-end-of-line-or-code)
    (newline-and-indent)
    (insert "debug(color(__CLASS__.'->'.__FUNCTION__, 'light_purple'));")
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

  ;; Create Cyrillic-CP1251 Language Environment menu item
  (set-language-info-alist
   "Cyrillic-CP1251" `((charset cyrillic-iso8859-5)
                       (coding-system cp1251)
                       (coding-priority cp1251)
                       (input-method . "cyrillic-jcuken")
                       (features cyril-util)
                       (unibyte-display . cp1251)
                       (sample-text . "Russian (Русский) Здравствуйте!")
                       (documentation . "Support for Cyrillic CP1251."))
   '("Cyrillic"))

  (defun sql-beautify-region (beg end)
    "Beautify SQL in region between beg and END."
    (interactive "r")
    (save-excursion
      (shell-command-on-region beg end "anbt-sql-formatter" nil t)))
  ;; change sqlbeautify to anbt-sql-formatter if you
  ;;ended up using the ruby gem

  (defun sql-beautify-buffer ()
    "Beautify SQL in buffer."
    (interactive)
    (sql-beautify-region (point-min) (point-max)))

  (defun helm-relative ()
    (interactive)
    (if (equal "Default" (spacemacs//current-layout-name))
        (helm-mini)
      (helm-projectile)
        )
    )

  (defun select-current-line (&optional arg)
    (interactive "p")
    (setq arg (if arg arg 1))
    (when (not (use-region-p))
      (forward-line 0)
      (set-mark-command nil))
    (forward-line arg)
    )

  (add-hook 'ruby-mode-hook 'robe-mode)

  ;; (eval-after-load 'company
  ;;   '(push 'company-robe company-backends))

  (add-hook 'robe-mode-hook 'ac-robe-setup)

  (add-to-list 'load-path "~/.spacemacs.d/")
  (require 'crontab-mode)

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place you code here."
  (require 'auto-complete)
  (require 'google-translate)
  (require 'google-translate-default-ui)
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "ru")

  (setq paradox-github-token (getenv "PARADOX_GITHUB_TOKEN"))
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  ;; (require 'package)
  ;; (add-to-list 'package-archives
  ;;              '("org" . "http://orgmode.org/elpa/") t)
  ;; (package-initialize)
  ;; (package-install 'org-plus-contrib)


  (setq recentf-auto-cleanup 'never)

  ;; (el-get-bundle jpellerin/emacs-crystal-mode)

  (spacemacs/declare-prefix "d" "SPC super doubling")
  (spacemacs/declare-prefix "dd" "dates insertion")

  (global-set-key (kbd "<s-f1>") 'spacemacs/persp-switch-to-1)
  (global-set-key (kbd "<s-f2>") 'spacemacs/persp-switch-to-2)
  (global-set-key (kbd "<s-f3>") 'spacemacs/persp-switch-to-3)
  (global-set-key (kbd "<s-f4>") 'spacemacs/persp-switch-to-4)
  (global-set-key (kbd "<s-f5>") 'spacemacs/persp-switch-to-5)
  (global-set-key (kbd "<s-f6>") 'spacemacs/persp-switch-to-6)
  (global-set-key (kbd "<s-f7>") 'spacemacs/persp-switch-to-7)

  (global-set-key (kbd "<s-insert>") 'history-add-history)
  (global-set-key (kbd "<s-prior>") 'history-prev-history)
  (global-set-key (kbd "<s-next>") 'history-next-history)

  (global-set-key (kbd "<s-f10>") 'holy-mode)
  (global-set-key (kbd "<s-f11>") 'hybrid-mode)

  (global-set-key (kbd "<s-return>") 'org-meta-return)

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

  (global-set-key (kbd "M-s-g") 'dumb-jump-go)

  ;; Структурировать содержимое буфера
  (global-set-key (kbd "M-s-i") 'spacemacs/indent-region-or-buffer)
  (global-set-key (kbd "M-s-u") 'untabify)

  (global-set-key (kbd "s-i") 'lisp-interaction-mode)
  (global-set-key (kbd "s-j") 'eval-print-last-sexp)

  ;; Сохранить буфер
  (global-set-key (kbd "M-s-j") 'save-buffer)
  (global-set-key (kbd "<f7>") 'save-buffer)

  ;; Закрыть буфер
  (global-set-key (kbd "M-s-k") 'kill-this-buffer)

  ;; Закрыть окно
  (global-set-key (kbd "M-s-c") 'delete-window)
  (global-set-key (kbd "<s-right>") 'evil-window-increase-width)
  (global-set-key (kbd "<s-left>") 'evil-window-decrease-width)

  ;; Переключение буферов
  (global-set-key (kbd "<s-menu>") 'helm-relative)
  (global-set-key (kbd "<M-s-menu>") 'spacemacs/helm-perspectives)
  (global-set-key (kbd "<M-menu>") 'helm-relative)
  (global-set-key (kbd "<C-M-menu>") 'spacemacs/helm-perspectives)
  (global-set-key (kbd "M-s-,") 'previous-buffer)
  (global-set-key (kbd "M-s-.") 'next-buffer)
  (global-set-key (kbd "s-/") 'mode-line-other-buffer)
  (global-set-key (kbd "s-,") 'previous-buffer)
  (global-set-key (kbd "s-.") 'next-buffer)

  ;; Переключение окон
  (global-set-key (kbd "s-w") 'evil-window-next)

  ;; Сохранить и загрузить перспективы в/из файл(а)
  (global-set-key (kbd "M-s-w") 'persp-save-state-to-file)
  (global-set-key (kbd "M-s-e") 'persp-load-state-from-file)

  (global-set-key (kbd "<C-tab>") 'insert-4spcs)
  (global-set-key (kbd "M-s-p") 'insert-psysh)
  (global-set-key (kbd "M-s-f") 'insert-phpdefun)
  (global-set-key (kbd "C-M-s-f") 'insert-phpdeclafun)

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

  (spacemacs/set-leader-keys "ddd" 'insert-current-date-time)
  (spacemacs/set-leader-keys "ddt" 'insert-current-time)

  (global-set-key (kbd "s-l") 'select-current-line)
  (spacemacs/set-leader-keys "xtt" 'transpose-mark)
  (global-set-key (kbd "C-M-t") 'transpose-mark)

  (global-set-key (kbd "M-s-h") 'org-journal-new-entry)

  (setq persp-save-dir "~/.config/emacs/")
  (setq org-journal-dir "~/Документы/Дневник/")

  (setq php-mode-coding-style (quote psr2))

  (require 'org)
  (let ((current-prefix-arg 1))
    (call-interactively 'org-reload))


  (add-hook 'persp-before-switch-functions
            (lambda (next-pn w-or-f)
              (winum-select-window-1)
              (neotree-hide)
              ))

  (global-set-key (kbd "<f5>") 'neotree-find-project-root)


  ;;
  ;; Ruby language

  (add-hook 'ruby-mode-hook
            (lambda () (hs-minor-mode)))

  (eval-after-load "hideshow"
    '(add-to-list 'hs-special-modes-alist
                  `(ruby-mode
                    ,(rx (or "def" "class" "module" "do" "{" "[" "if" "unless")) ; Block start
                    ,(rx (or "}" "]" "end"))                       ; Block end
                    ,(rx (or "#" "=begin"))                        ; Comment start
                    ruby-forward-sexp nil)))

  (add-to-list 'org-src-lang-modes '("rhtml" . web))
  (defadvice org-edit-special (before org-edit-src-code activate)
    (let ((lang (nth 0 (org-babel-get-src-block-info))))
      (if (string= lang "rhtml")
          (web-mode-set-engine "erb"))
      ))


  (setq create-lockfiles nil)
  (setq backup-directory-alist
        `((".*" . ,(concat user-emacs-directory "backups/"))))
  (setq auto-save-file-name-transforms
        `((".*" ,(concat user-emacs-directory "backups/") t)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bind-map-default-evil-states (quote (insert normal motion visual)))
 '(bookmark-bmenu-file-column 60)
 '(company-dabbrev-char-regexp "\\sw\\|\\s_")
 '(evil-want-Y-yank-to-eol nil)
 '(exec-path-from-shell-check-startup-files nil)
 '(geben-display-window-function (quote switch-to-buffer))
 '(geben-show-breakpoints-debugging-only nil)
 '(geben-show-redirect-buffers nil)
 '(helm-buffer-max-length 40)
 '(helm-split-window-inside-p t)
 '(history-advised-before-functions
   (quote
    (imenu isearch-mode beginning-of-buffer end-of-buffer dumb-jump-go goto-line outline-up-heading)))
 '(history-length 1000)
 '(history-mode t)
 '(history-window-local-history t)
 '(js-indent-level 2)
 '(js2-strict-missing-semi-warning nil)
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(neo-window-fixed-size nil)
 '(org-cycle-include-plain-lists (quote integrate))
 '(org-export-with-author t)
 '(org-export-with-title t)
 '(org-footnote-section "Ссылки")
 '(org-html-htmlize-output-type (quote css))
 '(org-journal-find-file (quote find-file))
 '(org-src-preserve-indentation nil)
 '(org-src-tab-acts-natively t)
 '(package-archives
   (quote
    (("melpa" . "https://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/")
     ("org" . "http://orgmode.org/elpa/"))))
 '(package-selected-packages
   (quote
    (rjsx-mode ghub let-alist avy f dash s go-guru go-eldoc company-go go-mode transpose-mark geben history crystal-mode monokai-theme twig-mode toggle-quotes format-sql feature-mode el-get apache-mode org-journal cycle-quotes yaml-mode web-mode web-beautify unfill tagedit sql-indent smeargle slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake pug-mode phpunit phpcbf php-auto-yasnippets orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download mwim mmm-mode minitest markdown-toc markdown-mode magit-gitflow livid-mode skewer-mode simple-httpd less-css-mode json-snatcher json-reformat js2-refactor js-doc htmlize helm-gitignore helm-css-scss helm-company helm-c-yasnippet haml-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy evil-magit magit magit-popup git-commit with-editor emmet-mode drupal-mode php-mode disaster company-web web-completion-data company-tern dash-functional tern company-c-headers company cmake-mode clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg clang-format cider-eval-sexp-fu cider seq queue clojure-mode chruby bundler inf-ruby auto-yasnippet ac-ispell auto-complete ws-butler winum volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed ace-link ace-jump-helm-line helm helm-core popup yasnippet which-key php-extras json-mode js2-mode evil-unimpaired diff-hl company-statistics coffee-mode async aggressive-indent adaptive-wrap ace-window)))
 '(php-mode-coding-style (quote psr2))
 '(tramp-copy-size-limit 1024000)
 '(tramp-inline-compress-start-size 1000000))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C"))))
 '(geben-breakpoint-face ((t (:background "red4" :foreground "white")))))
