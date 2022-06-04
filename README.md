# preztozsh
- この後の prezto の導入で zsh 関連のファイルが作成されるため、既存の`.zprofile`や`.zshrc`などの zsh 関連ファイルは退避させるかバックアップを取って削除する

## prezto の導入
```bash
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

$ setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

$ source ~/.zshrc
```

## zsh-syntax-highlighting の設定
- `$ vim ~/.zpreztorc`
- `# Set the Prezto modules to load (browse modules).`に`'syntax-highlighting' \`を追加

```bash
# Set the Prezto modules to load (browse modules).
# The order matters.
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'syntax-highlighting' \ ← ここを追加
  'prompt'
```
- `zstyle ':prezto:module:syntax-highlighting' color 'yes'`を追加

```bash
# Set syntax highlighters.
# By default, only the main highlighter is enabled.
# zstyle ':prezto:module:syntax-highlighting' highlighters \
#   'main' \
#   'brackets' \
#   'pattern' \
#   'line' \
#   'cursor' \
#   'root'
# zstyle ':prezto:module:syntax-highlighting' color 'yes' ← ここを追加
```
- `$ source ~/.zpreztorc`

## テーマの変更
- `$ vim ~/.zpreztorc`
- `zstyle ':prezto:module:prompt' theme 'steeef'`

# peco
- `$ brew install peco`
- `$ vim ~/.zshrc`

```bash
function peco-history-selection() {
  BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
  CURSOR=${#BUFFER}
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection
```
- `$ source ~/.zshrc`

# tig
- `$ brew install tig`
- `git config --global core.editor vim`

# ~/.zshrc
```bash
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

#
# PATH
#

#
# Alias
#

alias ll='ls -al'

alias ga='git add'
alias gc='git commit'
alias gl='git log'
alias glo='git log --oneline'
alias gd='git diff'
alias gs='git status'
alias gst='git stash'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gb='git branch'
alias gco='git checkout'
alias gm='git merge'
alias gps='git push'
alias gpl='git pull'

alias dp='docker ps'
alias dc='docker-compose'
alias du='docker-compose up'
alias dud='docker-compose up -d'
alias dd='docker-compose down'

alias szr='source ~/.zshrc'

#
# peco
#

function peco-history-selection() {
  BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
  CURSOR=${#BUFFER}
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection
```

# Clipy
- メイン
  - 変更なし
- 履歴
  - ⌥ v
- スニペット
  - 削除

# Spectacle
- Fullscreen
  - ⌥ F
- Next Display
  - ⌥ ⇧ ⌘ ↑
- Previous Display
  - ⌥ ⇧ ⌘ ↓
- Left Half
  - ⌥ ←
- Right Half
  - ⌥ →

# iTerm
- Profiles
  - Text > Font
    - Courier New
    - Bold Italic
    - 16 100 100
  - Terminal
    - Scrollback Buffer
      - Unlimited scrollback

# IDE
- Editor > Font
  - Courier New
- Keymap
  - Go to File
    - ⇧ ⌘ N

# Sequel
- Font
  - Courier New, 14.0 ~ 16.0 pt
- Auto uppercase keywords

![img.png](img.png)