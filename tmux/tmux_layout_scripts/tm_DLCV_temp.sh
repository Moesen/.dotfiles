#!/bin/zsh

#! /bin/bash

function usage() {
    cat <<USAGE
    Script for starting tmux in preconfigured layout

    Usage: $0 [-e env]

    Options:
        -e, --env:            Choose conda env to start tmux with
USAGE
    exit 1
}

if [ $# -eq 0 ]; then
    usage
    exit 1
fi

ENV=

while [ "$1" != "" ]; do
    case $1 in
        -e | --env)
            shift
            ENV=$1
            ;;
        -h | --help)
            usage
            ;;
        *)
            usage
            exit 1
            ;;
    esac
    shift
done

session="DLCV"
tmux new-session -d -s $session

window=0
tmux rename-window -t $session:$window "main"
tmux send-keys -t $session:$window "conda activate $ENV" C-m
tmux send-keys -t $session:$window "clear" C-m

window=1
tmux new-window -t $session:$window -n 'v'
tmux send-keys -t $session:$window "conda activate $ENV" C-m
tmux send-keys -t $session:$window "clear" C-m

window=2
tmux new-window -t $session:$window -n "hpc-ssh"
tmux send-keys -t $session:$window "conda activate $ENV" C-m
tmux send-keys -t $session:$window "clear" C-m

window=3
tmux new-window -t $session:$window -n "btop"
tmux send-keys -t $session:$window "btop" C-m

tmux attach-session -t $session
