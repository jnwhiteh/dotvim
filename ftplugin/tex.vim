setlocal spell
setlocal ai
"setlocal textwidth=78
"setlocal formatoptions+=cqrt
set linebreak
silent! call GenerateLatexMenu()

map <silent> <localleader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline <c-r>=line('.')<cr> "<c-r>=LatexBox_GetOutputFile()<cr>" "%:p"<cr>

" Add more bindings from https://github.com/vim-scripts/AutomaticLaTexPlugin/blob/master/ftplugin/ATP_files/mappings.vim
imap ;em \emph{}<Left>
imap ;tt \texttt{}<Left>

