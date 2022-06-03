#!/bin/zsh
session="DLCV"

tmux new-session -d -s $session

window=0
tmux rename-window -t $session:$window "main"

window=1
tmux new-window -t $session:$window -n 'v'
tmux 
