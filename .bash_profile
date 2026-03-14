# .bash_profile

[ -f ~/.bashrc ] && source ~/.bashrc

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && \
  source "/opt/homebrew/etc/profile.d/bash_completion.sh"

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

eval "$(mise activate bash)"

eval "$(/opt/homebrew/bin/brew shellenv)"
