# zsh はインタラクティブシェルで .zshrc を自動的に読み込むため、
# .zprofile から source ~/.zshrc は不要（重複読み込みになるため削除）。
# .zprofile はログインシェル一度限りの環境変数設定に専念する。

eval "$(/opt/homebrew/bin/brew shellenv)"
