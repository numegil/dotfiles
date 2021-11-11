execute pathogen#infect()

" some smart options
set nocompatible
set backspace=indent,eol,start
set autoindent
set ruler showcmd
set nonumber
set hls ic is
set showmatch
set bg=dark
set ai
set textwidth=0

" " nice indentation
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set softtabstop=2

" Don't overwrite system clipboard on Windows
:set clipboard=

:filetype on

:set makeprg=make\ %<\ LDLIBS=\"-lm\"\ CFLAGS=\"-Wall\ -O2\ -static\"\ CPPFLAGS=\"-Wall\ -O2\ -static\"

syntax enable

if &ft == 'phpt'
  set ft=php
endif

function! CurlBracketComplete()
    if getline('.') =~ '\s*\<\(class\)\|\(struct\)\>.*'
    return "{\<Cr>};\<Esc>O"
    else
    return "{\<Cr>}\<Esc>O"
endfunction
inoremap {<Cr> <C-R>=CurlBracketComplete()<Cr>

function! TabComplete()
    if col('.') > 1 && strpart(getline('.'), col('.')-2, 3) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction
set completeopt=longest,menu
inoremap <Tab> <C-R>=TabComplete()<Cr>

" See http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
let mapleader = "\<Space>"
nnoremap <Leader>w :wa<CR>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>n :noh<CR>
nnoremap <Leader>p :set paste!<CR>
nnoremap <Leader>t :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

command! -nargs=1 Vs execute "vert stag" <q-args>

" Automatically remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Set color scheme
set t_Co=256
color xoria256

set cursorline
set lazyredraw
set smartcase
set ignorecase
set undofile
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

let @x ='f(li	q€kb'
let @c ='f,lli€kbq€kb'
let @v = 'f)i,€kb'

function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

" FB stuff

cmap hs HackSearch
:autocmd! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L
nnoremap <Leader>h :cclose<CR>

" Disable typechecking on save
let g:hack#enable = 0

" Auto-completion
let g:hack#omnifunc=1
autocmd BufNewFile,BufRead *.php setl omnifunc=hackcomplete#Complete

" TBGS
call SourceIfExists("~/.vim/biggrep.vim")
cmap tbgs TBGS
cmap tbgr TBGS
cmap tw TBGW

let @x ='f(li	q€kb'
let @c ='f,lli€kbq€kb'
let @v = 'f)i,€kb'

""""""""""""""""""""""""""""""""""""""""""
" hackfmt on range
""""""""""""""""""""""""""""""""""""""""""
function! HackFmt(width) range
  let start = a:firstline
  let end = a:lastline
  " current range contents, for comparison
  let curr = join(getline(start, end), "\n")."\n"
  " the replacement command (passes the full buffer as stdin)
  let cmd = "hackfmt --line-width=".a:width." --range ".line2byte(start)." ".line2byte(end+1)
  let output = system(cmd, join(getline(1, '$'), "\n"))

  " if they are the (case-sensitive) same, then don't touch the file
  if curr ==# output
    return
  endif

  " otherwise, delete what's there and put the new output
  execute start.",".end."d"
  execute start-1."put =output"
endfunction
command! -range -nargs=1 HackFmt <line1>,<line2>call HackFmt(<args>)

map <leader>k :HackFmt<Home>silent <End> 80<CR>
map <leader>K :%HackFmt<Home>silent <End> 80<CR>
