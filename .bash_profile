# ========================
# .bash_profile
# ========================

# ユーザー設定読み込み
[ -f ~/.bashrc ] && source ~/.bashrc

# Homebrew 補完
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && \
  source "/opt/homebrew/etc/profile.d/bash_completion.sh"

# GVM
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Homebrew のパス設定
eval "$(/opt/homebrew/bin/brew shellenv)"

