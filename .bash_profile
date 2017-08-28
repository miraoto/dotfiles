
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

export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
