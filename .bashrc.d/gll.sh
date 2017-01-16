#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if ! type -t "__git_icon" > /dev/null; then
    source ~/.dotfiles/git/git_icon
fi

function gll(){
    local gi
    local dir
    dir="$1"
    # No directory has been provided, use current
    if [ -z "$dir" ];then
        dir="`pwd`"
    fi

    # Make sure directory ends with "/"
    if [[ $dir != */ ]];then
        dir="$dir/*"
    else
        dir="$dir*"
    fi

    # Loop all sub-directories
    for f in $dir;do
        # Only interested in directories
        [ -d "${f}" ] || continue
        gi=' '
        # Check if directory is a git repository
        if [ -d "$f/.git" ]; then
            cd $f
            gi=$(__git_icon)
            cd ../
        fi
        echo "$gi  ${f}"
    done
}