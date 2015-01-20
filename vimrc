"                           Plugins Manager:
" ------------------------------------------------------------------
" All plugins are stored in ~/.vim/bundle using the pathongen plugin
"source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'junegunn/vim-easy-align'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'FuzzyFinder'
Plugin 'scrooloose/nerdcommenter'
Plugin 'DoxygenToolkit.vim'
Plugin 'jcf/vim-latex'
Plugin 'wannesm/wmgraphviz.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'BufOnly.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-unimpaired'
Plugin 'nacitar/terminalkeys.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"execute pathogen#infect()

" ------------------------End of Plugin Manager---------------------"
let g:conf_path_unix = '$HOME/.vim/conf/'
let g:conf_path_win32 = '$HOME/vimfiles/conf/'

function! SourceScript(files)
    for f in split(glob(a:files), '\n')
        exe 'source' f
    endfor
endfunction

if has ("win32")
    call SourceScript(g:conf_path_win32 . 'option.vim') " source functions secondly
    call SourceScript(g:conf_path_win32 . 'func/*.vim') " source functions secondly
    call SourceScript(g:conf_path_win32 . 'plugin/*.vim')
    call SourceScript(g:conf_path_win32 . 'autocmd.vim')
    call SourceScript(g:conf_path_win32 . 'mapping.vim')
    call SourceScript(g:conf_path_win32 . 'command.vim')
else
    let g:netrw_home = "/tmp"
    call SourceScript(g:conf_path_unix . 'option.vim')
    call SourceScript(g:conf_path_unix . 'func/*.vim') " source functions secondly
    call SourceScript(g:conf_path_unix . 'plugin/*.vim')
    call SourceScript(g:conf_path_unix . 'autocmd.vim')
    call SourceScript(g:conf_path_unix . 'mapping.vim')
    call SourceScript(g:conf_path_unix . 'command.vim')
endif
