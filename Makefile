setup:
	if [ ! -d ~/.dotfiles ]; then mv ~/dotfiles ~/.dotfiles; fi

symlinks: 

# Folders
## ZSH
	ln -sf ~/.dotfiles/zshrc/.zsh_plugins.txt ~/.zsh_plugins.txt
	ln -sf ~/.dotfiles/zshrc/.zshrc ~/.zshrc
	
## NVIM
	ln -sfn ~/.dotfiles/nvim ~/.config/nvim
	ln -sfn ~/.dotfiles/ranger ~/.config/ranger
	ln -sfn ~/.dotfiles/i3 ~/.config 
	ln -sfn ~/.dotfiles/polybar ~/.config/polybar 

# Adding profile f
	ln -sfn ~/.dotfiles/.profile ~/

# Adding alacrity settings
	ln -sfn ~/.dotfiles/alacritty ~/.config/

# Setup picom path
	ln -sf ~/.dotfiles/picom ~/.config

# Setup tmux config file path
	ln -sf ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Setup starship
	ln -sf ~/.dotfiles/starship/starship.toml ~/.config/

conda_show:
	conda config --set changeps1 true

conda_hide:
	conda config --set changeps1 false

install:
	# Installing neovim
	sudo snap install neovim --classic
	
	#Installing plug for vim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	# Installing I3-gaps (might need update to also install i3
	sudo add-apt-repository ppa:regolith-linux/release
	sudo apt update
	sudo apt install i3-gaps

	# Installing starship
	sudo snap install starship


install_typetest:
	sudo git clone https://github.com/bloznelis/typioca.git /opt/typioca
	sudo make -C /opt/typioca build

install_zscroll:
	git clone https://github.com/noctuid/zscroll /tmp/zscroll
	cd /tmp/zscroll
	sudo python3 setup.py install
	cd ~/.dotfiles

install_seamless_tv:
	curl -fsSL https://raw.github.com/mislav/dotfiles/1500cd2/bin/tmux-vim-select-pane -o /usr/local/bin/tmux-vim-select-pane
	chmod +x /usr/local/bin/tmux-vim-select-pane
