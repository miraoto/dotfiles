#!/bin/sh
set -e

# リモートの最新状態を取得し、現在のブランチを更新する
echo "▶ git pull (update current branch)"
git pull

# 削除されたリモートブランチをローカルから整理する
echo "▶ git fetch --prune (cleanup remote-tracking branches)"
git fetch --prune

echo "✔ Done"
