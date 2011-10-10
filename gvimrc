if has("macunix")
    "Mac OS X specific options here
    " Grow to maximum horizontal width on full-screen mode
    set fuopt+=maxhorz
    macmenu &Edit.Find.Find\.\.\. key=<nop>
    map <D-f> :set invfu<CR>
    vmap <Backspace> d

    set gfn=Monaco:h13				    " Set a nice font (Mac OS X only?)

    set showtabline=2 " Always show tabs, even when only one file open
    set cmdheight=2   " Make command window larger so we can see compile errors
endif

au FileType tex call GenerateLatexMenu()
let g:LatexBox_viewer="skim"

" Add more bindings from https://github.com/vim-scripts/AutomaticLaTexPlugin/blob/master/ftplugin/ATP_files/mappings.vim
imap ;em \emph{}<Left>
imap ;tt \texttt{}<Left>
