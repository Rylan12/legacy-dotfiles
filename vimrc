" -------
" General
" -------

set nocompatible " Not vi compatible
set shortmess+=I " Disable the default Vim startup message.
set hidden " Allow hidden buffers
set noerrorbells visualbell t_vb= " Disable audible bell because it's annoying.
set mouse+=a " Enable mouse support
set wildmenu " Show autocomplete for commands
set ttimeoutlen=10 " Remove delay when pressing <Esc>
set showcmd " Show commands for some actions


" ------
" Editor
" ------

set number " Show line numbers.
set relativenumber " Show relative numbers

set splitbelow " New window appears below
set splitright " New window appears to the right

set laststatus=2 " Always show the status line
set noshowmode " Don't show current mode (shown in lightline plugin)
set ruler " Show mouse position on status line

set wrap " Enable line wrapping
set linebreak " Won't linebreak in the middle of a word

set backspace=indent,eol,start " Allow backspace past insert point and over new line
set scrolloff=5 " Keep 5 lines under cursor at top and bottom of screen


" ----------------------
" Syntax and Indentation
" ----------------------

let g:is_posix = 1 " sh is a POSIX shell (fixes wrong syntax highlighting for $()
filetype plugin indent on " Detect file type and indent automatically
syntax on " Enable syntax highlighting
set showmatch " Show matching {[()]}

" Indentation
set tabstop=4 " Indent 4 spaces
set shiftwidth=4 " Shift 4 spaces
set expandtab " Convert tabs to spaces
set autoindent " New lines have same indentation
set smartindent " Determine indent level intelligently
set shiftround " Shifting rounds to multiple of 'shiftwidth'
set smarttab " TAB inserts 'tabstop' number of spaces

" Code Folding
set foldmethod=indent " Fold based on indentation
set foldlevel=20 " Have most folds open on start
set nofoldenable


" ------
" Search
" ------
set ignorecase " Ignore case when searching
set smartcase " Infer case-sensitivity if capital letter in search query
set incsearch " Search while typing in query
set hlsearch " Highlight all instances found in search


" -----------
" Keybindings
" -----------

" Enable folding with the spacebar
nnoremap <space> za

" Don't enter Ex mode when pressing Q 
nmap Q <Nop>

" Make jj in insert mode escape to normal mode
imap jj <Esc>

nnoremap ; :

" Use <C-direction> to navigate between windows instead of <C-W>direction
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use <C-t>direction to navigate between tabs
nnoremap <C-t>j :tabr<CR>
nnoremap <C-t>k :tabl<CR>
nnoremap <C-t>l :tabn<CR>
nnoremap <C-t>h :tabp<CR>

" Don't let arrow keys move to force the use of hjkl (normal and insert mode)
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>


" -------
" vimdiff
" -------
if &diff
    map ] ]c
    map [ [c
    " TODO: Add colorscheme for vimdiff
endif


" ------------
" Git Settings
" ------------

" Restrict commit message bodies to 72 characters
autocmd FileType gitcommit set textwidth=72

" Color column marking end of text region if enabled (used for git commit messages)
autocmd FileType gitcommit set colorcolumn=+1

" Also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51

" Change color column color to black
autocmd FileType gitcommit highlight ColorColumn ctermbg=DarkGray


" -------
" Plugins
" -------

" NERDTree
map <C-n> :NERDTreeToggle<CR>
" Close vim if NERDTree is left open by itself
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CtrlP
" -----
let g:ctrlp_show_hidden = 1 " Show hidden files

" Gundo
" -----
nnoremap <F5> :GundoToggle<CR>
if has('python3')
    let g:gundo_prefer_python3 = 1 " Anything else breaks on Ubuntu 16.04+
endif

" Lightline
" Themes: https://github.com/itchyny/lightline.vim/blob/master/colorscheme.md
" let g:lightline = {
"       \ 'colorscheme': 'simpleblack',
"       \ }

" ArgWrap
nnoremap <silent> <leader>w :ArgWrap<CR>

" SuperTab
let g:SuperTabDefaultCompletionType = "context" " Complete files after / and methods after .
let g:SuperTabCrMapping = 1 " Enter ends the completion menu
let g:SuperTabClosePreviewOnPopupClose = 1 " Close the completion window that vim opens when done


" --------------------
" Local customizations
" --------------------

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
