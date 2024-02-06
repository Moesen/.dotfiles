crunchy_pf() {
    PG_CLUSTER_PRIMARY_POD=$(kubectl get pod -n postgresql-cluster -o name -l postgres-operator.crunchydata.com/cluster=postgresql-cluster,postgres-operator.crunchydata.com/role=master)
    PG_CLUSTER_USER_SECRET_NAME="postgresql-cluster-pguser-debug-container"
    PGPASSWORD=$(kubectl get secrets -n postgresql-cluster "${PG_CLUSTER_USER_SECRET_NAME}" -o go-template='{{.data.password | base64decode}}')
    PGUSER=$(kubectl get secrets -n postgresql-cluster "${PG_CLUSTER_USER_SECRET_NAME}" -o go-template='{{.data.user | base64decode}}')
    PGURI=$(kubectl get secrets -n postgresql-cluster "${PG_CLUSTER_USER_SECRET_NAME}" -o go-template='{{.data.uri | base64decode}}')
    PGDATABASE=$(kubectl get secrets -n postgresql-cluster "${PG_CLUSTER_USER_SECRET_NAME}" -o go-template='{{.data.dbname | base64decode}}')

    echo "User: ${PGUSER}"
    echo "Password: ${PGPASSWORD}"
    echo "Db: ${PGDATABASE}"
    echo "Uri: ${PGURI}"

    kubectl -n postgresql-cluster port-forward ${PG_CLUSTER_PRIMARY_POD} 5432:5432
}

# Open windows to alvenir-stuff
tab_alvenir() {
    local jira="https://danspeech.atlassian.net/jira/software/projects/APR/boards/14?assignee=712020%3A4c0fbb31-8e09-4638-8f9a-d3a24b9ef3c6"
    firefox --new-tab "$jira"
}

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

sc() {
    cur=$(pwd)
}
gb() {
    cd $cur
}

function make_deploy_all() {
    make -C ~/alvenir/ameya/infrastructure deploy-all
}

function make_destroy_all() {
    make -C ~/alvenir/ameya/infrastructure destroy-all
}

function podlog {
    readonly namespace=${1:?"Namespace must be specified"}
    readonly podname=${2:?"Podname must be specified"}
    kubectl logs -n $namespace $podname
}

function grep_podlog {
    readonly namespace=${1:?"Namespace must be specified"}
    readonly grepname=${2:?"Must specify grep filter see podlog if grep not required"}
    readonly podname=${3:?"Podname must be specified"}
    kubectl logs -n $namespace $podname | grep $grepname
}

function grep_all_pod_logs {
    readonly namespace=${1:?"Namespace must be specified"}
    readonly grepname=${2:?"Must specify grep filter see podlog if grep not required"}
    readonly podname=${3:?"Podname must be specified"}
    for pod in $(echo "$(kubectl get pods -n $namespace -o name | grep $podname)")
    do
        echo $pod
        echo "$(kubectl logs -n $namespace $pod | grep $grepname)"
    done
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
push_dot_changes() {
    if [ $# -ne 1 ]
    then
        echo "Usage $funcstac[1] <commit-message>"
        return
    fi

    git --git-dir=$HOME/.dotfiles/.git/ --work-tree=$HOME/.dotfiles add .
    git --git-dir=$HOME/.dotfiles/.git/ --work-tree=$HOME/.dotfiles commit -m $1
    git --git-dir=$HOME/.dotfiles/.git/ --work-tree=$HOME/.dotfiles push
}

fnd() {
    find . -wholename "$1"
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
