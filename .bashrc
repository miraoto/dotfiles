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
# Setup ssh-agent
#
if [ -f ~/.ssh-agent ]; then
  eval `ssh-agent`
fi
if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
  ssh-agent > ~/.ssh-agent
  eval `ssh-agent`
fi
ssh-add -l >& /dev/null || ssh-add
#
# Terminal Name
#
shopt -s checkwinsize
source /usr/local/bin/git-completion.bash
source /usr/local/bin/git-prompt.sh
export PS1='\[\033[32m\]\u@\[\033[34m\][\W]\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
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
alias du='du -h'
alias ls='ls -FG'
alias ll='ls -laG'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep -G -ERUIn'
alias gpo='git push origin'
alias wip='git commit --allow-empty -m'
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
alias co='git checkout'
alias home='cd ~/Documents/Products'
# For Development shortcut
alias start='bundle exec unicorn_rails -c config/unicorn/development.rb -E development'
alias start-prof='ENABLE_RACK_PROFER=1 bundle exec unicorn_rails -c config/unicorn/development.rb -E development'
alias raketasks='bundle exec rake -vT'
#
# Emvironment path
#
export PYENV_ROOT=$HOME/.pyenv
export PATH=$HOME/bin:/usr/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/heroku/bin:$PATH
export PATH=/usr/local/git/bin:/usr/local/share/git-core/contrib/diff-highlight:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PYENV_ROOT/bin:$HOME/.rbenv/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PGDATA=/usr/local/var/postgres
#
# Eval version management tools
#
eval "$(rbenv init -)"
# eval "$(pyenv init -)"
export PATH="${HOME}/.ndenv/bin:${PATH}"
eval "$(ndenv init -)"
