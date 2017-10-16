# get location of dotfiles repo
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
THIS_SCRIPT_NAME="$(basename "$0")"


create_backup() {
    filename="$1"

    # create backup file
    mv -v "$HOME/$filename" "$HOME/$filename-bak"
}


create_link() {
    filename="$1"

    # create symbolic link
    TARGET="$DOTFILES_DIR/$filename"
    LINK_NAME="$HOME/$filename"
    ln -s $TARGET $LINK_NAME
}


remove_backups() {
    for filename in $files; do
    if [ -n "$filename" ]; then
        rm -i "${HOME}/${filename}-bak"
    fi
    done
}


#-------------------------------------------------------------------------------
files=$(for file in $(ls -a); do echo $file ; done \
            | tail -n +3 \
            | grep -v README \
            | grep -v git \
            | grep -v "$THIS_SCRIPT_NAME" \
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
echo -ne "  (Y/n) >  "

read response

if [ "$response" = "y" ]; then
    remove_backups
fi
