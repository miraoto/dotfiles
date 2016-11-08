#
# bash config file (.bashrc)
#
#

# Source global definitions
if [ -f /etc/bashrc ]; then
         source /etc/bashrc
fi

#
# Terminal Name
#
shopt -s checkwinsize
PS1='\[\033[32m\]\u@\h\[\033[00m\]\[\033[34m\][\W]\[\033[31m\]\[\033[00m\] \$ '
#    [ `whoami` = "root" ] && PS1="\[\e[1;31m\][\u@\h (dev_dev) \W]\\$\[\e[0m\] "
#    [ `whoami` = "livesen" ] && PS1="\[\e[1;31m\][\u@\h (dev_dev) \W]\\$\[\e[0m\] "

#
# Emvironment path
#
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

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
alias vi='/usr/bin/vim'
alias vim='/usr/bin/vim'
alias health='/usr/local/bin/git-health.sh'
alias gpp='/usr/local/bin/git-pull-and-prune.sh'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:/usr/local/git/bin:$PATH"
export PGDATA=/usr/local/var/postgres
