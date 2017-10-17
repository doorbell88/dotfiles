# This script creates symbolic links to all of the dotfiles in this repo.
# The symbolic links will be located in the $HOME (~) directory.
# 
# The original files will be backed up, by changing their name to
# $FILENAME-bak.
# 
# At the end, the script will remove these backup files for you, if you'd like.
#-------------------------------------------------------------------------------


#--------------------------------- VARIABLES -----------------------------------
# get location of dotfiles repo
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
THIS_SCRIPT_NAME="$(basename "$0")"
SETUP_VIM_AND_TMUX_SH="set_up_vim_and_tmux.sh" 

#--------------------------------- FUNCTIONS -----------------------------------
create_backup() {
    filename="$1"

    if [ -f "$HOME/$filename" ] || [ -d "$HOME/$filename" ]; then
        # create backup file
        mv -vi "$HOME/$filename" "$HOME/$filename-bak"
    fi
}

create_link() {
    filename="$1"

    # define symbolic link arguments
    TARGET="$DOTFILES_DIR/$filename"
    LINK_NAME="$HOME/$filename"

    # create symbolic link
    ln -sv $TARGET $LINK_NAME
}

remove_backups() {
    for filename in $files; do
        backup_file="${HOME}/${filename}-bak"
        if [ "$backup_file" != "$HOME" ]; then
            if [ -f "$backup_file" ] || [ -d "$backup_file" ]; then
                rm -i "$backup_file" 
            fi
        fi
    done
}


#------------------------------------ MAIN -------------------------------------
# cd to the dotfiles repo directory, so it only gets listings of files in repo
cd $DOTFILES_DIR

# get list of all files in dotfiles repo
files=$(for file in $(ls -a); do echo $file ; done \
            | tail -n +3 \
            | grep -v README \
            | grep -v git \
            | grep -v "$THIS_SCRIPT_NAME" \
            | grep -v "$SETUP_VIM_AND_TMUX_SH" \
       )


# create backups and symbolic links
for file in $files; do
    if [ -n "$file" ]; then
        # create backup file
        create_backup "$file"

        # create symbolic link
        create_link "$file"
    fi
done


# ask to remove backups
echo     "Would you like to remove the backup files?"
echo     "(will ask for each file to be removed)"
echo -ne "  (y/n) >  "

read response

if [ "$response" = "y" ]; then
    remove_backups
fi
