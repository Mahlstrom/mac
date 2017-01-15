export PATH="~/bin:/usr/local/bin:/usr/local/sbin:$PATH"
[[ -d ~/.dotfiles/.bashrc.d ]] && for i in ~/.dotfiles/.bashrc.d/*.sh; do source $i; done
[[ -d ~/Dropbox/.bashrc.d ]] && for i in ~/Dropbox/.bashrc.d/*sh; do source $i; done
