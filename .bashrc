# .bashrc

[ -f /etc/bashrc ] && source /etc/bashrc
[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion

if [ -z "$SSH_AGENT_PID" ] || ! kill -0 "$SSH_AGENT_PID" 2>/dev/null; then
  eval "$(ssh-agent)"
fi
ssh-add -l &>/dev/null || ssh-add
unset SSH_ASKPASS

shopt -s checkwinsize
source /usr/local/bin/git-completion.bash
source /usr/local/bin/git-prompt.sh
export PS1='\[\033[32m\]\u@\[\033[34m\][\W]\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export LESSCHARSET=utf-8
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export HISTSIZE=10000

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

alias dc-stop-all='docker stop $(docker ps -q)'
alias dc-rm-all='docker rm $(docker ps -aq)'
alias dc-rmi-all='docker rmi $(docker images -q)'

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$HOME/bin:/usr/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/git/bin:/usr/local/share/git-core/contrib/diff-highlight:$PATH"
export PGDATA="/usr/local/var/postgres"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

eval "$(rbenv init -)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export NOTION_TOKEN=""
export NOTION_DATABASE_ID=""
