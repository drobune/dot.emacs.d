                                        ; theme
(load-theme 'wombat t)

                                        ; font
                                        ;(set-frame-font "ricty-16.5")

                                        ; full-screen
                                        ;(toggle-frame-fullscreen)

                                        ; フレーム透過設定
(set-frame-parameter (selected-frame) 'alpha '(85 90))

                                        ; utf-8
(set-default-coding-systems 'utf-8)

                                        ; スクロールバー
(when window-system (scroll-bar-mode -1))

                                        ; packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

                                        ; フリンジに行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil :height 0.8)
(setq linum-format "%4d")

                                        ; helem
(require 'helm-config)

                                        ; helm-git-grep
(global-set-key (kbd "C-c g") 'helm-git-grep)
(global-set-key (kbd "M-X") 'helm-M-x)
(global-set-key (kbd "C-x f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-c f") 'helm-occur)
(helm-mode 1)

                                        ; TABで補完
(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)

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
(setq blink-cursor-interval 0.3)
(setq blink-cursor-delay 1.0)

                                        ; evalした結果を全部表示
(setq eval-expression-print-length nil)

                                        ; 対応する括弧を光らせる。
(show-paren-mode 1)

                                        ; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)

                                        ; for php
(require 'php-mode)

                                        ; 現在行を目立たせる
(global-hl-line-mode)

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

                                        ;ruby-modeのマジックコメントを削除
(require 'ruby-mode)
                                        ;(defun ruby-mode-set-encoding () nil)
(setq ruby-insert-encoding-magic-comment nil)

                                        ; for yml
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

                                        ; 空白や長すぎる行を視覚化する。
(require 'whitespace)

                                        ; デフォルトで視覚化を有効にする。
(global-whitespace-mode 1)

                                        ; 1行が80桁を超えたら長すぎると判断する。
(setq whitespace-line-column 80)

                                        ; 視覚化の設定
(setq whitespace-style '(face              ; faceを使って視覚化する。
                         trailing          ; 行末の空白を対象とする。
                         lines-tail        ; 長すぎる行のうち
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
        (newline-mark ?\n    [?\u21B5 ?\n] [?\u240D ?\n])
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

(defvar my/bg-color "#232323")
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

;; コントロール用のバッファを同一フレーム内に表示
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; diffのバッファを上下ではなく左右に並べる
(setq ediff-split-window-function 'split-window-horizontally)

(require 'auto-complete-config)
(ac-config-default)
(setq ac-use-fuzzy t)


(setq make-backup-files nil)
(put 'upcase-region 'disabled nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)


(defun jump-to-github ()
  "Go to github code position at most recent commitl;"
  (interactive)
  (let (full_path)
    (setq
     full_path buffer-file-name
     dir_name (shell-command-to-string (concat "echo " full_path "| xargs dirname"))
     cd_dir (shell-command-to-string (concat "cd " dir_name))
     prefix (shell-command-to-string "git rev-parse  --show-prefix | tr -d '\n'")
     current_commit (shell-command-to-string "git show -s --format=%H | tr -d '\n'")
     current_line (count-lines 1 (point))
     repo_name (shell-command-to-string "git remote -v | grep origin | head -1 | awk '{sub(\"git@github.com:\",\"\");sub(\".git\",\"\");print $2}' | tr -d '\n'")
     github_url (concat "https://github.com/"
                        repo_name "/blob/" current_commit "/"
                        prefix (buffer-name) "#L" (number-to-string current_line)))
    (shell-command (concat "xdg-open " github_url))))

(global-set-key (kbd "M-b") 'jump-to-github)
