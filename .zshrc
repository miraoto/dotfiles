# .zshrc

[ -f /etc/zshrc ] && source /etc/zshrc

autoload -Uz compinit && compinit

setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt AUTO_CD
setopt EXTENDED_GLOB

source /usr/local/bin/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
setopt PROMPT_SUBST
PS1='%F{cyan}%n:%c%f%F{red}$(__git_ps1 "(%s)")%f\$ '

export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export LESSCHARSET=utf-8
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export HISTSIZE=10000
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$HOME/bin:/usr/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/git/bin:/usr/local/share/git-core/contrib/diff-highlight:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export NOTION_TOKEN=""
export NOTION_DATABASE_ID=""

alias vi='/usr/bin/vim'
alias vim='/usr/bin/vim'
alias du='du -h'
alias ls='eza'
alias ll='eza -la --git'
alias lt='eza --tree --level=2'
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
alias port='lsof -iTCP -sTCP:LISTEN -P -n 2>/dev/null | head -50'
alias cat='bat'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
