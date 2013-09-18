setlocal spell
setlocal ai
"setlocal textwidth=78
"setlocal formatoptions+=cqrt
set linebreak
silent! call GenerateLatexMenu()

autocmd BufEnter,BufWinEnter <buffer> silent! call GenerateLatexMenu()

if has("gui_macvim")
    map <silent> <localleader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline <c-r>=line('.')<cr> "<c-r>=LatexBox_GetOutputFile()<cr>" "%:p"<cr>
elseif has("unix")
    " This is the old method that used evince_vim_dbus.py
"    map <silent> <localleader>ls :silent !/usr/bin/python /home/jnwhiteh/.vim/evince_vim_dbus.py EVINCE "<c-r>=LatexBox_GetOutputFile()<cr>" <c-r>=line('.')<cr> "%:p"<cr>
    map <silent> <localleader>ls :call EVS_Sync()<CR>
endif

" Add more bindings from https://github.com/vim-scripts/AutomaticLaTexPlugin/blob/master/ftplugin/ATP_files/mappings.vim
imap ;em \emph{}<Left>
imap ;sf \textsf{}<Left>
imap ;tt \texttt{}<Left>
imap ;en \begin{enumerate}<cr><cr>\end{enumerate}<cr><Up><Up>    \item 
imap ;it \begin{itemize}<cr><cr>\end{itemize}<cr><Up><Up>    \item 
imap ;de \begin{description}<cr><cr>\end{description}<cr><Up><Up>    \item[] <Left><Left>
imap ;fi \begin{figure}<cr>\begin{center}<cr>\includegraphics{}<cr>\end{center}<cr>\caption{}<cr>\label{fig:}<cr>\end{figure}<cr>

imap ;qu ``''<Left><Left>

" Set up arrow keys (and end/home so they function in soft-line mode
noremap <buffer> <Up> g<Up>
noremap <buffer> <Down> g<Down>
noremap <buffer> <End> g<End>
noremap <buffer> <Home> g<Home>

inoremap <buffer> <silent> <Down> <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>C-O>gj"<CR>
inoremap <buffer> <silent> <Up> <C-R>=pumvisible() ? "\<lt>Up>" : "\<lt>C-O>gk"<CR>
inoremap <buffer> <silent> <Home> <C-R>=pumvisible() ? "\<lt>Home>" : "\<lt>C-O>g0"<CR>
inoremap <buffer> <silent> <End> <C-R>=pumvisible() ? "\<lt>End>" : "\<lt>C-O>g$"<CR>

" Ignore the dirty latex files
setlocal wildignore+=*.aux,*.log,*.bbl,*.blg,*.pdf,*.fls,*.fdb_latexmk,*.synctex.gz

function! WC()
    let filename = LatexBox_GetMainTexFile()
    let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
    let result = system(cmd)
    echo result . " words"
endfunction

map <buffer> <F3> :call WC()<CR>
" Reformat a paragraph into one-sentence-per-line form
" vip:'<,'>s/\n/ /|'<,'>s/\([.?!]\)\s/\1\r/g
