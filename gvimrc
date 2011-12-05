if has("gui_gtk2")
    " This is gvim on Linux
    set gfn=Monospace\ 11
    imap <T-BS> <C-W> " Maps windows/super-backspace to delete previous word

elseif has("gui_mac")
    "Mac OS X specific options here
    " Grow to maximum horizontal width on full-screen mode
    set fuopt+=maxhorz
    macmenu &Edit.Find.Find\.\.\. key=<nop>
    map <D-f> :set invfu<CR>
    vmap <Backspace> d

    set gfn=Monaco:h13				    " Set a nice font (Mac OS X only?)

    let g:LatexBox_viewer="skim"
endif

set showtabline=2 " Always show tabs, even when only one file open
set cmdheight=2   " Make command window larger so we can see compile errors

set background=dark
"colorscheme vividchalk	    		" Select a colorscheme
colorscheme solarized


