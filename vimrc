" Vundle {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" }}}





set shiftwidth=4
set tabstop=4
set softtabstop=4
set number
set expandtab

inoremap jj <esc>

augroup cpp_filetype
    autocmd!

    function! CppIncludeGuard()
        let l:line = line('.') + 3
        let l:col = col('.')
        let l:filename = substitute(toupper(expand('%:t')), '[^A-Z0-9_]', '_', 'g')
        normal gg
        put! ='#ifndef ' . l:filename
        put ='#define ' . l:filename
        normal o
        normal G
        put ='#endif // ' . l:filename
        call cursor(l:line, l:col)
    endfunction

    " Options
    autocmd FileType cpp setlocal shiftwidth=4
    autocmd FileType cpp setlocal tabstop=4
    autocmd FileType cpp setlocal softtabstop=4
    autocmd FileType cpp setlocal number
    autocmd FileType cpp setlocal expandtab
    autocmd FileType cpp setlocal cindent

    " Normal-mode key bindings
    autocmd FileType cpp nnoremap <localleader>r :set relativenumber!<CR>
    autocmd FileType cpp nnoremap <localleader>c I// <esc> 
    autocmd FileType cpp nnoremap <localleader>g :call CppIncludeGuard()<cr>

    " Abbreviations
    " TODO: This isn't working!
    autocmd FileType cpp iabbrev <buffer> todo // TODO:
    autocmd FileType cpp iabbrev <buffer> iff if ()<cr>{<cr>}<esc>?(<cr>
    autocmd FileType cpp iabbrev <buffer> ife if ()<cr>{<cr>}<cr>else<cr>{<cr>}<esc>?(<cr>
    autocmd FileType cpp iabbrev <buffer> whilee while ()<cr>{<cr>}<esc>?(<cr>
    autocmd FileType cpp iabbrev <buffer> forr for (;;)<cr>{<cr>}<esc>?(<cr>
    autocmd FileType cpp iabbrev <buffer> fora for (auto& value : collection)<cr>{<cr>}<esc>?(<cr>
    autocmd FileType cpp iabbrev <buffer> mainn #include <iostream><cr>using std::cin;<cr>using std::cout;<cr>using std::cerr;<cr>using std::endl;<cr><cr>int main(int argc, const char**argv)<cr>{<cr>return EXIT_SUCCESS;<cr>}<esc>?return<cr>

    autocmd FileType cpp iabbrev <buffer> cls
        \ <esc>:set paste<cr>i
        \ class MyClass<cr>
        \ {<cr>
        \ public:<cr>
        \ <cr>
        \     // Lifecycle<cr>
        \     MyClass();<cr>
        \     // TODO: Make non-virtual if required!<cr>
        \     virtual ~MyClass() = 0;<cr>
        \     <cr>
        \     // Noncopyable<cr>
        \     MyClass(const MyClass& that) = delete;<cr>
        \     MyClass(MyClass&& that) = delete;<cr>
        \     MyClass& operator =(const MyClass& that) = delete;<cr>
        \     MyClass& operator =(MyClass&& that) = delete;<cr>
        \ <cr>
        \     // Accessors<cr>
        \     // TODO: Add accessors here!<cr>
        \ <cr>
        \     // Mutators<cr>
        \     // TODO: Add mutators here!<cr>
        \ <cr>
        \ private:<cr>
        \ <cr>
        \     // Helpers<cr>
        \     // TODO: Add helpers here!<cr>
        \ <cr>
        \     // Variables<cr>
        \     // TODO: Add variables here!<cr>
        \ <cr>
        \ };<cr>
        \ <esc>:set nopaste<cr>
        \ ?^ class<cr>k<esc>

augroup END


function! GitCommit()
    execute 'w !git commit -F -' | q!
endfunction
command! GitCommit call GitCommit()



