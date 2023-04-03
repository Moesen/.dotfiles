#Personal Dotfiles
Repo for my personal dotfiles.
Currently works on ubuntu, and properbly other distros.

## **Setup**
- To place the different files in the correct locations for nvim, tmux, zsh, etc. run `make symlinks`
- For a quick and dirty way to install i3-gaps, nvim, plugged and starship run `make install`
- Other small commands exist for smaller scripts such as typioca and zscroll. Those are placed in the bottom for anyone curious.

## Do this to add snippets to coc
*obs. this is not in makefile, as coc and ultisnips must already be installed, otherwise .config/coc folder will not exist*
`ln -sfn ~/.dotfiles/ultisnips ~/.config/coc`

## Spotify theme - Spicetify
- [link to explainer website](https://www.omgubuntu.co.uk/2022/01/spicetify-change-spotify-app-theme)

Install using:
```
curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh
```

Giving permissions to fondle spotify install
```
sudo chmod a+wr /usr/share/spotify
sudo chmod a+wr /usr/share/spotify/Apps -R
```

## Programs I would forget
- [autorandr](https://github.com/phillipberndt/autorandr)

## Nice links
- `https://gist.github.com/todgru/6224848`
- `https://github.com/ph04/dotfiles/blob/main/.config/picom/picom.conf`
- `https://github.com/jonaburg/picom`

*test*

