read -p 'folder' folder
read -p 'main_file' m_file
read -p 'utils_file' u_file
read -p 'session_name' ses_name

tmux start-server
tmux new-session -d -s $ses_name -n vim

tmux selectp -t 1
tmux send-keys "$m_file; vim" C-m


