".vimrc settings.
"
"""""""""""""""""""""""""""""""
" NeoBundle Settings
"""""""""""""""""""""""""""""""
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
endif

" originalrepos on github
" NeoBundle 'https://github.com/Shougo/neobundle.vim'
NeoBundle 'https://github.com/Shougo/vimproc.git', {
    \ 'build' : {
    \       'windows' : 'make -f make_mingw64.mak',
    \       'cygwin' : 'make -f make_cygwin.mak',
    \       'mac' : 'make -f make_mac.mak',
    \       'unix' : 'make -f make_unix.mak',
    \ }}
NeoBundle 'https://github.com/Shougo/vimfiler.git'
NeoBundle 'https://github.com/Shougo/vimshell.git'
NeoBundle 'https://github.com/Shougo/unite.vim'
NeoBundle 'https://github.com/Shougo/neocomplcache'
NeoBundle 'https://github.com/thinca/vim-quickrun.git'
NeoBundle 'https://github.com/Shougo/neosnippet'
NeoBundle 'https://github.com/jpalardy/vim-slime'
NeoBundle 'https://github.com/scrooloose/syntastic'
NeoBundle 'https://github.com/vim-scripts/sudo.vim.git'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

NeoBundle 'https://github.com/tpope/vim-fugitive'

" tagbar.vim
"NeoBundle 'https://github.com/majutsushi/tagbar'
" NERDTree
"NeoBundle 'https://github.com/scrooloose/nerdtree.git'

"CoffeeScript
NeoBundle 'https://github.com/kchmck/vim-coffee-script.git'

"JavaScript
NeoBundle 'https://github.com/pangloss/vim-javascript.git'

"Markdown"
NeoBundle 'https://github.com/tpope/vim-markdown'
NeoBundle 'https://github.com/jtratner/vim-flavored-markdown.git'
"NeoBundle 'https://github.com/hallison/vim-markdown.git'

"Python
"NeoBundle 'https://github.com/jmcantrell/vim-virtualenv'
NeoBundle 'https://github.com/davidhalter/jedi-vim'
" cd ~/.vim/bundle/jedi-vim
" git submodule update --init
NeoBundle 'https://github.com/Yggdroot/indentLine'

filetype plugin indent on     " required!
filetype indent on
syntax on

call neobundle#end()
