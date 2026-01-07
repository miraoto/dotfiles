# .bash_profile

[ -f ~/.bashrc ] && source ~/.bashrc

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && \
  source "/opt/homebrew/etc/profile.d/bash_completion.sh"

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"
