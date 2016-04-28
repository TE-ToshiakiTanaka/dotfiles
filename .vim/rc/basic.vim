"""""""""""""""""""""""""""""""
" Basic Settings
"""""""""""""""""""""""""""""""

set autoindent
set backupdir=$HOME/.vimbackup
set browsedir=buffer
set clipboard=unnamed
set nocompatible
set directory=$HOME/.vimbackup
set expandtab
set hidden
set incsearch
set list
set listchars=eol:$,tab:>\ ,extends:<
set number
set shiftwidth=4
set showmatch
set smartcase
set smartindent
set smarttab
set tabstop=4
set whichwrap=b,s,h,l,<,>,[,]
set nowrapscan


"""""""""""""""""""""""""""""""
"Local File Settings
"""""""""""""""""""""""""""""""
if filereadable($HOME . '.vimrc.local')
    source $HOME/.vimrc.local
endif
