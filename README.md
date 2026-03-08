# dotfiles

Development environment configuration files for macOS.

## Structure

```
dotfiles/
├── Fonts/                  # Fonts (Ricty Powerline)
├── git-prompt.sh           # Git prompt display script
├── git-completion.bash     # Git completion script
├── git-health.sh           # Git status check script
├── git-pull-and-prune.sh   # Git pull & prune script
└── tmux-ready.sh           # tmux dev session launcher
```

## Setup

### 1. Clone the repository

```bash
git clone https://github.com/your-username/dotfiles.git ~/dotfiles
```

### 2. Install Git helper scripts

```bash
sudo cp ~/dotfiles/git-prompt.sh /usr/local/bin/
sudo cp ~/dotfiles/git-health.sh /usr/local/bin/
sudo cp ~/dotfiles/git-pull-and-prune.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/git-*.sh
```

### 3. Install fonts

Double-click `Fonts/Ricty-Regular-Powerline.ttf` to install.

## Features

### tmux-ready.sh

tmux dev session launcher. Creates a session with 3 panes:
1. Claude Code
2. `bun dev`
3. `health` (git status check)

### Git helper scripts

```bash
# Display branches and status
health

# Pull and prune stale remote branches
gpp
```

## Requirements

- macOS (Apple Silicon supported)
- tmux 3.0+

## License

MIT
