Installation:

	git clone git://github.com/jnwhiteh/dotvim.git ~/.vim
	ln -s $HOME/.vim/vimrc $HOME/.vimrc
	ln -s $HOME/.vim/gvimrc $HOME/.gvimrc
	cd $HOME/.vim
	git submodule init
	git submodule update
	cd bundle/command-t/ruby/command-t && ruby extconf.rb && make
	cd $HOME/.vim

Upgrade all bundled plugins:

	git submodule foreach git pull origin master


Credits:

	The general setup for my dotvim files comes from [1], making extensive
	use of pathogen [2].

[1]: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
[2]: http://www.vim.org/scripts/script.php?script_id=2332
