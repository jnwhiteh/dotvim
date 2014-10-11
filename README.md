## Installation

    git clone git://github.com/jnwhiteh/dotvim.git ~/.vim
    ln -s $HOME/.vim/vimrc $HOME/.vimrc
    ln -s $HOME/.vim/gvimrc $HOME/.gvimrc
    cd $HOME/.vim
    git clone https://github.com/gmarik/Vundle.vim.git bundle/Vundle.vim

## Upgrade and install bundles

    :PluginInstall!

## Credits

The general setup for my dotvim files comes from [1]

The tex_evinceSync.vim plugin comes from [3], and works fantastically. In order for it to work, you will need to create a file named main.tex.latexmain so the plugin can determine which file is the 'main' LaTeX file.

[1]: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
[3]: https://github.com/peder2tm/sved
