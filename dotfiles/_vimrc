""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom .vimrc file 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin related code
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""
" Matchit (builtin)
" Matching between arbitrary expressions
""""""""""""""""""""
" Enabling matchit plugin
packadd! matchit
" packadd! editexisting
" packadd! justify

""""""""""""""""""""
" NetRW (builtin)
" File explorer
""""""""""""""""""""
" Setting to look like Nerdtree
let g:netrw_special_syntax  =  1
let g:netrw_fastbrowse      =  2
let g:netrw_liststyle       =  0
let g:netrw_altv            =  1
let g:netrw_banner          =  0
let g:netrw_winsize         = 25
let g:netrw_browse_split    =  4

""""""""""
" Workaround for toggle problem with Lexplore
""""""""""
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
""""""""""

" TODO Check if third party plugins are available with variables (or try catch block)
""""""""""""""""""""
" VHDA's Verilog-SystemVerilog
" Extended functionality for verilog and systemverilog
" syn highlight, folding, matchit setting etc.
""""""""""""""""""""
" Setting syntax fold list to all folding
let g:verilog_syntax_fold_lst="function,task,interface,clocking,covergroup,sequence,block,instance"

""""""""""""""""""""
" Tagbar
" Listing source structure based on tags on the side
""""""""""""""""""""
" Move to the bar after opening it
let g:tagbar_autofocus = 1
" Mapping tagbar to F5
nnoremap <silent> <F5> :TagbarToggle<CR>
" Tagbar systemverilog extension
let g:tagbar_ctags_bin = '~/bin/ctags'
" let g:tagbar_type_verilog_systemverilog = {
"         \ 'ctagstype'   : 'SystemVerilog',
"         \ 'kinds'       : [
"             \ 'b:blocks:1:1',
"             \ 'c:constants:1:0',
"             \ 'e:events:1:0',
"             \ 'f:functions:1:1',
"             \ 'm:modules:0:1',
"             \ 'n:nets:1:0',
"             \ 'p:ports:1:0',
"             \ 'r:registers:1:0',
"             \ 't:tasks:1:1',
"             \ 'A:assertions:1:1',
"             \ 'C:classes:0:1',
"             \ 'V:covergroups:0:1',
"             \ 'I:interfaces:0:1',
"             \ 'M:modport:0:1',
"             \ 'K:packages:0:1',
"             \ 'P:programs:0:1',
"             \ 'R:properties:0:1',
"             \ 'T:typedefs:0:1'
"         \ ],
"         \ 'sro'         : '.',
"         \ 'kind2scope'  : {
"             \ 'm' : 'module',
"             \ 'b' : 'block',
"             \ 't' : 'task',
"             \ 'f' : 'function',
"             \ 'C' : 'class',
"             \ 'V' : 'covergroup',
"             \ 'I' : 'interface',
"             \ 'K' : 'package',
"             \ 'P' : 'program',
"             \ 'R' : 'property'
"         \ },
"     \ }

""""""""""""""""""""
" Vim-latex
" Latex plugin for vim
""""""""""""""""""""
" Set PDF as deafult target
let g:Tex_DefaultTargetFormat = 'pdf'
" Exeucute pdflatex without any arguments
let g:Tex_CompileRule_pdf = 'pdflatex'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""
" Just a bulk of useful options
""""""""""""""""""""
" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim
" Set all encodings to UTF-8
set encoding=utf-8
set fileencoding=utf-8
" Enable syntax highlight
syntax on
" Better command-line completion
set wildmenu
set wildmode=full
" Set command window height
set cmdheight=2
" Set line numbering (relative)
set number
set relativenumber
" Show partial commands in the last line
set showcmd
" Use visual bell instead of beeping
set visualbell
" Disable blinking of the visual bell (no beeping no blinking)
set visualbell t_vb=
" Set mouse to all modes
set mouse=a
" Display cursorr position
set ruler
" Setting colorscheme
"colorscheme basic-dark
" Enable plugins
filetype plugin on
" Setting statusline always on
set laststatus=2
" Status line format
set statusline=%F\ %h%m%r%w\ 
" Set no compatibility with old Vi
set nocompatible
" Inform vim which terminal application is used 
"set term=$TERM
" Highlight the line of the cursor
set cursorline
" Enable fold by syntax in all files
"set foldmethod=syntax
" Set auto change dir when opening new file
"set autochdir
" Set path to be able to search fuzzy down in the tree
set path+=**
" Set virtualedit for block selection (actual rectangle is used)
set virtualedit=block
" Set autoindent (keep indenting while new line isert)
set autoindent
" Set fast terminal connection
"set ttyfast
" Always create undo files
"set undofile
" Characters for whitespaces when 'set list' is called
set listchars=space:.,eol:$,tab:>-,trail:~,extends:>,precedes:<,nbsp:%
if $LANG == "en_US.UTF-8"
    set listchars=space:·,eol:¬,tab:»»,trail:·,extends:>,precedes:<,nbsp:%
endif
" Set fileformat to UNIX
set fileformat=unix
" Set highlight cursor position
set cursorline
set cursorcolumn
" Set timeout to low
set timeoutlen=150

""""""""""""""""""""
" Search options
""""""""""""""""""""
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
" Turn on highlight on search
set showmatch
set incsearch
set hlsearch
" Default global substitution
set gdefault

""""""""""""""""""""
" Indentation options
""""""""""""""""""""
" Use 4 spaces instead of tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set t_BE=

""""""""""""""""""""
" Options depending on filetype
""""""""""""""""""""
" Makefile
autocmd FileType make set noexpandtab
autocmd FileType make set shiftwidth=8
autocmd FileType make set softtabstop=0

" Verilog and SystemVerilog
" autocmd FileType verilog_systemverilog set tabstop=2
" autocmd FileType verilog_systemverilog set shiftwidth=2
" autocmd FileType verilog_systemverilog set softtabstop=2
" Set underscore as delimiter of words, so ciw will work well for variables
" autocmd FileType verilog_systemverilog set iskeyword-=_

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup leader key
let mapleader = ","

""""""""""""""""""""
" Normal mode mappings
""""""""""""""""""""
" Get to command mode with one keyhit
nnoremap ; :
" Arrow keys are not alloed
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
" When wrapping line found go inside the wrapping
nnoremap j gj
nnoremap k gk
" Create splits and go into them
nnoremap <leader>v <c-w>v<c-w>l
nnoremap <leader>s <c-w>s<c-w>j
" Closing splits
nnoremap <leader>c <c-w>c
" Focusing on act split only
nnoremap <leader>o <c-w>o
" Moving between splits
nnoremap <s-j> <c-w>j
nnoremap <s-k> <c-w>k
nnoremap <s-h> <c-w>h
nnoremap <s-l> <c-w>l
" Handling splits
nnoremap <leader>q :resize<CR>
nnoremap <leader>w :vertical resize<CR>
nnoremap <leader>e <c-w>=
nnoremap <leader>r <c-w>r
" Create tabs
nnoremap <silent> <c-o><c-o> :tabnew<CR>:call ToggleNetrw()<CR>
" Moving between tabs
nnoremap <silent> <c-h> :tabprevious<CR>
nnoremap <silent> <c-l> :tabnext<CR>
" Switching between buffers
nnoremap <leader>n :silent bn<Bar>echo<CR>
nnoremap <leader>p :silent bp<Bar>echo<CR>
" Using space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>
" Using leader f for file search
nnoremap <leader>g :vimgrep
" NetRW toggle
nnoremap <silent> <F2> :call ToggleNetrw()<CR>
" Toggle between wrap and nowrap
nnoremap <silent> <F3> :set wrap!<CR>
" Toggle between showing whitespaecs and not showing whitespaces
nnoremap <silent> <F4> :set list!<CR>

" Debug key (always holds something different)
" Executing a function call into a register and then pasting the result
nnoremap <F12> "=strftime("%Y %m %d")<cr>P

""""""""""""""""""""
" Insert mode mappings
""""""""""""""""""""
" Arrow keys are not alloed
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
" Extend brackets
inoremap ()  ()<Esc>i
inoremap {}  {}<Esc>i
inoremap []  []<Esc>i
inoremap (); ();
inoremap {}; {};
inoremap []; [];

" Extend quotes
inoremap ""  ""<Esc>i
inoremap ''  ''<Esc>i
inoremap "", "",
inoremap '', '',
inoremap ""; "";
inoremap ''; '';

""""""""""""""""""""
" Autosourcing vimrc when writing it
""""""""""""""""""""
augroup vimrc
  au!
  au BufWritePost .vimrc source %
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sourcing local vimrc if exists
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Glob expands all wildcard characters in the path
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Adds current buffer to git and returns
function! s:Gadd()
    silent execute ":! git add %:p"
    silent execute ":redraw!"
endfunction

" Adds current buffer to git and quits
function! s:Gaddq()
    call s:Gadd()
    :quitall
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands, abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Adds current buffer to git and returns
command Gadd :call s:Gadd()
cabbrev gadd Gadd
cabbrev ga Gadd

" Adds current buffer to git and quits
command Gaddq :call s:Gaddq()
cabbrev gaddq Gaddq
cabbrev gaq Gaddq
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimdiff configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &diff
    set cursorline
    hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
    hi DiffChange ctermbg=white  guibg=#ececec gui=none   cterm=none
    hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
endif

" Setting the font of the GUI
set guifont=Courier_New:h10:cANSI:qDRAFT
" Setting different colorscheme for the GUI
set background=dark
colorscheme slate
" Set no blinking for visualbell
set visualbell t_vb=
" On the tab print the: Nr of tab, name of file, modified status
set guitablabel=\[%N\]\ %t\ %M
