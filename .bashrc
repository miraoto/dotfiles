# ========================
# .bashrc
# ========================

# ---- グローバル定義読み込み ----
[ -f /etc/bashrc ] && source /etc/bashrc
[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion

# ---- ssh-agent 設定 ----
if [ -z "$SSH_AGENT_PID" ] || ! kill -0 "$SSH_AGENT_PID" 2>/dev/null; then
  eval "$(ssh-agent)"
fi
ssh-add -l &>/dev/null || ssh-add
unset SSH_ASKPASS

# ---- ターミナル設定 ----
shopt -s checkwinsize
source /usr/local/bin/git-completion.bash
source /usr/local/bin/git-prompt.sh
export PS1='\[\033[32m\]\u@\[\033[34m\][\W]\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

# ---- ロケール・履歴 ----
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export LESSCHARSET=utf-8
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad   # macOS
export HISTSIZE=10000

# ---- alias ----
alias vi='/usr/bin/vim'
alias vim='/usr/bin/vim'
alias du='du -h'
alias ls='ls -FG'
alias ll='ls -laG'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep -G -ERUIn'
alias gpo='git push origin'
alias wip='git commit --allow-empty -m'
alias f='open -a Finder ./'
alias health='/usr/local/bin/git-health.sh'
alias gpp='/usr/local/bin/git-pull-and-prune.sh'
alias co='git checkout'
alias home='cd ~/Documents/Products'

# 開発用ショートカット
alias dc-stop-all='docker stop $(docker ps -q)'
alias dc-rm-all='docker rm $(docker ps -aq)'
alias dc-rmi-all='docker rmi $(docker images -q)'

# ---- PATH 設定 ----
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
# /usr/local/bin を /usr/bin より優先
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:$PATH"
export PATH="/usr/local/git/bin:/usr/local/share/git-core/contrib/diff-highlight:$PATH"
export PGDATA="/usr/local/var/postgres"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# ---- バージョン管理ツール ----
eval "$(rbenv init -)"
# mise（Node などのバージョン管理。volta から移行）
eval "$(mise activate bash)"

# MPC 関連設定（Keychain から取得）
export NOTION_TOKEN="$(security find-generic-password -a "$USER" -s "NOTION_TOKEN" -w 2>/dev/null)"
export NOTION_DATABASE_ID="$(security find-generic-password -a "$USER" -s "NOTION_DATABASE_ID" -w 2>/dev/null)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
