# This script creates symbolic links to all of the dotfiles in this repo.
# The symbolic links will be located in the $HOME (~) directory.
# 
# The original files will be backed up, by changing their name to
# $FILENAME-bak.
# 
# At the end, the script will remove these backup files for you, if you'd like.


#--------------------------------- VARIABLES -----------------------------------
# get location of dotfiles repo
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
THIS_SCRIPT_NAME="$(basename "$0")"
SETUP_VIM_AND_TMUX_SH="set_up_vim_and_tmux.sh" 

#--------------------------------- FUNCTIONS -----------------------------------
section_title() {
    title="$*"
    tput sgr0
    tput smul
    echo
    echo "$title"
    tput rmul
}

create_backup() {
    filename="$1"
    if [ -e "$HOME/$filename" ]; then
        # create backup file
        mv -vi "$HOME/$filename" "$HOME/$filename-bak"
    fi
}

create_symbolic_link() {
    filename="$1"

    # define symbolic link arguments
    TARGET="$DOTFILES_DIR/$filename"
    LINK_NAME="$HOME/$filename"

    # create symbolic link
    ln -sv $TARGET $LINK_NAME
}

create_copy() {
    filename="$1"

    # define cp arguments
    ORIGINAL="$DOTFILES_DIR/$filename"
    COPY="$HOME/$filename"

    # check if the file is a symbolic link
    if [ -L "$COPY" ]; then
        # read symbolic link
        SYMLINK="$(readlink -f $COPY)"
        # replace symbolic link with "hard" copy
        echo "copying ... $filename"
        echo "Removing existing symlink to $SYMLINK"
        cp -vr --remove-destination "$(readlink $COPY)" $COPY
    else
        # create copy
        cp -vr $ORIGINAL $COPY
    fi
}

link_files() {
    for file in $files; do
        if [ -n "$file" ]; then
            # create symbolic link
            create_symbolic_link "$file"
        fi
    done
}

copy_files() {
    for file in $files; do
        if [ -n "$file" ]; then
            # create local copy
            create_copy "$file"
        fi
    done
}

remove_backups() {
    for filename in $files; do
        backup_file="${HOME}/${filename}-bak"
        if [ -e "$backup_file" ]; then
            rm -v "$backup_file" 
        fi
    done
}

clean_up_backups() {
    for filename in $files; do
        backup_file="${HOME}/${filename}-bak"
        if [ -e "$backup_file" ]; then

            #rm -i "$backup_file" 

            # give option to Delete, Keep, or Restore backup file
            echo -ne "$backup_file  -->  Delete, Keep, or Restore?  (d/k/r) > "
            read resp

            case $resp in
                d | D )     echo -ne "  "
                            tput setaf 1
                            rm -v "$backup_file"
                            tput sgr0
                            ;;

                k | K )     echo -ne "  "
                            tput setaf 4
                            echo "($backup_file kept as backup)"
                            tput sgr0
                            ;;

                r | R )     echo -ne "  "
                            tput setaf 3
                            echo "Restoring backup file..."
                            echo -ne "  "
                            mv -v $backup_file ${HOME}/${filename}
                            tput sgr0
                            ;;

                * )         echo -ne "  --> "
                            tput bold
                            echo "Invalid response! ($backup_file kept as backup)"
                            tput sgr0
            esac
        fi
    done
}


#===============================================================================
#------------------------------------ MAIN -------------------------------------
# cd to the dotfiles repo directory, so it only gets listings of files in repo
cd $DOTFILES_DIR

# get list of all files in dotfiles repo
files=$(for file in $(ls -a); do echo $file ; done \
            | tail -n +3 \
            | grep -v "~" \
            | grep -v .swp \
            | grep -v .swo \
            | grep -v README \
            | grep -v git \
            | grep -v history \
            | grep -v "$THIS_SCRIPT_NAME" \
            | grep -v "$SETUP_VIM_AND_TMUX_SH" \
       )


#-------------------------------------------------------------------------------
# display files that will be backed up and linked
#---------------------------------------
section_title "files to be linked:"
#---------------------------------------
for file in $files; do
    echo "  $file"
done

echo
echo -ne "Would you like to continue? (y/n) >  "
read response
if [ "$response" != "y" ]; then
    echo "exiting."
    exit
fi


#-------------------------------------------------------------------------------
# create backups
#---------------------------------------
section_title "Creating backup files"
tput setaf 4
#---------------------------------------
for file in $files; do
    if [ -n "$file" ]; then
        # create backup file
        create_backup "$file"
    fi
done

echo
tput sgr0


#-------------------------------------------------------------------------------
# create local versions
#---------------------------------------
# ask whether to copy over or create symbolic link
echo -ne "Copy dotfiles over, or create symbolic link? (c/l)  > "
read response

if [ "$response" = c ]; then
    section_title "Creating local copies"
    tput setaf 5
    copy_files
elif [ "$response" = l ]; then
    section_title "Creating symbolic links"
    tput setaf 5
    link_files
else
    echo "Invalid response."
    echo "Exiting."
    exit 1
fi

tput sgr0


#-------------------------------------------------------------------------------
# ask to remove backups
#---------------------------------------
# sleep, and discard anything the user types during this period
while read -e -t 1; do : ; done

echo
tput setaf 1
echo "Would you like to remove the backup files (without confirmation)?"
echo -ne "  (y/n) > "
read response
tput sgr0


#---------------------------------------
if [ "$response" = "y" ]; then
    section_title "Creating symbolic links"
    tput setaf 1

    remove_backups

    tput sgr0
    echo
    echo "Finished."
    exit
else
    echo
    echo "Would you like to clean up the backup files?"
    echo "You will be prompted to delete, keep, or restore each backup file"
    echo -ne "  (y/n) > "

    read response
    if [ "$response" = "y" ]; then
        section_title "Cleaning up backup files"
        clean_up_backups
        echo "Finished."
    fi
fi
