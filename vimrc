" Pathogen bundle setup, see http://bit.ly/c42N4y for more details
call pathogen#infect()

filetype on                         " enables filetype detection
filetype plugin on                  " enables filetype specific plugins
filetype indent on                  " Thie enables automatic indentation
syntax on

set nocompatible				    " Break compatibility with old versions
set backspace=indent,eol,start		" Backspace over anything in insert mode
set history=50					    " keep 50 lines of command line history
set ruler					        " show the cursor position all the time
set showcmd					        " display incomplete commands
set incsearch					    " do incremental searching
set mousehide					    " Hide the mouse when typing text
set hlsearch					    " Turn on search pattern highlighting

set background=dark
"colorscheme vividchalk	    		" Select a colorscheme
colorscheme solarized


" Setup swapfile and backup file storage/rules
silent execute '!mkdir -p "' . $HOME . '/.vimswapfiles"'
silent execute '!mkdir -p "' . $HOME . '/.vimbackups"'
set nobackup
set directory=$HOME/.vimswapfiles/
set backupdir=$HOME/.vimbackups/

" Set up a custom leader, so we actually use it
let mapleader=","
let maplocalleader=";"

set smartindent                 		" Determine the correct tab level
set autoindent					" Turn on automatic indenting
set tabstop=4					" Set tab stops to be more manageable
set shiftwidth=4				" Set autoindent width to 4
set expandtab 					" Don't use tabs, use spaces instead
set smarttab					" Turn on smart tabbing
set switchbuf=usetab,newtab     " re-use a tab/window otherwise open a new taib

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>
" Set region to British English
set spelllang=en_gb

" Autocommand rules for a few common files
au BufNewFile,BufRead *.txt,*.html,README,*.tex setlocal spell
au BufNewFile,BufRead wscript set filetype=python

" Make sure .tex is interpreted as a 'latex' file
let g:tex_flavor="latex"

au FileType text setlocal textwidth=78
au FileType markdown setlocal ai formatoptions+=cqrt comments=n:&gt;
au FileType lua setlocal nu si tabstop=4 ruler laststatus=2 showmode noexpandtab formatoptions-=t textwidth=78 formatoptions+=c
au FileType go setlocal nu si tabstop=4 ruler laststatus=2 showmode noexpandtab formatoptions-=t textwidth=78 formatoptions+=c
au FileType lua setlocal nu si tabstop=4 ruler laststatus=2 showmode noexpandtab formatoptions-=t textwidth=78 formatoptions+=c
au FileType erlang let g:erlangCompiler="erlc"

" Add a shortcut for waf
command -nargs=* Waf !python waf <args>
command -nargs=* Make Waf <args>
command -nargs=0 Cd cd %:p:h

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \   if &omnifunc == "" |
    \     setlocal omnifunc=syntaxcomplete#Complete |
    \   endif
endif

nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Show_Menu=1
let Tlist_Compact_Format=1
let Tlist_Inc_Winwidth=0
nnoremap <leader>l :TlistToggle<CR>

let g:easytags_cmd='/usr/local/bin/ctags'
let TE_Ctags_Path='/usr/local/bin/ctags'
let TE_Adjust_Winwidth=0
nnoremap <leader>e :TagExplorer<CR>
nnoremap <leader>u :GundoToggle<CR>

" Custom status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
