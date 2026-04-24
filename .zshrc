# .zshrc

[ -f /etc/zshrc ] && source /etc/zshrc

autoload -Uz compinit && compinit

setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt AUTO_CD
setopt EXTENDED_GLOB

source /usr/local/bin/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
setopt PROMPT_SUBST
PS1='%F{cyan}%n:%c%f%F{red}$(__git_ps1 "(%s)")%f\$ '

export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export LESSCHARSET=utf-8
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export HISTSIZE=10000
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$HOME/bin:/usr/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/git/bin:/usr/local/share/git-core/contrib/diff-highlight:$PATH"
eval "$(mise activate zsh)"
export NOTION_TOKEN=""
export NOTION_DATABASE_ID=""

alias vi='/usr/bin/vim'
alias vim='/usr/bin/vim'
alias du='du -h'
alias ls='eza'
alias ll='eza -la --git'
alias lt='eza --tree --level=2'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep -G -ERUIn'
alias gpo='git push origin'
alias wip='git commit --allow-empty -m'
alias f='open -a Finder ./'
alias health='/usr/local/bin/git-health.sh'
alias gpp='/usr/local/bin/git-pull-and-prune.sh'
alias co='git checkout'
alias gdel='git branch -D'
alias home='cd ~/Documents/Products'
alias gsm='git submodule update --init --recursive'
alias port='lsof -iTCP -sTCP:LISTEN -P -n 2>/dev/null | head -50'
alias dcex='docker compose exec app bash'
alias dcst='docker compose build && docker compose up'
alias cat='bat'
# mise 環境では claude のバイナリが npm グローバルで管理されるため、
# `claude update` でアップデートできるようシェル関数でラップしている
claude() {
  if [ "$1" = "update" ]; then
    npm install -g @anthropic-ai/claude-code@latest
  else
    "$(mise which claude 2>/dev/null || command -v claude)" "$@"
  fi
}

# 同じリポジトリの複数タブで並行 PR 作業するために、worktree を切ってそこで claude を起動する。
# usage: claude-wt <name> [base-branch]
#   例) claude-wt fix-auth          → ../<repo>-wt-fix-auth に wt/fix-auth ブランチを作成
#   例) claude-wt hotfix develop    → base を develop にして分岐
claude-wt() {
  local name="$1"
  local base="${2:-main}"
  if [ -z "$name" ]; then
    echo "usage: claude-wt <name> [base-branch]" >&2
    return 1
  fi
  local repo_root
  repo_root="$(git rev-parse --show-toplevel 2>/dev/null)" || {
    echo "error: not inside a git repository" >&2
    return 1
  }
  local dir="$(dirname "$repo_root")/$(basename "$repo_root")-wt-${name}"
  if [ -e "$dir" ]; then
    echo "error: $dir already exists" >&2
    return 1
  fi
  git worktree add "$dir" -b "wt/${name}" "$base" || return 1
  cd "$dir" && claude
}

# claude-wt で作成した worktree を削除する。
# usage: claude-wt-rm <name>
claude-wt-rm() {
  local name="$1"
  if [ -z "$name" ]; then
    echo "usage: claude-wt-rm <name>" >&2
    return 1
  fi
  local repo_root
  repo_root="$(git rev-parse --show-toplevel 2>/dev/null)" || {
    echo "error: not inside a git repository" >&2
    return 1
  }
  local dir="$(dirname "$repo_root")/$(basename "$repo_root")-wt-${name}"
  git worktree remove "$dir"
}

# 現在のリポジトリに紐づく worktree 一覧を表示する。
alias claude-wt-ls='git worktree list'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# yazi: 終了時にカレントディレクトリを同期するラッパー
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
