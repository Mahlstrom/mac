alias ls='gls --color --time-style=long-iso'
alias ll='gls -l --color --time-style=long-iso'
alias gss='git status -s'

Color_Off="\[\033[0m\]"       # Text Reset
Yellow="\[\033[0;33m\]"       # Yellow
PathShort="\w"
function __git_ps1(){
	ISGIT=$(git branch &>/dev/null)
	if [ $? -eq 0 ]; then
		GITS=$(echo `git status`)
		GITIT=$(echo $GITS | grep "nothing to commit" | wc -l)
		GITMO=$(echo $GITS | grep "modified:  " |wc -l)
		if [ $GITIT -eq 1 ]; then
			echo '✅ '
		elif [ $GITMO -gt 0 ]; then
			echo '✨ '
		else
#			echo $GITS
			echo '❗ '
#			echo '❓ '
#			echo '✨ '
		fi
	else
			echo ' '	
	fi
			echo '✨ '
}

function __prompter(){
	ISGIT=$(git branch &>/dev/null)
	if [ $? -eq 0 ]; then
		GITS=$(git status -s| egrep '' |wc -l)
		GNEW=$(git status -s| egrep '^\?\? ' | wc -l)
		GMOD=$(git status -s| egrep '^.M ' | wc -l)
		if [ $GNEW -gt 0 ]; then
			echo '❓ '
		elif [ $GMOD -gt 0 ]; then
			echo '🚥 '
		elif [ $GITS -gt 0 ]; then
			echo '❗ '
		else
			echo '✅ '
		fi
	fi
}
# ✨ 
export PS1='$(__prompter)'$Yellow$PathShort$Color_Off' '
export PATH="/usr/local/sbin:$PATH"
