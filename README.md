# dotfiles

Development environment configuration files for macOS.

## Structure

```
dotfiles/
├── .zshrc              # Zsh configuration
├── .bashrc             # Bash configuration
├── .bash_profile       # Bash login shell configuration
├── .vimrc              # Vim configuration (dein.vim + ALE + Denite + defx)
├── .tmux.conf          # tmux configuration
├── .gitconfig          # Git configuration
├── .gitconfig-private  # Git private configuration (for includeIf)
├── .rubocop.yml        # RuboCop configuration
├── .brew-list          # Homebrew package list
├── Fonts/              # Fonts (Ricty Powerline)
├── git-prompt.sh       # Git prompt display script
├── git-completion.bash # Git completion script
├── git-health.sh       # Git status check script
└── git-pull-and-prune.sh # Git pull & prune script
```

## Setup

### 1. Clone the repository

```bash
git clone https://github.com/your-username/dotfiles.git ~/dotfiles
```

### 2. Create symbolic links

```bash
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.rubocop.yml ~/.rubocop.yml
```

### 3. Install Git helper scripts

```bash
sudo cp ~/dotfiles/git-prompt.sh /usr/local/bin/
sudo cp ~/dotfiles/git-health.sh /usr/local/bin/
sudo cp ~/dotfiles/git-pull-and-prune.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/git-*.sh
```

### 4. Install Homebrew packages

```bash
xargs brew install < ~/dotfiles/.brew-list
```

### 5. Install fonts

Double-click `Fonts/Ricty-Regular-Powerline.ttf` to install.

## Features

### Zsh

- Git branch and status displayed in prompt
- Useful aliases (`ll`, `gpo`, `co`, `health`, `gpp`, etc.)
- Node.js version management via Volta

### Vim

- **Plugin manager**: dein.vim
- **Lint/Fix**: ALE (supports Prettier, RuboCop, Black)
- **Fuzzy finder**: Denite (with ripgrep integration)
- **File explorer**: defx
- **Color scheme**: Solarized Dark
- **Status line**: lightline.vim

#### Key mappings

| Key | Function |
|-----|----------|
| `<Space>f` | File search (Denite) |
| `<Space>b` | Buffer list |
| `<Space>g` | Grep search |
| `<Space>e` | File explorer (defx) |
| `<Space>w` | Save |
| `<Space>q` | Quit |

### tmux

- Vi mode for copy operations
- Mouse support
- macOS clipboard integration (pbcopy)
- tmux-powerline status bar

### Git helper scripts

```bash
# Display branches and status
health

# Pull and prune stale remote branches
gpp
```

## Requirements

- macOS (Apple Silicon supported)
- Homebrew
- Vim 8+ with Python3 (or Neovim)
- tmux 3.0+

## License

MIT
