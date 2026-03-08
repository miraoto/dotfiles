#!/bin/bash

SESSION="dev"

tmux new-session -d -s $SESSION

# editor
tmux rename-window -t $SESSION:0 'workspace'
tmux send-keys -t $SESSION:0 'nvim .' C-m

# split
tmux split-window -h
tmux send-keys 'claude' C-m

tmux select-pane -t 0
tmux split-window -v
tmux send-keys 'npm run dev' C-m

tmux select-pane -t 1
tmux split-window -v
tmux send-keys 'git status' C-m

tmux attach -t $SESSION
