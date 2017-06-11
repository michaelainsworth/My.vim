" {{{ Vundle
" =============================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Third party plugins.
Plugin 'https://github.com/altercation/vim-colors-solarized'
Plugin 'https://github.com/godlygeek/tabular'
Plugin 'https://github.com/honza/vim-snippets'
Plugin 'https://github.com/ledger/vim-ledger'
Plugin 'https://github.com/MarcWeber/vim-addon-mw-utils'
Plugin 'https://github.com/othree/xml.vim'
Plugin 'https://github.com/scrooloose/nerdcommenter'
Plugin 'https://github.com/SirVer/ultisnips'
Plugin 'https://github.com/tomtom/tlib_vim'
Plugin 'https://github.com/tpope/vim-fugitive'
Plugin 'https://github.com/tpope/vim-surround'
Plugin 'https://github.com/Valloric/YouCompleteMe'

" My plugins
Plugin 'https://github.com/michaelainsworth/MyCpp.vim'
Plugin 'https://github.com/michaelainsworth/MyMarkdown.vim'
Plugin 'https://github.com/michaelainsworth/MySql.vim'
Plugin 'https://github.com/michaelainsworth/MyVim.vim'
Plugin 'https://github.com/michaelainsworth/MyXml.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" {{{ Todos 
" =============================================================================
" TODO: Organise the following, e.g., it could be refactored.
" }}}

vnoremap <leader>s :!sort -u<cr>
vnoremap <leader>t :normal 80\|D<cr>


" {{{ Appearance
" =============================================================================
" TODO: Investigate syntax thoroughly.
syntax on

" Always display the status line, even when there's only
" one file open.
set laststatus=2

" Don't display the automatic positioning
" (use my status line format instead).
set noruler

" Ruler at 80 characters
set colorcolumn=80


" Custom status line
set statusline=#%n
set statusline+=\ %f
set statusline+=\ %r
set statusline+=\ %m
set statusline+=\ %y
set statusline+=\ [%l:%c
set statusline+=,\ %p%%]

let &statusline.= '%{exists("w:pghost")?"[pghost=".w:pghost."]":""}'

" Always display line numbers.
set number

" Tabbing
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" {{{ Mappings
" =============================================================================

" {{{ Functions
" -----------------------------------------------------------------------------
" Function indicating an error for replacing keys.
" modek ==# 'i' or 'v'
" If 'i', offset vim's default move-cursor-left-when-entering-normal-mode
" behvaiour.
" TODO: I can probably remove DisableKey, as I've now trained my fingers.
function! DisableKey(modek, newk, oldk)
    echohl ErrorMsg | echo 'Use ' . a:newk . ' instead of ' . a:oldk . '!' | echohl None
    if a:modek ==# 'i'
        normal! l
    endif
endfunction

" Like DisableKey but permanently disabled, not substituted.
function! DisableKeyPermanently(modek, oldk)
    echohl ErrorMsg | echo 'Do not use ' . a:oldk . '!' | echohl None
    if a:modek ==# 'i'
        normal! l
    endif
endfunction
" }}}

" {{{ Timings
" -----------------------------------------------------------------------------
" Set the timeout for characters and keys.
set timeout
set ttimeout
set timeoutlen=400
set ttimeoutlen=400
" }}}

" {{{ Arrows 
" -----------------------------------------------------------------------------
" Disable arrow keys in input mode.
inoremap <left>  <esc>:call DisableKey('i', 'h', 'the left arrow')<cr>
inoremap <right>  <esc>:call DisableKey('i', 'l', 'the right arrow')<cr>
inoremap <up>  <esc>:call DisableKey('i', 'k', 'the up arrow')<cr>
inoremap <down>  <esc>:call DisableKey('i', 'j', 'the down arrow')<cr>

" Disable arrow keys in normal mode.
nnoremap <left>  :call DisableKey('n', 'h', 'the left arrow')<cr>
nnoremap <right>  :call DisableKey('n', 'l', 'the right arrow')<cr>
nnoremap <up>  :call DisableKey('n', 'k', 'the up arrow')<cr>
nnoremap <down>  :call DisableKey('n', 'j', 'the down arrow')<cr>
" }}}

" {{{ Modes
" -----------------------------------------------------------------------------
" Input-to-normal mode
inoremap jj <esc>

" Navigate quick fix list and location list.
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>

" Disable ex mode.
nnoremap Q :call DisableKeyPermanently('n', 'Q')<cr>
" }}}

" {{{ Buffers
" -----------------------------------------------------------------------------
" TODO: These mappings may conflict others.
" List the current buffers
"nnoremap <c-k> :ls<cr>:buffer 

