# dotfiles

Development environment configuration files for macOS.

## Structure

```
dotfiles/
├── .bash_profile         # Bash login shell config
├── .bashrc               # Bash config
├── .brew-list            # Homebrew package list
├── .config/
│   └── ghostty/config    # Ghostty terminal config
├── .gitconfig            # Git config
├── .gitconfig-private    # Git private config (includeIf)
├── .rubocop.yml          # RuboCop config
├── .tmux.conf            # tmux config (Catppuccin theme)
├── .vimrc                # Vim config (dein.vim)
├── .vscode/
│   └── settings.json     # VSCode settings
├── .zprofile             # Zsh profile
├── .zshrc                # Zsh config
├── Fonts/                # Fonts (Ricty Powerline)
├── git-completion.bash   # Git completion script
├── git-health.sh         # Git status check script
├── git-prompt.sh         # Git prompt display script
├── git-pull-and-prune.sh # Git pull & prune script
└── tmux-ready.sh         # tmux dev session launcher
```

## Setup

### 1. Clone the repository

```bash
git clone https://github.com/your-username/dotfiles.git ~/dotfiles
```

### 2. Create symlinks

```bash
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitconfig-private ~/.gitconfig-private
ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.rubocop.yml ~/.rubocop.yml
mkdir -p ~/.config/ghostty
ln -sf ~/dotfiles/.config/ghostty/config ~/.config/ghostty/config
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

- Git prompt with dirty/untracked/stash/upstream indicators
- Modern CLI aliases: `eza` (ls), `bat` (cat), `ripgrep` (grep)
- Volta for Node.js version management
- fzf fuzzy finder integration
- Git aliases: `gpo`, `wip`, `co`, `health`, `gpp`

### Vim

- Plugin manager: dein.vim
- Lint: ALE / Finder: Denite / Explorer: defx
- Colorscheme: Solarized Dark
- Leader key: Space

### tmux

- Vi mode key bindings with mouse support
- Catppuccin Mocha theme
- Alt+h/j/k/l for pane navigation (prefix-free)
- fzf popup for file selection (`prefix+f`) and session switching (`prefix+S`)
- Copy-mode with pbcopy integration
- Session persistence via tmux-resurrect / tmux-continuum

### tmux-ready.sh

Dev session launcher. Creates a tmux session with 3 panes:
1. Claude Code
2. `bun dev`
3. `health` (git status check)

### Ghostty

- Font: UDEV Gothic 35NF
- Japanese text optimized (cell width +10%)
- Semi-transparent background (0.96)

### Git helper scripts

```bash
health    # Display branches and status
gpp       # Pull and prune stale remote branches
```

## Requirements

- [Homebrew](https://brew.sh/)
- tmux 3.0+
- Vim 8+

## License

MIT
