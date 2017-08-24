#
# bash config file (.bashrc)
#
#
# Source global definitions
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi
if [ -f .env.sample ] ; then
  source .env.sample
fi
#
# Terminal Name
#
shopt -s checkwinsize
source /usr/local/bin/git-completion.bash
source /usr/local/bin/git-prompt.sh
export PS1='\[\033[32m\]\u@\[\033[34m\][\W]\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
#
# Emvironment path
#
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/heroku/bin:$PATH
export PATH=/usr/local/git/bin:/usr/local/share/git-core/contrib/diff-highlight:$PATH
#
# Encoding
#
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export HISTSIZE=10000
#
# alias command list
#
alias vi='vim'
alias crontab='crontab -i'
alias du='du -h'
alias ls='ls -FG'
alias ll='ls -laG'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep -G -ERUIn'
#
# unset env
#
unset SSH_ASKPASS
#
# Alias for mac
#
alias f='open -a Finder ./'
alias atom='open -a Atom ./'
alias vi='/usr/bin/vim'
alias vim='/usr/bin/vim'
alias health='/usr/local/bin/git-health.sh'
alias gpp='/usr/local/bin/git-pull-and-prune.sh'
alias home='cd ~/Documents/Products'
export PGDATA=/usr/local/var/postgres

