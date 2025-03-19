(load-theme 'leuven t)
(set-frame-font "FiraCode Nerd Font 11")
(set-default-coding-systems 'utf-8)

(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(vertico-mode 1)

(global-display-line-numbers-mode 1)

(setq enable-recursive-minibuffers t)
(ivy-mode)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c f") 'swiper)
(global-set-key (kbd "C-c g") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)


(require 'powerline)
(powerline-default-theme)

(fringe-mode 0)
(set-face-attribute 'vertical-border nil :foreground (face-attribute 'fringe :background))


                                        ; バッファ末尾より後の行では、フリンジ左側に何か表示される
(setq-default indicate-empty-lines t)

                                        ; ¥ -> \
(define-key global-map [165] [92])

                                        ; 画像を表示
(auto-image-file-mode t)

                                        ; メニューバーを消す
(menu-bar-mode -1)
                                        ; ツールバーを消す
(tool-bar-mode -1)

                                        ; カーソルの点滅
(blink-cursor-mode 1)
(set-cursor-color "#da70d6") ;;http://www.tayloredmktg.com/rgb/
(setq blink-cursor-interval 0.19)
(setq blink-cursor-delay 1.0)

                                        ; evalした結果を全部表示
(setq eval-expression-print-length nil)

                                        ; 対応する括弧を光らせる。
(show-paren-mode 1)

                                        ; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)

                                        ; 現在行を目立たせる
(global-hl-line-mode -1)

                                        ; カーソルの位置が何文字目かを表示する
(column-number-mode t)

                                        ; カーソルの位置が何行目かを表示する
(line-number-mode t)
                                        ; カーソルの場所を保存する
(require 'saveplace)
(setq-default save-place t)

                                        ; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

                                        ; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

                                        ; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)



                                        ; 履歴数を大きくする
(setq history-length 10000)

;; ミニバッファの履歴を保存する
(savehist-mode 1)

                                        ; 最近開いたファイルを保存する数を増やす
(setq recentf-max-saved-items 10000)

                                        ; ediffを1ウィンドウで実行
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

                                        ; diffのオプション
(setq diff-switches '("-u" "-p" "-N"))

(require 'whitespace)

                                        ; デフォルトで視覚化を有効にする。
(global-whitespace-mode 1)

                                        ; 1行が80桁を超えたら長すぎると判断する。
(setq whitespace-line-column 200)

                                        ; 視覚化の設定
(setq whitespace-style '(face              ; faceを使って視覚化する。
                         trailing          ; 行末の空白を対象とする。
                         ;lines-tail        ; 長すぎる行のうち
                         spaces
                         space-mark
                         newline
                         newline-mark
                         empty             ; 先頭/末尾の空行
                         tab-mark))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        (space-mark   ?\xA0  [?\xA4]  [?_]) ; hard space - currency
        (space-mark   ?\x8A0 [?\x8A4] [?_]) ; hard space - currency
        (space-mark   ?\x920 [?\x924] [?_]) ; hard space - currency
        (space-mark   ?\xE20 [?\xE24] [?_]) ; hard space - currency
        (space-mark   ?\xF20 [?\xF24] [?_]) ; hard space - currency
        ;(newline-mark ?\n    [?\u21B5 ?\n] [?\u240D ?\n])
        ))

                                        ;(set-face-foreground 'whitespace-space "cyan")
                                        ;(set-face-background 'whitespace-space 'nil)

                                        ;(set-face-background 'whitespace-newline 'nil)
                                        ;(set-face-foreground 'whitespace-newline  "DarkGray")

                                        ;(set-face-underline  'whitespace-trailing 1)
                                        ;(set-face-foreground 'whitespace-trailing "cyan")
                                        ;(set-face-background 'whitespace-trailing 'nil)

;; 保存前に自動でクリーンアップ
(setq whitespace-action '(auto-cleanup))



(global-whitespace-mode 1)

(defvar my/bg-color "#FFFFFF")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground "GreenYellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)

                                        ;indentでtabをつかわないようにする
(setq-default indent-tabs-mode nil)

                                        ; share clipboard
(setq x-select-enable-clipboard t)

                                        ; コントロール用のバッファを同一フレーム内に表示
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
                                        ; diffのバッファを上下ではなく左右に並べる
(setq ediff-split-window-function 'split-window-horizontally)

(setq make-backup-files nil)
(put 'upcase-region 'disabled nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq require-final-newline t)

(defun jump-to-github ()
  "Go to github code position at most recent commitl;"
  (interactive)
  (let (full_path)
    (setq
     full_path buffer-file-name
     dir_name (shell-command-to-string (concat "echo " full_path "| xargs dirname"))
     file_name (shell-command-to-string (concat "echo `basename " full_path "` | tr -d '\n'"))
     cd_dir (shell-command-to-string (concat "cd " dir_name))
     prefix (shell-command-to-string "git rev-parse  --show-prefix | tr -d '\n'")
     current_commit (shell-command-to-string "git show -s --format=%H | tr -d '\n'")
     current_line (count-lines 1 (point))
     repo_name (shell-command-to-string "git remote -v | grep origin | head -1 | awk '{sub(\"git@github.com:\",\"\");sub(\".git\",\"\");print $2}' | tr -d '\n'")
     github_url (concat "https://github.com/"
                        repo_name "/blob/" current_commit "/" prefix
                        file_name "#L" (number-to-string (+ current_line 1))))
    (message github_url)))
(global-set-key (kbd "M-b") 'jump-to-github)

(require 'mozc)
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'overlay)

(add-to-list 'load-path "~/.emacs.d/user/")

(defconst *dmacro-key* "\C-t")
(global-set-key *dmacro-key* 'dmacro-exec)
(autoload 'dmacro-exec "dmacro" nil t)

(global-undo-tree-mode t)

(global-set-key [(control h)] 'delete-backward-char)

(global-set-key (kbd "M-k") 'hs-toggle-hiding)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-safe-themes
   '("acb039d6f2c41b3bd852b448351b2979f44ef488026c95dd5228d2f6da57f574" default))
 '(package-selected-packages
   '(vertico auto-correct haskell-mode undo-tree powerline popwin mozc magit leuven-theme helm-ls-git helm-git-grep go-mode direx dired+ counsel)))

(defun window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 2)))

(defun scroll-up-half ()
  (interactive)
  (scroll-up (window-half-height)))

(defun scroll-down-half ()
  (interactive)
  (scroll-down (window-half-height)))

(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
        (revert-buffer t t t) )))
  (message "Refreshed open files.") )

(setq linum-delay t)

(scroll-bar-mode -1)

(global-set-key (kbd "C-v")  'scroll-up-half)
(global-set-key (kbd "M-v")  'scroll-down-half)
(global-set-key (kbd "M-F") 'forward-word)
(global-set-key (kbd "M-B") 'backward-word)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
