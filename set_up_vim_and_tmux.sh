# get location of dotfiles repo
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# update apt-get
sudo apt update

#------------------------------------ tmux -------------------------------------
# install tmux
if [ -z "$(which tmux)" ]; then
    sudo apt install tmux
fi

#------------------------------------ vim --------------------------------------
# install vim
if [ -z "$(which vim)" ]; then
    sudo apt install vim
fi

# install ctags
if [ ! -e /usr/local/bin/ctags ]; then
    sudo apt install exuberant-ctags
    sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
fi

# install Vundle (for managing vim plugins)
VUNDLE_GIT_REPO=https://github.com/VundleVim/Vundle.vim.git

# check if .vim/ exists in home directory
#   --> If it does exist, it might be a real file, not a symlink, so Vundle
#       will need to be installed there, not in the dotfiles/ directory
if [ -e "$HOME/.vim" ]; then
    VUNDLE_DIR=$HOME/.vim/bundle/Vundle.vim
else
    VUNDLE_DIR=$DOTFILES_DIR/.vim/bundle/Vundle.vim
fi

# clone Vundle
git clone $VUNDLE_GIT_REPO $VUNDLE_DIR 2>/dev/null

# install vim plugins automatically
vim -c PluginInstall -c :q -c :q
