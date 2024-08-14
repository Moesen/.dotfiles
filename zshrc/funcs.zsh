grafana() {
    o=$(kubectl get svc -n ameya --field-selector metadata.name=grafana -o custom-columns=external:.status.loadBalancer.ingress)
    regex='\[map\[ip:(([0-9]{1,3}\.?){4})'
    if [[ $o =~ $regex ]]; then
        ip=${match[1]}
        firefox --new-tab "http://$ip"
    else
        echo "Grafana external ip not found"
    fi
}

docker_status() {
    docker ps --format 'table {{.ID}} \t {{.Names}} \t {{.Status}}'
}

function setup_tmux_cluster_test() {
    local window_name="cluster test"
    # Check if inside a tmux session
    if [ -z "$TMUX" ]; then
        # Not in tmux, start a new session
        tmux new-session -d -s dev -n "$window_name"
    else
        # In tmux, create a new window
        tmux new-window -n "$window_name"
    fi

    # Split window into panes
    tmux split-window -h
    tmux select-pane -t 0
    tmux split-window -v

    # Run make commands in the left panes
    tmux send-keys -t 0 'make -C ~/alvenir/ameya/infrastructure ingress-port-forward' C-m
    tmux send-keys -t 1 'make -C ~/alvenir/ameya/infrastructure egress-port-forward' C-m

    # Change directory in the right pane
    tmux select-pane -t 2
    tmux send-keys 'cd ~/alvenir/ameya/dev-tools/grpc-tools' C-m

    # Attach to tmux session or window
    tmux attach-session -t dev
}

function start_local_demo() {
  local window_name="demo_setup"
  if [ -z "$TMUX" ]; then
    tmux new-session -d -s dev -n "$window_name"
  else
    tmux new-window -n "$window_name"
  fi

  tmux split-window -h
  tmux select-pane -t 0
  tmux split-window -v
  tmux split-window -v

  tmux select-pane -t 3
  tmux split-window -v

  tmux send-keys -t 0 "kubectl port-forward -n ameya svc/ingress-interface-grpc 50051" C-m
  tmux send-keys -t 1 "kubectl port-forward -n ameya svc/egress-interface-grpc 50054" C-m
  tmux send-keys -t 2 "kubectl port-forward -n data-processing svc/bitnami-redis-master 6379" C-m

  tmux send-keys -t 3 "make -C ~/alvenir/ameya-demo run-server" C-m
  tmux send-keys -t 4 "make -C ~/alvenir/ameya-demo run-client" C-m

  tmux attach-session -t dev
}

sc() {
    cur=$(pwd)
}
gb() {
    cd $cur
}

function force_delete_pods() {
    readonly namespace=${1:?"Namespace must be specified"}
    readonly podpattern=${2:?"Pod Pattern must be specified"}
    for pod in $(echo "$(kubectl get pods -n $namespace -o name | grep $podpattern)")
    do
        podname=${pod##*/}
        echo "kubectl delete pod -n $namespace $podname --force"
        echo "$(kubectl delete pod -n $namespace $podname --force)"
    done
}
push_notes() {
    tmp=$(pwd)
    cd ~/Vaults/vault-alvenir
    git add .
    git commit -m "auto: add notes for the day"
    git push
    cd $tmp
    unset tmp
}

decode_secret() {
    readonly secret_name=${1:?"Secretname needs to be provided"}
    readonly namespace=${2:?"Namespace needs to be provided"}
    kubectl get secret $secret_name -n $namespace -o json | jq '.data | map_values(@base64d)'
}

gni () {
    readonly pattern=${1:?"Text pattern needs to be provided"}
    grep -rni $1 *
}

gotodot() {
  if [[ -n "$TMUX" ]]; then
    tmux new-window -n ".dotfiles"
    tmux send-keys -t 0 "cd ~/.dotfiles" C-m
  else
    cd ~/.dotfiles
  fi
}

create_new_venv (){
  python3 -m venv venv
  source ./venv/bin/activate
  pip install ruff pynvim neovim pyright
}

kill_tmux_server (){
  read -p "Kill tmux-server? (y/n): " answer
  if [ "$answer" = "y" ]; then
    echo "Killing server!";
    tmux kill-server
  fi
}
