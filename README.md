## Installation

    git clone git://github.com/jnwhiteh/dotvim.git ~/.vim
    ln -s $HOME/.vim/vimrc $HOME/.vimrc
    ln -s $HOME/.vim/gvimrc $HOME/.gvimrc
    cd $HOME/.vim
    git submodule init
    git submodule update
    cd bundle/command-t/ruby/command-t && ruby extconf.rb && make
    cd $HOME/.vim

## Upgrade all bundled plugins

    git submodule init
    git submodule update
    git submodule foreach git pull origin master
    pushd bundle/command-t/ruby/command-t && ruby extconf.rb && make && popd


## Credits

    The general setup for my dotvim files comes from [1], making extensive
    use of pathogen [2].

    The evince_vim_dbus.py script included for Ubuntu has been altered from the
    gedit synctex plugin by viscious, obtained at [3].

[1]: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
[2]: http://www.vim.org/scripts/script.php?script_id=2332
[3]: http://jlebl.wordpress.com/2011/01/13/vim-evince-and-forward-and-backward-latex-synctex-search/
