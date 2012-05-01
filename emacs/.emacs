(add-to-list 'load-path "D:\\software\\editor\\emacs\\user-lisp")
(setq-default cursor-type 'bar)
(setq inhibit-startup-message t)
(setq gun-inhibit-startup-message t)
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-comidia)
(require 'tomorrow-night-theme)
(require 'linum)
(global-linum-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;transparent
(defun djcb-opacity-modify (&optional dec)
  "modify the transparency of the emacs frame; if DEC is t,
    decrease the transparency, otherwise increase it in 10%-steps"
  (let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before setting
          (oldalpha (if alpha-or-nil alpha-or-nil 100))
          (newalpha (if dec (- oldalpha 10) (+ oldalpha 10))))
    (when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha 100))
      (modify-frame-parameters nil (list (cons 'alpha newalpha))))))

 ;; C-8 will increase opacity (== decrease transparency)
 ;; C-9 will decrease opacity (== increase transparency
 ;; C-0 will returns the state to normal
(global-set-key (kbd "C-8") '(lambda()(interactive)(djcb-opacity-modify)))
(global-set-key (kbd "C-9") '(lambda()(interactive)(djcb-opacity-modify t)))
(global-set-key (kbd "C-0") '(lambda()(interactive)
                               (modify-frame-parameters nil `((alpha . 100)))))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(delete-selection-mode nil)
 '(ecb-options-version "2.40")
 '(mark-even-if-inactive t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "Black" :foreground "SteelBlue" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "apple" :family "Monaco")))))

;;Erlang mode
(setq load-path (cons "d:/program/erlang/lib/tools-2.6.7/emacs" load-path))
(setq erlang-root-dir "d:/program/erlang/")
(setq exec-path (cons "d:/program/erlang/bin" exec-path))
(require 'erlang-start)

;;Distel
(let ((distel-dir "D:\\program\\erlang\\lib\\elisp"))
  (unless (member distel-dir load-path)
    (setq load-path (append load-path (list distel-dir)))))
(require 'distel)
(distel-setup)

;;Some Erlang customizations
(add-hook 'erlang-mode-hook
          (lambda ()
            ;;when staring an Erlang shell in Emacs, default in the node ame
            (setq inferior-erlang-machine-options '("-sname" "eamcs"))
            ;;add Erlang functions to an imenu menu
            (imenu-add-to-menubar "imenu")))
;;A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
          '(("/C-/M-i"    erl-complete)
            ("/M-?"       erl-complete)
            ("/M-."       erl-find-source-under-point)
            ("/M-,"       erl-find-source-unwind)
            ("/M-*",      erl-find-source-unwind)
            )
          "Additional keys to bind when in Erlang shell.")
(add-hook 'erlang-shell-mode-hook
          (lambda ()
            ;;add some Distel binding to the Erlang shell
            (dolist (spec distel-shell-keys)
              (define-key erlang-shell-mode-map (car spec) (cadr spec)))))
(setq default-frame-alist '((height . 30) (width . 100) (menu-bar-lines . 20) (tool-bar-lines . 0)))
(global-set-key[(f4)] 'speedbar-get-focus)

(add-to-list 'load-path "D:\\software\\editor\\emacs\\user-lisp\\ecb")
;;require ecb
(require 'ecb-autoloads)

;; 在标题栏显示buffer的名字 
(setq frame-title-format "emacs@%b") 

;; 简化工具条 
(tool-bar-mode -1) 

;;vim pulse vim in emacs 真邪恶:) ctrl+z 进行emacs vim之间的切换 
(setq viper-mode t) ; enable Viper at load time 
(setq viper-ex-style-editing nil) ; can backspace past start of insert /;; line 
(require 'viper) ; load Viper 
(add-to-list 'load-path "D:\\software\\editor\\emacs\\user-lisp\\vimpulse") ;;"~/.emacs.d/plugins/vimpulse") 
(require 'vimpulse) ; load Vimpulse 

(setq viper-inhibit-startup-message 't) 
(setq viper-expert-level '2) 
