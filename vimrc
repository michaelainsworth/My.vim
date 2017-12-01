" Vundle {{{ ==================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My plugins
Plugin 'git@github.com:michaelainsworth/MyGeneral.vim.git'
Plugin 'git@github.com:michaelainsworth/MyCpp.vim.git'
Plugin 'git@github.com:michaelainsworth/MyHtml.vim'
Plugin 'git@github.com:michaelainsworth/MyMarkdown.vim.git'
Plugin 'git@github.com:michaelainsworth/MyPhp.vim.git'
Plugin 'git@github.com:michaelainsworth/MySql.vim.git'
Plugin 'git@github.com:michaelainsworth/MyTodoTxt.vim.git'
Plugin 'git@github.com:michaelainsworth/MyVim.vim.git'
Plugin 'git@github.com:michaelainsworth/MyXml.vim.git'

" Third party plugins.
Plugin 'altercation/vim-colors-solarized'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'freitass/todo.txt-vim'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'jceb/vim-orgmode'
Plugin 'ledger/vim-ledger'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'mattn/calendar-vim'
Plugin 'othree/xml.vim'
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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ========================================================================= }}}

