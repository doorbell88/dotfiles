#------------------------------ DEFAULT COMMANDS -------------------------------
# set ls to colorize output (checking for compatibility with Mac vs Linux)
ls --color=auto &> /dev/null && alias ls='ls --color=auto'


#----------------------------- FORMATTING ALIASES ------------------------------
alias space='echo -e "\n\n"'
alias bar='echo -e " ____________________________________________________________\n" '
alias bars='echo -e " ============================================================\n" '
alias wall='printf =%.0s $(seq 1 $COLUMNS); echo'


#--------------------------------- CD ALIASES ----------------------------------
PROGRAMMING_DIR="~/Desktop/Programming"
alias prog="cd $PROGRAMMING_DIR"
alias pyth="cd $PROGRAMMING_DIR/Python"
alias scrip="cd $PROGRAMMING_DIR/Scripting"
alias rpi="cd $PROGRAMMING_DIR/RPi"
alias desk="cd ~/Desktop"


#-------------------------------- GIT ALIASES ----------------------------------
alias st='git status'
alias br='git branch'
alias lg='git log --graph'
alias am='git commit --amend'
alias amne='git commit --amend --no-edit'

# git repos
alias pgc='cd ~/CardinalPeak/Bose/Professor/PGC_Automation'
alias pgcv='source ~/CardinalPeak/Bose/Professor/venv_pgc/bin/activate'


#------------------------------ PROGRAM ALIASES --------------------------------
alias aquarium='python ~/Desktop/Programming/Python/Aquarium/aquarium.py'
alias weather='python ~/Desktop/Programming/RPi/WeatherClock/terminal_printouts/weather_report.py'
alias c='~/bin/color'


#--------------------------- MISCELLANEOUS ALIASES -----------------------------
#set 256 color when starting tmux
#alias tmux='TERM=xterm-256color tmux'
alias cals='cal; cal -d $(( $(date +%Y) + $(date +%m)/12))-$(( ($(date +%m) %12) +1 ))'