" Close the current buffer
"nnoremap <c-x> :bd<CR>

" Window movement
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Previous/next buffers
nnoremap <c-n> :bn<cr>
nnoremap <c-p> :bp<cr>
" }}}

" {{{ Saving and quitting
" -----------------------------------------------------------------------------
nnoremap <leader>wq :wq<cr>
inoremap <leader>wq <esc>:wq<cr>
nnoremap <leader>q :q<cr>
inoremap <leader>q <esc>:q<cr>
nnoremap <leader>w :w<cr>
inoremap <leader>q <esc>:q<cr>
nnoremap <leader>qq :q!<cr>
inoremap <leader>qq <esc>:q!<cr>
" }}}

" {{{ Miscelaneous
" -----------------------------------------------------------------------------
" Toggle relative numbers.
nnoremap <leader>r :set relativenumber!<cr>
" }}}
" }}}

" {{{ ASApp configuration 
" =============================================================================
" PHP error checking
function! PhpLint(filename)
    let l:command = "php -l '" . a:filename . "' 2>&1 > /dev/null | sed 's/^.*in \\(.*\\.php\\) on line \\([0-9]\\{1,\\}\\).*$/\\1:\\2:\\0/g'"
    let l:error_lines = system(l:command)
    echo l:error_lines
endfunction

    autocmd FileType php :setlocal expandtab
    autocmd FileType php :setlocal shiftwidth=4
    autocmd FileType php :setlocal tabstop=4

    " -------------------------------------------------------------------------
    " Operator motions
    " -------------------------------------------------------------------------

    autocmd FileType php :onoremap p i(

    " -------------------------------------------------------------------------
    " Abbreviations
    " -------------------------------------------------------------------------

    " todo => // TODO: 
    autocmd FileType php :iabbrev todo // TODO:

    " cln => comment line
    autocmd FileType php :iabbrev cln 
    \<cr>// ========================================================================
    \<cr>// TODO: Comment line here
    \<cr>// ========================================================================
    \<cr><esc>?TODO<cr>

    " ffn => function definition
    autocmd FileType php :iabbrev ffn 
    \<cr>function myfunction() {
    \<cr>// TODO: Implement this method
    \<cr>}

    " Disable keywords
    autocmd FileType php :iabbrev function USE_ABBREVIATION_INSTEAD!!!
    autocmd FileType php :iabbrev class USE_CLS_INSTEAD!!!
    autocmd FileType php :iabbrev public USE_UFN_INSTEAD!!!
    autocmd FileType php :iabbrev protected USE_OFN_INSTEAD!!!
    autocmd FileType php :iabbrev private USE_IFN_INSTEAD!!!

    autocmd FileType php :iabbrev ufn 
    \public function myfunction() {
    \<cr>// TODO: Implement this method
    \<cr>return null;
    \<cr>}
    \<esc>?myfunction<cr>:noh<cr>h

    autocmd FileType php :iabbrev ofn 
    \<cr>protected function myfunction() {
    \<cr>// TODO: Implement this method
    \<cr>return null;
    \<cr>}
    \<esc>?myfunction<cr>:noh<cr>h

    autocmd FileType php :iabbrev ifn 
    \<cr>private function myfunction() {
    \<cr>// TODO: Implement this method
    \<cr>return null;
    \<cr>}
    \<esc>?myfunction<cr>:noh<cr>h

    autocmd FileType php :iabbrev cls 
    \<esc>:set paste<cr>i
    \<cr>/**
    \<cr> * TODO: Document this class.
    \<cr> */
    \<cr>class myclass {
    \<cr>
    \<cr>    // ========================================================================
    \<cr>    // Constants
    \<cr>    // ========================================================================
    \<cr>    
    \<cr>    // TODO: Add errors.
    \<cr>    // TODO: Add other constants.
    \<cr>
    \<cr>    // ========================================================================
    \<cr>    // Lifecycle
    \<cr>    // ========================================================================
    \<cr>
    \<cr>    private function __construct() {
    \<cr>        // TODO: Implement this method.
    \<cr>    }
    \<cr>
    \<cr>    // ========================================================================
    \<cr>    // Factory
    \<cr>    // ========================================================================
    \<cr>
    \<cr>    static public function createExisting() {
    \<cr>        // TODO: Implement this method.
    \<cr>    }
    \<cr>
    \<cr>    static public function createNew() {
    \<cr>        // TODO: Implement this method.
    \<cr>    }
    \<cr>
    \<cr>    // ========================================================================
    \<cr>    // Accessors
    \<cr>    // ========================================================================
    \<cr>
    \<cr>    // TODO: Add accessors here.
    \<cr>
    \<cr>    // ========================================================================
    \<cr>    // Mutators
    \<cr>    // ========================================================================
    \<cr>
    \<cr>    // TODO: Add mutators here.
    \<cr>
    \<cr>    // ========================================================================
    \<cr>    // Variables
    \<cr>    // ========================================================================
    \<cr>
    \<cr>    // TODO: Add variables here.
    \<cr>
    \<cr>}
    \<cr>
    \<esc>:set nopaste<cr>
    \?myclass<cr>:noh<cr>h
augroup END
" }}}

" {{{ Filestem
" =============================================================================
set path=$PWD/**

" Find the file under the current W word.
function! FindFile()
    find <cWORD>
endfunction
nnoremap <Leader>/ :call FindFile()<CR>
command! FindFile :call FindFile()

" Delete all buffers but the current one
function! DeleteOtherBuffers()
    let l:buffer = expand('%')
    execute 'bufdo bd'
    execute 'e ' . l:buffer
endfunction
command! DeleteOtherBuffers :call DeleteOtherBuffers()
" }}}

" {{{ Git
" =============================================================================
" Run 'git commit' with the current buffer and exit.
function! GitCommit()
    w !git commit -F -
endfunction
command! GitCommit :call GitCommit()

" Read the current changes into the current buffer.
" I use this to obtain all the changes staged for
" commit so I can write comments on them.
function! GitDiffIndex()
    new
    r !git diff --staged
    setfiletype diff
    normal gg
endfunction
command! GitDiffIndex :call GitDiffIndex()

" When in visual mode, use F9 to execute SQL.
vnoremap <F9> :w !psql asapp<CR>
" }}}

" YouCompleteMe Configuration
" let g:ycm_key_list_select_completion = ['<c-j>', '<tab>']
" let g:ycm_key_list_previous_completion = ['<c-k>']

let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

nnoremap <leader>gt :YcmComplete GoTo<cr>
nnoremap <leader>gc :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>gf :YcmCompleter GoToDefinition<cr>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<cr>

nnoremap <leader>p :set paste!<cr>:set paste?<cr>
nnoremap <leader>pp :set paste<cr>"+p:set nopaste<cr>:echo "Pasted"<cr>

" Quick way to insert one character.
nnoremap ,i i_<esc>r
nnoremap ,a a_<esc>r

function! GitTodoFind()
    let l:old_register = @"
    normal 0v$hyy
    let l:search = @"
    let @" = l:old_register

    let l:command = 'grep -rHnF ' . shellescape(l:search) . ' .'
    new
    execute l:command
endfunction

function! GitTodo()
    new
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile

    normal ggO# Press enter to search for the todo item specified.

    read !git diff master | grep ^+ | grep -i todo | sed -e 's/^.//g' -e 's/^\s\+//g' -e 's/^[*\#\/]\+//g' -e 's/^ \?@\?TODO:\? //gI'

    nnoremap <buffer> <cr> :call GitTodoFind()<cr>
endfunction
command! GitTodo :call GitTodo()

function! GitSquash()
    if &filetype != 'gitrebase'
        return
    endif

    2,$s/^pick/squash/g
endfunction
command! GitSquash :call GitSquash()

function!   QuickFixOpenAll()
    if empty(getqflist())
        return
    endif
    let s:prev_val = ""
    for d in getqflist()
        let s:curr_val = bufname(d.bufnr)
        if (s:curr_val != s:prev_val)
            execute "edit " . s:curr_val
        endif
        let s:prev_val = s:curr_val
    endfor
endfunction
 
command! QuickFixOpenAll         call QuickFixOpenAll()

" This function clears all the writable registers.
function! ClearRegisters()
    let l:regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-*+/', '\zs')
    for l:r in l:regs
        let l:command = 'let @' . l:r . ' = ""'
        execute l:command
    endfor
endfunction
command! ClearRegisters :call ClearRegisters()

function! GrepOperator(type) range
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        echoerr 'Character visual mode or motion required.' 
        return
    endif

    let l:term = shellescape(@@)
    let l:command = 'grep! -rHnF ' . l:term . ' '
    let l:paths = split(&path, ',')

    for l:p in l:paths
        let l:p = substitute(l:p, '\*\*', '', 'g')
        let l:command .= shellescape(l:p) . ' '
    endfor

    silent execute l:command
    copen
endfunction

nnoremap <leader>f :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>f :<c-u>call GrepOperator(visualmode())<cr>

