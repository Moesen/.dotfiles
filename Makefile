symlinks: 
## Zsh
	ln -sf ~/.dotfiles/zshrc/.zsh_plugins.txt ~/.zsh_plugins.txt
	ln -sf ~/.dotfiles/zshrc/.zshrc ~/.zshrc	
## Nvim
	ln -sfn ~/.dotfiles/nvim ~/.config/nvim
## Others
	#ln -sfn ~/.dotfiles/ranger ~/.config/ranger
	ln -sfn ~/.dotfiles/i3 ~/.config/
	ln -sfn ~/.dotfiles/i3blocks/ ~/.config/
	#ln -sfn ~/.dotfiles/polybar ~/.config/polybar 
# Profile
	ln -sfn ~/.dotfiles/.profile ~/
# Xrecourses
	ln -sf ~/.dotfiles/xresources/.Xresources ~/
# Alacrity 
	ln -sfn ~/.dotfiles/alacritty ~/.config/
# Picom 
	#ln -sf ~/.dotfiles/picom ~/.config
# Tmux 
	ln -sf ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
# Starship
	ln -sf ~/.dotfiles/starship/starship.toml ~/.config/
# Dunst
	# ln -sf ~/.config/dunst/dunstrc

conda_show:
	conda config --set changeps1 true

conda_hide:
	conda config --set changeps1 false

install_typetest:
	sudo git clone https://github.com/bloznelis/typioca.git /opt/typioca
	sudo make -C /opt/typioca build

install_zscroll:
	git clone https://github.com/noctuid/zscroll /tmp/zscroll
	cd /tmp/zscroll
	sudo python3 setup.py install
	cd ~/.dotfiles

install_seamless_tmuxvim:
	curl -fsSL https://raw.github.com/mislav/dotfiles/1500cd2/bin/tmux-vim-select-pane -o /usr/local/bin/tmux-vim-select-pane
	chmod +x /usr/local/bin/tmux-vim-select-pane

install_spicetify:
	curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh
