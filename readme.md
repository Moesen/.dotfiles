# Personal Dotfiles
Repo for my personal dotfiles. To setup clone the repo, and run the `setup.bat` to configure symlinks

## Do this to add snippets 
*obs. this is not in makefile, as coc and ultisnips must already be installed, otherwise .config/coc folder will not exist*
`ln -sfn ~/.dotfiles/ultisnips ~/.config/coc`

## Nice links
- `https://gist.github.com/todgru/6224848`
- `https://github.com/ph04/dotfiles/blob/main/.config/picom/picom.conf`
- `https://github.com/jonaburg/picom`

## Spotify theme - Spicetify
- [link to explainer website](https://www.omgubuntu.co.uk/2022/01/spicetify-change-spotify-app-theme)

Installing using:
```
curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh
```

Giving permissions to fondle spotify install
```
sudo chmod a+wr /usr/share/spotify
sudo chmod a+wr /usr/share/spotify/Apps -R
```
