# get location of dotfiles repo
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# update apt-get
sudo apt-get update

# install vim
if [ -n "$(which vim)" ]; then
    sudo apt install vim
fi

# install tmux
if [ -n "$(which tmux)" ]; then
    sudo apt install tmux
fi

# install ctags
sudo apt install exuberant-ctags
ln -s /usr/bin/ctags /usr/local/bin/ctags

# install Vundle (for vim)
git clone https://github.com/VundleVim/Vundle.vim.git $DOTFILES_DIR/.vim/bundle/Vundle.vim
