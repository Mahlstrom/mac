export PATH="~/bin:/usr/local/bin:/usr/local/sbin:$PATH"
[[ -d ~/Dropbox/.bashrc.d ]] && for i in ~/Dropbox/.bashrc.d/*sh; do source $i; done
for file in $(find ~/.dotfiles -name *_setup.sh) ; do
	source $file
done
for file in $(find ~/.dotfiles -name *_alias.sh) ; do
	source $file
done
for file in $(find ~/.dotfiles -name *_func.sh) ; do
	source $file
done
