"                           Auto Commands:
" ----------------------------------------------------------------
" Set critical make for C and CPP file
"autocmd FileType c,cpp set makeprg='$HOME/.vim/local/bin/crazymake'

" Highlight the text if the length over 81
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,c,cpp,java highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,c,cpp,java match Excess /\%81v.*/
augroup END

autocmd BufRead *.html set textwidth=0
autocmd FileType * if &completefunc != '' | let &omnifunc=&completefunc | endif

" remove trailling white space
autocmd BufWinLeave * call RemoveTrailingWhitespace()

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" ------------------------ end of auto command --------------------------
