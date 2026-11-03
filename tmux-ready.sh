#!/bin/bash

SESSION="dev"

# editor
# ウィンドウは番号ではなく名前で指定する（.tmux.conf の base-index に左右されないため）
tmux new-session -d -s $SESSION -n workspace
tmux send-keys -t $SESSION:workspace 'nvim .' C-m

# split
tmux split-window -h
tmux send-keys 'claude' C-m

tmux select-pane -t 0
tmux split-window -v
tmux send-keys 'bun dev' C-m

tmux select-pane -t 1
tmux split-window -v
tmux send-keys 'health' C-m

tmux attach -t $SESSION
