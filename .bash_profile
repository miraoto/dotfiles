
# loading user setting .bashrc
#
if [ -f ~/.bashrc ] ; then
    source ~/.bashrc
fi
if which rbenv > /dev/null; then 
    eval "$(rbenv init -)";
fi
# 初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
  tmux
fi
# Setup ssh-agent
if [ -f ~/.ssh-agent ]; then
    . ~/.ssh-agent
fi
if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
    ssh-agent > ~/.ssh-agent
    . ~/.ssh-agent
fi
ssh-add -l >& /dev/null || ssh-add

export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
export PATH="/usr/local/bin:$PATH"
