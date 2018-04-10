function work(){
	NAME=$1
#	$DIRECTORY="~/workspace/$NAME"
	DIRECTORY=$HOME"/workspace/$NAME"
	VENV="$DIRECTORY/venv"
	if [ ! -d "$DIRECTORY" ]; then
		echo "No workdirectory named $NAME"
		exit 1
	fi

	echo "cding $DIRECTORY"
	cd "$DIRECTORY"
	if [ -d "$VENV" ]; then
		echo "Activating venv"
		deactivate 2>/dev/null
		source "$VENV/bin/activate"
	fi	
}

_work(){
	COMREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(gls $HOME/workspace/* -d1 | sed "s:$HOME/workspace/::g")
	COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )
    return 0
}

complete -F _work work
