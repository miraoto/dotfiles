# ========================
# .zshrc
# ========================

# ---- Global zsh profile ----
[ -f /etc/zshrc ] && source /etc/zshrc

# ---- Completion ----
autoload -Uz compinit && compinit

# ---- History & usability (tweak as you like) ----
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

# ---- Exports & PATH ----
LANG=ja_JP.UTF-8
LC_ALL=ja_JP.UTF-8
LESSCHARSET=utf-8
CLICOLOR=1
LSCOLORS=ExFxBxDxCxegedabagacad   # macOS
HISTSIZE=10000
PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
PATH="$HOME/bin:/usr/bin:/usr/local/bin:/usr/local/sbin:$PATH"
PATH="/usr/local/git/bin:/usr/local/share/git-core/contrib/diff-highlight:$PATH"
VOLTA_HOME="$HOME/.volta"
PATH="$VOLTA_HOME/bin:$PATH"
NOTION_TOKEN=""
NOTION_DATABASE_ID=""

# ---- Aliases (migrated) ----
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

