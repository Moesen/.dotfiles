setup:
# Symlinks

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

install:
	# Installing neovim
	sudo snap install neovim --classic
	
	#Installing plug 
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	# Installing I3-gaps (might need update to also install i3
	sudo add-apt-repository ppa:regolith-linux/release
	sudo apt update
	sudo apt install i3-gaps
