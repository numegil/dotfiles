" some smart options
set nocompatible
set backspace=indent,eol,start
set autoindent
set ruler showcmd
set hls ic is
set showmatch
set bg=dark
set ai

" " nice indentation
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set softtabstop=2

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

set t_Co=256
color xoria256

source /home/engshare/admin/scripts/vim/biggrep.vim
