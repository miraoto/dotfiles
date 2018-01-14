# 初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
  tmux
fi
# loading user setting .bashrc
if [ -f ~/.bashrc ] ; then
  source ~/.bashrc
fi
