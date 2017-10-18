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

# install Vundle (for vim)
VUNDLE_DIR=$DOTFILES_DIR/.vim/bundle/Vundle.vim
if [ -d $VUNDLE_DIR ] && [ -z "$(ls $VUNDLE_DIR)" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_DIR
fi

# install vim plugins automatically
vim -c PluginInstall -c :q -c :q
