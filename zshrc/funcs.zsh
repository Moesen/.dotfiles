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
    echo "ca.crt: " $(kubectl get secret -n ${namespace} ${secret_name} -o jsonpath='{.data.ca\.crt}' | base64 --decode)
    echo "tls.crt: " $(kubectl get secret -n ${namespace} ${secret_name} -o jsonpath='{.data.tls\.crt}' | base64 --decode)
    echo "tls.key: " $(kubectl get secret -n ${namespace} ${secret_name} -o jsonpath='{.data.tls\.key}' | base64 --decode)
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

enable_velliv_profile (){
  export AWS_PROFILE="Sandbox-Administrator-841162689808"
}

disable_aws_profile (){
  unset AWS_PROFILE
}


change_screen_normal () {
    xrandr --output eDP --primary --mode 1920x1200 --pos 3840x0 --rotate normal --output HDMI-A-0 --off --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off --output DVI-I-2-2 --mode 1920x1080 --pos 0x0 --rotate normal --output DVI-I-1-1 --mode 1920x1080 --pos 1920x0 --rotate normal
    sed -i 's/screen.primary:.*$/screen.primary: DVI-I-1-1/' ~/.Xresources
    sed -i 's/screen.secondary:.*$/screen.secondary: DVI-I-2-2/' ~/.Xresources
    xrdb -merge ~/.Xresources
}

# Function to move workspaces to the opposite screen
change_screen_mirrored () {
    xrandr --output eDP --primary --mode 1920x1200 --pos 3840x0 --rotate normal --output HDMI-A-0 --off --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off --output DVI-I-2-2 --mode 1920x1080 --pos 1920x0 --rotate normal --output DVI-I-1-1 --mode 1920x1080 --pos 0x0 --rotate normal
    sed -i 's/screen.primary:.*$/screen.primary: DVI-I-2-2/' ~/.Xresources
    sed -i 's/screen.secondary:.*$/screen.secondary: DVI-I-1-1/' ~/.Xresources
    xrdb -merge ~/.Xresources
}

