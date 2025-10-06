# 初回シェル時のみ tmux を実行
#if [ "$SHLVL" = 1 ]; then
#  tmux
#fi

# ユーザー設定読み込み
[ -f ~/.zshrc ] && source ~/.zshrc

eval "$(/opt/homebrew/bin/brew shellenv)"
