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

let g:LatexBox_viewer="skim"
" let g:LatexBox_latexmk_options="-pvc"
