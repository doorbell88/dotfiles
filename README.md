# dotfiles

my various dotfiles -- for quick setup on new machines

install ctags

    sudo apt install exuberant-ctags
    ln -s /usr/bin/ctags /usr/local/bin/ctags

#-------------------------------------------------------------------------------
(If repo is cloned, this should not be necessary anymore)...

install vundle

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        --or--
    git clone https://github.com/VundleVim/Vundle.vim.git ~/dotfiles/.vim/bundle/Vundle.vim

(Then add vundle Plugin lines to .vimrc)

On first run of vim on new machine after adding these, run:

    :PluginInstall
