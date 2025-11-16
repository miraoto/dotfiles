# 推奨設定ガイド

リポジトリの分析結果を基に、以下の設定・改善を推奨します。

## 1. CLAUDE.md への追加推奨項目

### シェルスクリプト開発のガイドライン
あなたのリポジトリはシェルスクリプトが92.2%を占めているため、以下を`team.md`に追加することを推奨：

```bash
# シェルスクリプトのベストプラクティス
- set -euo pipefail を使用（エラー時即座停止）
- shellcheck でリント実施
- 関数には必ずローカル変数を使用
- 引用符の適切な使用（"$変数"）
```

### Git ワークフロー
`git-health.sh`や`git-pull-and-prune.sh`などのカスタムスクリプトがあるため：

```markdown
## Git運用ルール
- 定期的な git-health.sh の実行でリポジトリ健全性チェック
- git-pull-and-prune.sh でブランチの定期クリーンアップ
- コミットメッセージは Conventional Commits 形式を推奨
```

## 2. 開発環境設定の改善

### .vimrc の最適化
現在の設定に加えて、TypeScript開発向けの設定を追加：

```vim
" TypeScript/JavaScript 開発向け
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'  " TypeScript Syntax

" coc-tsserver, coc-eslint, coc-prettier をインストール
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]
```

### .zshrc の改善
環境変数の管理を改善：

```bash
# .env.local ファイルから環境変数を読み込む（機密情報用）
if [ -f ~/.env.local ]; then
  source ~/.env.local
fi

# NOTION_TOKEN と NOTION_DATABASE_ID を .env.local に移動
# 現在の .zshrc から削除し、.env.local で管理
```

## 3. 新規追加推奨ファイル

### .editorconfig
プロジェクト間でのコーディングスタイル統一：

```ini
# .editorconfig
root = true

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true

[*.{ts,tsx,js,jsx}]
indent_style = space
indent_size = 2

[*.{sh,bash,zsh}]
indent_style = space
indent_size = 2

[*.md]
trim_trailing_whitespace = false
```

### .gitattributes
改行コードの統一：

```
# .gitattributes
* text=auto eol=lf
*.sh text eol=lf
*.bash text eol=lf
*.zsh text eol=lf
```

## 4. Claude 専用設定の拡張

### .claude/settings.json の推奨更新
```json
{
  "env": {
    "SHELL": "/opt/homebrew/bin/zsh",  // bash → zsh に変更を検討
    "ZSH_ENV": ".zshrc"
  },
  "permissions": {
    "allow": [
      "Read(.vimrc)",
      "Read(.zshrc)",
      "Read(.bashrc)",
      "Read(.tmux.conf)",
      "Read(src/**)",
      "Read(README.md)",
      "Bash(/opt/homebrew/bin/zsh -c *)",
      "Bash(shellcheck *)",  // シェルスクリプトのリント
      "Bash(git-health.sh)"  // カスタムスクリプトの実行
    ],
    "deny": [
      "Bash(curl *)",
      "Bash(wget *)",
      "Bash(ssh *)",
      "Bash(scp *)",
      "Write(.env*)",  // 環境変数ファイルの書き換え防止
      "Read(.env.local)"  // 機密情報の読み取り防止
    ]
  },
  "hooks": {
    "pre-commit": "shellcheck *.sh",
    "post-edit": "vim +PlugUpdate +qall"  // Vimプラグイン自動更新
  }
}
```

## 5. team.md への追加項目

### macOS 開発環境の標準
```markdown
## 開発環境
### 必須ツール
- Homebrew (パッケージ管理)
- Volta (Node.jsバージョン管理)
- tmux (ターミナルマルチプレクサー)

### 推奨エディタ設定
- Vim8 + Python3 or Neovim
- dein.vim (プラグインマネージャー)
- ALE (Linter/Formatter)
```

### Ruby開発の規約（.rubocop.yml があるため）
```markdown
## Ruby開発
- RuboCop によるコード品質管理
- .rubocop.yml の設定に従う
- bundle exec rubocop での自動修正
```

## 6. パフォーマンス最適化

### シェル起動の高速化
```bash
# .zshrc に追加
# Lazy loading for nvm/rbenv など
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  alias nvm='unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm'
fi
```

## 7. セキュリティ強化

### .gitignore の更新
```
# 機密情報
.env
.env.local
.env.*.local
*.pem
*.key

# OS files
.DS_Store
Thumbs.db

# Editor
.idea/
.vscode/
*.swp
*.swo
*~
```

## まとめ

あなたのdotfilesは既に良く整理されていますが、以下の点で改善できます：

1. **環境変数の安全な管理** - .env.local への移行
2. **TypeScript開発環境の強化** - 現在の設定をベースに拡張
3. **シェルスクリプトの品質向上** - shellcheckの導入
4. **Claude設定の最適化** - zshベースの設定への移行

これらの設定により、より安全で効率的な開発環境が構築できます。