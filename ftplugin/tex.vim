setlocal spell
setlocal ai
"setlocal textwidth=78
"setlocal formatoptions+=cqrt
set linebreak
silent! call GenerateLatexMenu()

autocmd BufEnter,BufWinEnter <buffer> silent! call GenerateLatexMenu()

if has("macunx")
    map <silent> <localleader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline <c-r>=line('.')<cr> "<c-r>=LatexBox_GetOutputFile()<cr>" "%:p"<cr>
elseif has("unix")
    map <silent> <localleader>ls :silent !/usr/bin/python /home/jnwhiteh/.vim/evince_vim_dbus.py EVINCE "<c-r>=LatexBox_GetOutputFile()<cr>" <c-r>=line('.')<cr> "%:p"<cr>
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

setlocal wildignore+=*.aux,*.log,*.bbl,*.blg,*.pdf,*.fdb_latexmk,*.synctex.gz
