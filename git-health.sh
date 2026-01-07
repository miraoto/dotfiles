#!/bin/sh

# 作業前に Git の現在状態を一覧で確認するスクリプト

clear

echo "===== Git Branches ====="
git branch

echo ""
echo "===== Git Status ====="
git status
