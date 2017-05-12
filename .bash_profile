export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH=~/bin:$PATH
export PATH=/usr/local/bin:$PATH

source ~/.profile

####################################################################

# display today's date
today() {
    echo -e "\n   Today's date is:"
    echo -n "   "; date +"%A, %B %-d, %Y"
    echo
}

# cd to directory, then display ls
cs() {
    if [ -d $1 ]; then
        cd $1
        ls  
    elif [ "$1" = "-" ]; then
        cd -
        ls  
    else
        echo "$1 is not a directory"
    fi  
}

####################################################################
# Some formatting alias's...
alias space='echo -e "\n\n" '
alias bar='echo -e "   __________________________________________________________\n" '
alias bars='echo -e "   ==========================================================\n" '
alias wall='printf =%.0s $(seq 1 $COLUMNS); echo'

#####################

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon  
