#!/bin/zsh
session="DLCV"

tmux new-session -d -s $session

window=0
tmux rename-window -t $session:$window -n "main"

window=1
tmux new-window -t $session:$window -n 'v'

window=2
tmux new-window -t $session:$window -n "hpc-ssh"

window=3
tmux new-window -t $session:$window -n "hpc-sshfs"
tmux send-keys -t $session:$window "sshfs s174169@login1.hpc.dtu.dk:/zhome/e9/5/127519/git ~/sc" 

tmux attach-session -t $session
