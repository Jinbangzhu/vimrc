" based on vundle https://github.com/gmarik/vundle

" **********************************
" common start
" **********************************
set nocompatible " not compatible with vi
filetype off " detect file type, turn off, needed by vundle
syntax on " high light keyword
filetype indent on " use different indent format in different file
filetype plugin on " enable plugin for different filetype
set history=2000 " record history row
set ruler " show current row and column number
set t_Co=256 " show vim in 256 color mode, this means vim will be colorful
set autoread " auto reload file content
set nobackup " no backup file
set noswapfile " no *.swp file
set number " show numberline
set cursorline " high light current line
"set selectmode=mouse,key
set title " use file name as terminal title
set novisualbell " dont beep
set noerrorbells " dont beep when occur error
set tabstop=4 " set width of 'tab'
set shiftwidth=4 " number of spaces to use for auto indent
set softtabstop=4 " delete 4 spaces in one click of backspace
set smarttab " insert tabs on the start of a line according to shiftwidth
set expandtab " convert tab to spaces, use <C v> + tab for real tab
set shiftround " Round indent to multiple of 'shiftwidth', Applies to > and < commands
set showcmd " Show (partial) command in the last line of the screen
set showmode " show current mode
set hidden " hidden buffer, avoid mutile terminal edit same file
set wildmode=list:longest " Completion mode that is used for the character specified with 'wildchar'.
set ttyfast " Indicates a fast terminal connection
set wildignore=*.swp,*.bak,*.pyc,*.class,*.db,*.sqlite3 " ingore such file
set scrolloff=5 " show min lines when scroll screen
set encoding=utf-8 " set default file encoding
set fileformats=unix " set file format, default use unix
set formatoptions+=B " merge two un-ASCII code lines without spaces
set completeopt=longest,menu " A comma separated list of options for Insert mode completion
set wildmenu " When 'wildmenu' is on, command-line completion operates in an enhanced mode
set magic " Changes the special characters that can be used in search patterns
set whichwrap+=<,>,h,l " Allow specified keys that move the cursor line
set backspace=eol,start,indent " Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode
set nowrapscan " dont search wrap file
"set paste " set paste, for paste text from flipboard
if $SHELL=~'bin/fish' " user system default shell, fix bug, we can use vim in different shell
    set shell=/bin/sh
endif
" ***********************************
" interface
" ***********************************
set nowrap " abort auto newline
set showmatch " show match bracket
set mat=2 " blink matching brackets, when 'mat' of tenth were match

" ************************************
" about search
" ************************************
set hlsearch " high light search text
set ignorecase " ignore case of searching text
set incsearch " searching when typing
set smartcase " sense case search, when one or more upper letter in pattern

" ************************************
" folder
" ************************************
set foldenable " enable fold function
set foldmethod=indent " use indent as fold format, conditions are: manual\indent\expr\syntax\diff\marker
set foldlevel=99 " max fold level

" ************************************
" indent
" ************************************
set smartindent " indent format
set autoindent " auto indent in new line
set cindent " use c like style indent

" ************************************
" auto reload vim when vimrc is changed
" ************************************
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost ~/.vimrc source ~/.vimrc
augroup END " }

" ************************************
" map 2 short key in diff mode
" ************************************
if &diff
    nnoremap - [czz
    nnoremap = ]c
endif

" ************************************
" extra function
" ************************************

" self hotkey
let mapleader = "'"
let g:mapleader = "'"

nnoremap ; :
nnoremap <F4> :set wrap! wrap?<CR>
noremap <C-j> :m+<CR>
noremap <C-k> :m-2<CR>
inoremap <C-j> <Esc>:m+<CR>
inoremap <C-k> <Esc>:m-2<CR>

" ************************************
" vim vundle
" ************************************

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" vundle, bundle manage tool
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'majutsushi/tagbar'
Bundle 'Raimondi/delimitMate'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/genutils'
Bundle 'vim-scripts/SelectBuf'
Bundle 'scrooloose/syntastic'
"Bundle 'bronson/vim-trailing-whitespace'
Bundle 'tpope/vim-surround'
Bundle 'mbbill/undotree'
Bundle 'godlygeek/tabular'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'myusuf3/numbers.vim'
Bundle 'Kris2k/mark.vim'
Bundle 'kevinw/pyflakes-vim'
Bundle 'bling/vim-airline'
Bundle 'jmcantrell/vim-virtualenv'

" sinpmat function & dependances
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'

" self modify lib
Bundle 'delongw/nginx.vim'
Bundle 'delongw/molokai'
"Bundle 'delongw/vim-statline'

" ************************************
" plugin
" ************************************

" NERDTree
map <F5> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '\.orig$']

" majutsushi/tagbar
map <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" scrooloose/syntastic
let g:syntastic_python_checkers=['python']
let g:syntastic_echo_current_error=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_check_on_wq=1
let g:syntastic_statusline_flag=1

" kien/ctrlp
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" vim-scripts/selectbuf
map <F3> <Plug>SelectBuf

" bronson/vim-trailing-whitespace
"map <leader>w :FixWhitespace<CR>

" mbbill/undotree
if has("persistent_undo")
    set undodir='/tmp/vim-undo/'
    set undofile
    nnoremap <leader>u :UndotreeToggle<CR>
endif

" myusuf3/numbers.vim
let g:enable_numbers=0
nnoremap <F2> :NumbersOnOff<CR>

" delongw/vim-statline
let g:statline_fugitive=1

" bling/vim-airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'"
let g:airline_theme='badwolf'

" delongw/molokai
colorscheme molokai
"let g:rehash256=1
"set background=dark

" ************************************
" self define function & setting
" ************************************

function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)
map <leader>w :FixWhitespace<CR>

if &diff
    set cursorcolumn
    hi CursorLine   ctermfg=16   ctermbg=255
    "hi DiffDelete      ctermfg=52  ctermbg=52
endif

filetype plugin indent on
