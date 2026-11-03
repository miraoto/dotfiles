#!/bin/bash

SESSION="dev"

tmux new-session -d -s $SESSION

# editor
# .tmux.conf で base-index 1 にしているため、最初のウィンドウは 1 番
tmux rename-window -t $SESSION:1 'workspace'
tmux send-keys -t $SESSION:1 'nvim .' C-m

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
