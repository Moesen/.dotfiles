setup:
	# Symlinks

	## ZSH
	ln -sf ~/.dotfiles/zshrc/.zsh_plugins.txt ~/.zsh_plugins.txt
	ln -sf ~/.dotfiles/zshrc/.zshrc ~/.zshrc
	
	## NVIM
	ln -sfn ~/.dotfiles/nvim ~/.config/nvim
	ln -sfn ~/.dotfiles/ranger ~/.config/ranger
	ln -sfn ~/.dotfiles/i3 ~/.config/i3 
	ln -sfn ~/.dotfiles/polybar ~/.config/polybar 

install:
	# Installing neovim
	sudo snap install neovim --classic
	
	#Installing plug 
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
