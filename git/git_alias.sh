

# GIT / GIT FLOW ALIASES
# https://gist.github.com/kujiy/c6afe3a8577e37af6566e1699bfc6f51

# alias gs="git status"   # Unfortunately Ghost Script used `gs` already.
alias gss="git status -s"
alias gd="git diff"
alias gb="git branch"
alias gbr="git branch -r"

alias gst="git stash"
alias gsta="git stash apply"
alias gstl="git stash list"
alias gstc="git stash clear"

alias gft="git fetch --tags"
alias gfp="git fetch --prune"
alias gpt="git push --tags"
alias gpu="git push"

alias gp="git pull"


alias gaa="git add -A"
alias gau="git add -u"
ga() { git add $@; }

gc() { git commit -m "$@"; }



alias gcm="git checkout master"
alias gmm="git merge master"
alias gcd="git checkout develop"
alias gmd="git merge develop"

gcf()  { git checkout feature/$1; }
gffs() { git flow feature start $1; }
gfff() { git flow feature finish -F $(git_flow_current_branch); }

# Pick up the first "one" feature
gcfo() { git checkout $(git branch | grep feature | tail -1); }
gffo() { git flow feature finish -F $(git branch | grep feature | tail -1 | sed s/feature\\/// | sed s/*//); }



gch()  { git checkout hotfix/$1; }
gfhs() { git flow hotfix start $1; }
gfhf() { git fetch --tags; git pull origin master; git flow hotfix finish -F $(git_flow_current_branch); }

gcr()  { git checkout release/$1;  }
gfrs() { git flow release start $1; }
gfrf() { git flow release finish -F $(git_flow_current_branch); }

git_flow_current_branch(){ git rev-parse --abbrev-ref HEAD | cut -d'/' -f 2; }

glt() {
    LAST_TAG=$(git for-each-ref --format="%(refname:short)" --sort=taggerdate refs/tags | tail -1 | git for-each-ref --format="%(refname:short)" --sort=taggerdate refs/tags | tail -1);
    echo $LAST_TAG | xargs echo -n | pbcopy;
    echo "LAST TAG: "$LAST_TAG;
}

gut (){
    git tag -d $1;
    git push origin :refs/tags/$1;
}
gbd (){
    git branch -D $1;
}
gpo (){
    git push origin $1;
}
gpod (){
    git push origin :$1;
}

# GIT / GIT FLOW ALIASES <-
