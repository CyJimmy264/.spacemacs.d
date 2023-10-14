;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(systemd
     csv
     auto-completion
     better-defaults

     emacs-lisp
     git
     helm

     lsp
     markdown
     multiple-cursors

     org
     (org :variables
          org-enable-org-journal-support t
          org-journal-dir "~/Документы/Дневник/"
          )

     typescript
     ;; csv
     python
     go
     yaml
     c-c++
     crystal
     kotlin
     (ruby :variables
           ruby-test-runner 'rspec
           ruby-backend 'lsp
           ruby-version-manager 'rbenv
           )
     ruby-on-rails
     clojure
     sql
     (javascript :variables
                 javascript-backend 'lsp
                 )
     yaml
     php
     html
     groovy
     shell

     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     (spell-checking :variables
                     enable-flyspell-auto-completion t)
     ;; syntax-checking

     version-control

     treemacs
     (treemacs :variables
               treemacs-use-git-mode 'deferred
               treemacs-use-scope-type 'Perspectives
               treemacs-use-all-the-icons-theme t
               )

     ;; spacemacs-editing
     ;; (spacemacs-editing :packages unkillable-scratch)
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages
   '(
     history

     el-get


     toggle-quotes
     transpose-mark

     web-beautify
     format-sql

     ;; org-contrib
     toc-org

     apache-mode
     twig-mode
     feature-mode
     rjsx-mode

     geben

     spaceline-all-the-icons

     unkillable-scratch
     ;; (unkillable-scratch :variables
     ;;                     unkillable-buffers '("*scratch*" ".keep"))
     )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   dotspacemacs-scratch-buffer-unkillable t

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

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
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (add-to-list 'load-path "~/.spacemacs.d/")
  )


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (use-package unkillable-scratch
    :ensure t
    ;; :pin melpa-stable
    :config (unkillable-scratch t)
    )

  (add-to-list 'unkillable-buffers ".keep")

  (with-eval-after-load "ispell"
    (setq ispell-program-name "hunspell")
    ;; ispell-set-spellchecker-params has to be called
    ;; before ispell-hunspell-add-multi-dic will work
    (ispell-set-spellchecker-params)
    (ispell-hunspell-add-multi-dic "ru_RU,en_US")
    (setq ispell-dictionary "ru_RU,en_US"))

  (setq recentf-auto-cleanup 'never)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))

  (global-set-key (kbd "<s-f1>") 'spacemacs/persp-switch-to-1)
  (global-set-key (kbd "<s-f2>") 'spacemacs/persp-switch-to-2)
  (global-set-key (kbd "<s-f3>") 'spacemacs/persp-switch-to-3)
  (global-set-key (kbd "<s-f4>") 'spacemacs/persp-switch-to-4)
  (global-set-key (kbd "<s-f5>") 'spacemacs/persp-switch-to-5)
  (global-set-key (kbd "<s-f6>") 'spacemacs/persp-switch-to-6)
  (global-set-key (kbd "<s-f7>") 'spacemacs/persp-switch-to-7)

  (global-set-key (kbd "<s-return>") 'org-meta-return)

  (global-set-key (kbd "s-'") 'toggle-quotes)
  (global-set-key (kbd "s-(") 'sp-splice-sexp)
  (global-set-key (kbd "C-s-{") 'ruby-toggle-block)

  (global-set-key (kbd "M-Q") 'unfill-toggle)

  ;; Сворачивание/разворачивание блоков кода
  (global-set-key (kbd "M-s-[") 'hs-hide-block)

  (global-set-key (kbd "M-s-]") 'hs-show-block)
  (global-set-key (kbd "s-{") 'hs-hide-all)
  (global-set-key (kbd "s-}") 'hs-show-all)
  (global-set-key (kbd "M-s--") 'hs-hide-level)

  ;; Навигация по коду
  (global-set-key (kbd "M-s-g") 'dumb-jump-go)

  ;; Навигация по буферу
  (global-set-key (kbd "M-p") 'evil-scroll-line-up)
  (global-set-key (kbd "M-n") 'evil-scroll-line-down)
  (global-set-key (kbd "M-P") 'evil-scroll-up)
  (global-set-key (kbd "M-N") 'evil-scroll-down)

  ;; Структурировать содержимое буфера
  (global-set-key (kbd "M-s-i") 'my/format-code)
  (global-set-key (kbd "M-s-u") 'untabify)
  (global-set-key (kbd "<M-s-tab>") 'tabify)

  ;; Сохранить буфер
  (global-set-key (kbd "M-s-j") 'save-buffer)
  (global-set-key (kbd "<f7>") 'save-buffer)

  ;; Закрыть буфер
  (global-set-key (kbd "M-s-k") 'kill-this-buffer)

  ;; Закрыть окно
  (global-set-key (kbd "M-s-c") 'delete-window)
  (global-set-key (kbd "<s-right>") 'evil-window-increase-width)
  (global-set-key (kbd "<s-left>") 'evil-window-decrease-width)

  ;; Переключение окон
  (global-set-key (kbd "s-w") 'evil-window-next)

  ;; Menu ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Искать среди файлов в текущем проекте
  (global-set-key (kbd "<menu>") 'helm-projectile-find-file-dwim)

  ;; Искать среди открытых буферов текущей перспективы
  (global-set-key (kbd "<M-menu>") 'lazy-helm/helm-mini)

  ;; Искать среди открытых перспектив

  (global-set-key (kbd "<C-M-menu>") 'spacemacs/helm-perspectives)

  ;; Искать среди изменяемых в git файлов
  (global-set-key (kbd "<C-menu>") 'helm-ls-git)

  ;; Искать регулярку по проекту
  (global-set-key (kbd "<s-menu>") 'spacemacs/helm-project-do-ag)

  ;; Искать текущий символ по проекту
  (global-set-key (kbd "<M-s-menu>") 'spacemacs/helm-project-do-ag-region-or-symbol)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Переключение буферов
  (global-set-key (kbd "s-/") 'projectile-project-buffers-other-buffer)

  (global-set-key (kbd "s-,") 'projectile-previous-project-buffer)
  (global-set-key (kbd "C-<") 'previous-buffer)

  (global-set-key (kbd "s-.") 'projectile-next-project-buffer)
  (global-set-key (kbd "C->") 'next-buffer)

  ;; Flyspell
  (global-set-key (kbd "s-p") 'evil-prev-flyspell-error)
  (global-set-key (kbd "s-n") 'flyspell-goto-next-error)

  (defvar current-date-time-format "%d/%m/%Y %H:%M:%S"
    "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

  (defvar current-time-format "%H:%M:%S"
    "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

  (defun my/format-code ()
    (interactive)

    (if (eq major-mode 'ruby-mode)
        (rubocopfmt)
      (spacemacs/indent-region-or-buffer))
    )

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

  (defun insert-bindingirb ()
    (interactive)
    (mwim-end-of-line-or-code)
    (newline-and-indent)
    (insert "binding.irb")
    )

  (global-set-key (kbd "M-s-d") 'insert-current-date-time)
  (global-set-key (kbd "M-s-t") 'insert-current-time)
  (global-set-key (kbd "M-s-b") 'insert-bindingirb)

  (spacemacs/set-leader-keys "ddd" 'insert-current-date-time)
  (spacemacs/set-leader-keys "ddt" 'insert-current-time)

  (global-set-key (kbd "s-l") 'select-current-line)
  (spacemacs/set-leader-keys "xtt" 'transpose-mark)
  (global-set-key (kbd "C-M-t") 'transpose-mark)

  (global-set-key (kbd "M-s-h") 'org-journal-new-entry)

  (global-set-key (kbd "<f5>") 'spacemacs/treemacs-project-toggle)


  ;; Hideshow

  (add-hook 'ruby-mode-hook
            (lambda () (hs-minor-mode)))
  (eval-after-load "hideshow"
    '(add-to-list 'hs-special-modes-alist
                  `(ruby-mode
                    ,(rx (or "def" "class" "module" "do" "{" "[" "if" "unless")) ; Block start
                    ,(rx (or "}" "]" "end"))                       ; Block end
                    ,(rx (or "#" "=begin"))                        ; Comment start
                    ruby-forward-sexp nil)))

  (add-hook 'web-mode-hook
            (lambda () (hs-minor-mode)))
  (eval-after-load "hideshow"
    '(add-to-list 'hs-special-modes-alist
                  '(web-mode
                    "<!--\\|<[^/>]*[^/]>"
                    "-->\\|</[^/>]*[^/]>"
                    "<!--"
                    web-mode-forward-sexp
                    nil)))

  (add-hook 'markdown-mode-hook
            (lambda () (hs-minor-mode)))
  (eval-after-load "hideshow"
    '(add-to-list 'hs-special-modes-alist
                  '(markdown-mode
                    "<!--\\|<[^/>]*[^/]>"
                    "-->\\|</[^/>]*[^/]>"
                    "<!--"
                    sgml-skip-tag-forward
                    nil)))

  (defun +fold-hideshow-haml-forward-sexp-fn (arg)
    (haml-forward-sexp arg)
    (move-beginning-of-line 1))

  (add-hook 'haml-mode-hook
            (lambda () (hs-minor-mode)))
  (eval-after-load "hideshow"
    '(add-to-list 'hs-special-modes-alist
                  '(haml-mode
                    "[#.%]"
                    "\n"
                    "/"
                    +fold-hideshow-haml-forward-sexp-fn
                    nil)))

  ;; LSP garbage collector

  (defun my/lsp-client-clear-leak-handlers (lsp-client)
    "Clear leaking handlers in LSP-CLIENT."
    (let ((response-handlers (lsp--client-response-handlers lsp-client))
          to-delete-keys)
      (maphash (lambda (key value)
                 (when (> (time-convert (time-since (nth 3 value)) 'integer)
                          (* 2 lsp-response-timeout))
                   (push key to-delete-keys)))
               response-handlers)
      (when to-delete-keys
        (message "Deleting %d handlers in %s lsp-client..."
                 (length to-delete-keys)
                 (lsp--client-server-id lsp-client))
        (mapc (lambda (k) (remhash k response-handlers))
              to-delete-keys))))
  (defun my/lsp-clear-leak ()
    "Clear all leaks"
    (maphash (lambda (_ client)
               (my/lsp-client-clear-leak-handlers client))
             lsp-clients))
  (setq my/lsp-clear-leak-timer
        (run-with-timer 5 5 #'my/lsp-clear-leak))

  (global-set-key (kbd "<f6>") 'my/lsp-clear-leak)

  (defun my-hippie-expand-completions (&optional hippie-expand-function)
    "Return list of completions generated by `hippie-expand'."
    (save-excursion
      (let ((this-command 'my-hippie-expand-completions)
            (last-command last-command)
            (hippie-expand-function (or hippie-expand-function 'hippie-expand)))
        (while (progn
                 (funcall hippie-expand-function nil)
                 (setq last-command 'my-hippie-expand-completions)
                 (not (equal he-num -1))))
        ;; Provide the options in the order in which they are normally generated.
        (delete he-search-string (reverse he-tried-table)))))

  (defun my-ido-or-ivy-hippie-expand-with (hippie-expand-function)
    "Offer ido or ivy based completion using the specified hippie-expand function."
    (let* ((options (my-hippie-expand-completions hippie-expand-function)))
      (if options
          (progn
            (if (> (safe-length options) 1)
                (if (require 'ivy nil t)
                    (setq selection (ivy-read "Completions: " options))
                  (setq selection (ido-completing-read "Completions: " options)))
              (setq selection (car options)))
            (if selection
                (he-substitute-string selection t)))
        (message "No expansion found"))))

  (defun my-ido-or-ivy-hippie-expand ()
    "Offer ido or ivy based completion for the word at point."
    (interactive)
    (my-ido-or-ivy-hippie-expand-with 'hippie-expand))

  (global-set-key (kbd "s-/") 'my-ido-or-ivy-hippie-expand)

  (define-minor-mode ansi-color-mode 
    "ANSI Color Mode"
    nil nil nil
    (ansi-color-apply-on-region 1 (buffer-size)))
  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(css-indent-offset 2)
   '(evil-want-Y-yank-to-eol nil)
   '(helm-ls-git-ls-switches '("diff" "master..." "--name-only"))
   '(js-indent-level 2)
   '(js2-strict-missing-semi-warning nil)
   '(lsp-solargraph-autoformat t)
   '(lsp-solargraph-multi-root nil)
   '(lsp-solargraph-use-bundler nil)
   '(org-adapt-indentation t)
   '(org-export-backends '(ascii html icalendar latex md odt))
   '(org-export-with-broken-links 'mark)
   '(org-hide-leading-stars t)
   '(package-selected-packages
     '(unkillable-scratch shut-up spacemacs-whitespace-cleanup string-edit-at-point visual-fill ccls dap-mode lsp-docker bui flycheck-pos-tip flycheck-rtags flycheck-ycmd helm-lsp dockerfile-mode auto-dictionary flyspell-correct-helm flyspell-correct flyspell-popup vline systemd journalctl-mode xterm-color vterm terminal-here shell-pop multi-term eshell-z eshell-prompt-extras esh-help org-rich-yank org-projectile org-category-capture org-present org-pomodoro org-mime org-journal org-download org-contrib org-cliplink enh-ruby-mode treemacs-all-the-icons yasnippet-snippets yapfify yaml-mode web-mode web-beautify unfill twig-mode treemacs-magit treemacs-evil transpose-mark toggle-quotes tide typescript-mode tagedit sql-indent sphinx-doc smeargle slim-mode seeing-is-believing scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe rjsx-mode rbenv pytest pyenv-mode pydoc py-isort pug-mode projectile-rails rake inflections prettier-js poetry play-crystal pippel pipenv pyvenv pip-requirements phpunit phpcbf composer php-extras php-auto-yasnippets orgit-forge forge yaml ghub closql emacsql-sqlite emacsql treepy orgit request-deferred alert log4e gntp ob-crystal npm-mode nose nodejs-repl neotree mwim mmm-mode minitest markdown-toc magit magit-section git-commit with-editor lsp-ui lsp-treemacs lsp-python-ms lsp-pyright lsp-origami origami lsp-mode livid-mode skewer-mode live-py-mode kotlin-mode json-reformat hierarchy json-snatcher js2-mode js-doc simple-httpd htmlize history helm-pydoc helm-org-rifle helm-ls-git helm-git-grep helm-css-scss haml-mode groovy-mode pcache google-c-style godoctor go-gen-test go-fill-struct go-mode gnuplot gitignore-templates git-modes git-messenger git-link git-gutter gh-md geben fuzzy format-sql transient rtags pos-tip flycheck-kotlin flycheck-crystal feature-mode evil-org evil-easymotion emmet-mode el-get docker-tramp disaster cython-mode csv-mode crystal-mode cpp-auto-include deferred php-runtime php-mode company clojure-mode cider-eval-sexp-fu parseclj chruby markdown-mode inf-ruby browse-at-remote blacken yasnippet apache-mode pythonic auto-complete ws-butler writeroom-mode winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired toc-org symon symbol-overlay string-inflection string-edit spaceline-all-the-icons restart-emacs request rainbow-delimiters quickrun popwin pcre2el password-generator paradox overseer org-superstar open-junk-file nameless multi-line macrostep lorem-ipsum link-hint inspector info+ indent-guide hybrid-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio font-lock+ flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-terminal-cursor-changer evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu emr elisp-slime-nav elisp-def editorconfig dumb-jump drag-stuff dotenv-mode dired-quick-sort diminish devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile aggressive-indent ace-link ace-jump-helm-line))
   '(paradox-github-token t)
   '(ruby-align-chained-calls nil)
   '(sh-basic-offset 2)
   '(warning-suppress-types '((comp)))
   '(web-mode-code-indent-offset 2)
   '(web-mode-css-indent-offset 2)
   '(web-mode-markup-indent-offset 2))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
  )
