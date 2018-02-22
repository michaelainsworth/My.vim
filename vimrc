" Vundle {{{ ==================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My plugins
Plugin 'michaelainsworth/MyGeneral.vim'
Plugin 'michaelainsworth/MyC.vim'
Plugin 'michaelainsworth/MyCpp.vim'
Plugin 'michaelainsworth/MyHtml.vim'
Plugin 'michaelainsworth/MyMarkdown.vim'
Plugin 'michaelainsworth/MyPhp.vim'
Plugin 'michaelainsworth/MySql.vim'
Plugin 'michaelainsworth/MyTodoTxt.vim'
Plugin 'michaelainsworth/MyVim.vim'
Plugin 'michaelainsworth/MyXml.vim'
 
" Third party plugins.
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'altercation/vim-colors-solarized'
Plugin 'itchyny/lightline.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'freitass/todo.txt-vim'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'jceb/vim-orgmode'
Plugin 'ledger/vim-ledger'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'mattn/calendar-vim'
Plugin 'othree/xml.vim'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/DrawIt'
Plugin 'vim-scripts/todo-txt.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'mattn/emmet-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ========================================================================= }}}


