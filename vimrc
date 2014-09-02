" Vundle setup and initialisation (required)
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "msanders/snipmate.vim"
Bundle "timcharper/textile.vim"
Bundle "tpope/vim-haml"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-vividchalk"
Bundle "tsaleh/vim-supertab"
Bundle "jnwhiteh/vimerl"
Bundle "fatih/vim-go"
Bundle "vim-scripts/wombat256.vim"
Bundle "vim-scripts/IndexedSearch"
Bundle "vim-scripts/Gist.vim"
Bundle "bronson/vim-trailing-whitespace"
Bundle "vim-scripts/vibrantink"
Bundle "vim-scripts/The-NERD-tree"
Bundle "jnwhiteh/taglist.vim"
Bundle "xolox/vim-misc"
Bundle "xolox/vim-easytags"
Bundle "vim-scripts/tagexplorer.vim"
Bundle "tpope/vim-fugitive"
Bundle "vim-scripts/Gundo"
Bundle "vim-scripts/Solarized"
Bundle "jnwhiteh/latexmenu"
Bundle "vimoutliner/vimoutliner"
Bundle "mattn/webapi-vim"
Bundle "sickill/vim-monokai"
Bundle "fholgado/Molokai2"
Bundle "kien/ctrlp.vim"
Bundle "LaTeX-Box-Team/LaTeX-Box"
Bundle "tpope/vim-sensible"
Bundle "bling/vim-airline"
Bundle "scrooloose/syntastic"
Bundle "rodjek/vim-puppet"
Bundle "gregsexton/gitv"
Bundle "laktek/distraction-free-writing-vim"
Bundle "vim-scripts/SpellCheck"
Bundle "kien/rainbow_parentheses.vim"
Bundle "guns/vim-clojure-static"
Bundle "pangloss/vim-javascript"
Bundle "chikamichi/mediawiki.vim"

filetype plugin indent on
syntax on

set mousehide					    " Hide the mouse when typing text

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
let g:LatexBox_latexmk_async=1

au FileType text setlocal textwidth=78
au FileType markdown setlocal ai formatoptions+=cqrt comments=n:&gt;
au FileType lua setlocal nu si tabstop=4 ruler laststatus=2 showmode noexpandtab formatoptions-=t textwidth=78 formatoptions+=c
au FileType go setlocal nu si tabstop=4 ruler laststatus=2 showmode noexpandtab formatoptions-=t textwidth=78 formatoptions+=c
au FileType go setlocal makeprg=go\ install\ %:h
au FileType lua setlocal nu si tabstop=4 ruler laststatus=2 showmode noexpandtab formatoptions-=t textwidth=78 formatoptions+=c
au FileType erlang let g:erlangCompiler="erlc"
" Always start on the first line of a commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

set showmode
set number

" Change to the current file's directory
command -nargs=0 Cd cd %:p:h

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \   if &omnifunc == "" |
    \     setlocal omnifunc=syntaxcomplete#Complete |
    \   endif
endif

nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>

nnoremap <leader>l :TlistToggle<CR>
nnoremap <leader>e :TagExplorer<CR>
nnoremap <leader>u :GundoToggle<CR>

" Map control-backspace to delete previous word
imap <C-BS> <C-W>

" Custom status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Jump to last file position when reloading
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

set t_Co=256

" Set Control-A to select all in the file
noremap  <C-A>  gggH<C-O>G
inoremap <C-A>  <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A>  <C-C>gggH<C-O>G
onoremap <C-A>  <C-C>gggH<C-O>G
snoremap <C-A>  <C-C>gggH<C-O>G
xnoremap <C-A>  <C-C>ggVG

if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

colorscheme Molokai2

let g:fullscreen_colorscheme = "iawriter"
let g:fullscreen_font = "Cousine:h14"
let g:normal_colorscheme = "Molokai2"
let g:normal_font="Monaco:h13"
