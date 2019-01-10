# 初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
  tmux
fi
# loading user setting .bashrc
if [ -f ~/.bashrc ] ; then
  source ~/.bashrc
fi
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Applicable only when mysql@5.6 is installed at homebrew
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/mysql@5.6/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/mysql@5.6/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.6/include"
