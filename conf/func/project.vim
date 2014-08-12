" [Rebuild the project]
func! Rebuild()
  exec "silent make clean"
  call Build()
endfunc

" [Build the project]
function! Build()
  if filereadable("Makefile")
    exec "make -j4"
  elseif &filetype == 'java'
    exec "!javac %"
  endif
endfunction

" [Generate .pro and Makefile using qmake]
function! Qmake()
  exec "silent !qmake -project; qmake"
  call Build()
endfunction

function! Jmake()
  if !filereadable("Makefile")
    exec "!cp $HOME/.vim/local/conf/makefile_4_java Makefile"
  else
    echo "Makefile already exist"
  endif
endfunction

function! Fmake()
  if !filereadable("Makefile") || !filereadable("build.xml")
    exec "!cp /home/rice/.vim/local/conf/makefile_4_fpga Makefile"
    exec "!cp /home/rice/.vim/local/conf/build.xml build.xml"
  else
    echo "Makefile already exist"
  endif
endfunction

function! Cumake()
  if !filereadable("Makefile")
    exec "!cp $HOME/.vim/local/conf/makefile_4_cuda Makefile"
  else
    echo "Makefile already exist"
  endif
endfunction

let s:run_cmdline = "$SHELL ./.run.sh"
" [Run the project]
func! RunProject()
  if filereadable(".run.sh")
    exec "!" . s:run_cmdline
  endif
endfunc

function! Vargrind()
  if filereadable(".run.sh") && (&filetype == 'c' || &filetype == 'cpp')
    exec "!valgrind " . s:run_cmdline
  endif
endfunction
