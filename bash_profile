#----------------------------- SOURCING DOTFILES -------------------------------
# check for ~/.bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
# check for ~/.bash_aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
# check for ~/.profile
if [ -f ~/.profile ]; then
    source ~/.profile
fi


#---------------------------- SHELL CUSTOMIZATION ------------------------------
export PS1='\u: \W \$ '
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon	


#----------------------------------- COLORS ------------------------------------
# Define some colors:
    BLACK=`tput setaf 0`
    RED=`tput setaf 1`
    GREEN=`tput setaf 2`
    YELLOW=`tput setaf 3`
    BLUE=`tput setaf 4`
    MAGENTA=`tput setaf 5`
    CYAN=`tput setaf 6`
    WHITE=`tput setaf 7`
    PURPLE=`tput setaf 125`
    BROWN=`tput setaf 130`
# Revert back to normal color/attribute settings
    NOCOLOR=`tput sgr0`
# Example
    # echo "Some text ${RED}in red color${NOCOLOR} no more color"


#--------------------------------- FUNCTIONS -----------------------------------
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
