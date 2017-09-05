" There are key sequences beginning with <esc>[
:nnoremap <silent><esc> :noh<CR>
:nnoremap <esc>^[ <esc>^[

"""" Plugins """"
execute pathogen#infect('bundle/{}', $CONFIG_PATH . '/.vim/bundle/{}')
Helptags

"""" EDITING """"
" Filetype detection
filetype plugin on
filetype indent on

" Fix backspace in input
set backspace=indent,eol,start

" Tabs
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
" Unless you're editing a makefile...
autocmd FileType make setlocal noexpandtab

" Indents
set autoindent
set breakindent
set breakindentopt=shift:8

" Line numbers
set number
set ruler
set cursorline
set rnu

" Show matching bracket while typing
set showmatch

" Detecting no number formats apart from decimal for C-a and C-x
set nrformats=

" Deleting without putting it in the register
nnoremap <leader>d "_d
nnoremap <leader>D "_D

" Yanking to the end of the line
nnoremap Y y$

" Pasting in insert mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction


"""" NON-EDITING """"
" Mouse interaction enabled in all modes
set mouse=a

" Disable Ex mode
nnoremap Q <nop>

" Folds
set nofoldenable
set foldmethod=indent

" Searching
set incsearch
"set hlsearch
"nnoremap <esc> :noh<return><esc>

" Menu
set wildmenu

" Show command as it is being typed
set showcmd

" Don't redraw until something has been fully typed
set lazyredraw

" Moving around with wrapped lines
" nnoremap j gj
" nnoremap k gk

" Number of lines to leave on each side when scrolling
set scrolloff=5

" Show as much of last line as possible
set display=lastline

" Coloring
syntax on
set background=dark
colorscheme gruvbox

" Reset syntax highlighting when it goes wrong
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" Moving between Vim splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
