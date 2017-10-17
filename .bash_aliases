#------------------------------ DEFAULT COMMANDS -------------------------------
alias ls='ls -G'


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


#------------------------------ PROGRAM ALIASES --------------------------------
alias aquarium='python ~/Desktop/Programming/Python/aquarium.py'
alias weather='python ~/Desktop/Programming/RPi/weather_report.py'
alias c='~/bin/color'


#--------------------------- MISCELLANEOUS ALIASES -----------------------------
#set 256 color when starting tmux
#alias tmux='TERM=xterm-256color tmux'
