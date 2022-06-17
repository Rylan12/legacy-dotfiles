" -------
" General
" -------

set nocompatible " Not vi compatible
set hidden " Allow hidden buffers
set noerrorbells visualbell t_vb= " Disable audible bell because it's annoying.
set mouse+=a " Enable mouse support
set ttimeoutlen=10 " Remove delay when pressing <Esc>
set updatetime=100 " Update more quickly
set splitbelow " New window appears below
set splitright " New window appears to the right


" ----------
" Appearance
" ----------
set shortmess+=I " Disable the default Vim startup message.
set wildmenu " Show autocomplete for commands
set showcmd " Show commands for some actions
set laststatus=2 " Always show the status line
set number " Show line numbers.
set relativenumber " Show relative numbers
set noshowmode " Don't show current mode (shown in lightline plugin)
set ruler " Show mouse position on status line

colorscheme snazzy
let g:lightline = {'colorscheme': 'snazzy'} " Status bar theme
" Load status bar setup
let $STATUSFILE=expand("~/.vim/status-config.vim")
if filereadable($STATUSFILE)
    source $STATUSFILE
endif


" ------
" Editor
" ------

set wrap " Enable line wrapping
set linebreak " Won't linebreak in the middle of a word
set backspace=indent,eol,start " Allow backspace past insert point and over new line
set scrolloff=3 " Keep 5 lines under cursor at top and bottom of screen


" ----------------------
" Syntax and Indentation
" ----------------------

filetype plugin indent on " Detect file type and indent automatically
syntax on " Enable syntax highlighting
set showmatch " Show matching {[()]}
let g:is_posix = 1 " sh is a POSIX shell (fixes wrong syntax highlighting for $()
let g:python_highlight_all = 1

" Indentation
set tabstop=4 " Indent 4 spaces
set shiftwidth=4 " Shift 4 spaces
set expandtab " Convert tabs to spaces
set autoindent " New lines have same indentation
set smartindent " Determine indent level intelligently
set shiftround " Shifting rounds to multiple of 'shiftwidth'
set smarttab " TAB inserts 'tabstop' number of spaces

" Code Folding
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

" Common mistyped commands
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q


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


" ------------------
" File Type Settings
" ------------------

" Turn on spell check for markdown
autocmd FileType markdown,text setlocal spell


" -------
" Plugins
" -------

"  FZF
set rtp+=/opt/homebrew/opt/fzf
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" ArgWrap
nnoremap <silent> <leader>a :ArgWrap<CR>

" CtrlP
let g:ctrlp_show_hidden = 1 " Show hidden files

" Easymotion
let g:EasyMotion_smartcase = 1
map <Space> <Plug>(easymotion-prefix)
map <Space>l <Plug>(easymotion-bd-jk)
nmap <Space>L <Plug>(easymotion-overwin-line)

" GitGutter
highlight! link SignColumn LineNr

" Goyo
map <Leader>g :Goyo<Cr>

" Gundo
nnoremap <silent> <F5> :GundoToggle<CR>
if has('python3')
    let g:gundo_prefer_python3 = 1 " Anything else breaks on Ubuntu 16.04+
endif

" Limelight
nmap <Leader>l :Limelight!!<CR>
xmap <Leader>l <Plug>(Limelight)
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" NERD Commenter
let g:NERDSpaceDelims = 1 " Add a space after comment delimiters

" NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" SimpylFold
let g:SimpylFold_docstring_preview = 1

" SuperTab
let g:SuperTabDefaultCompletionType = 'context' " Complete files after / and methods after .
let g:SuperTabCrMapping = 1 " Enter ends the completion menu
let g:SuperTabClosePreviewOnPopupClose = 1 " Close the completion window that vim opens when done

" Syntastic
let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_error_symbol = 's'
let g:syntastic_style_warning_symbol = "s"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': ['sh', 'python', 'zsh'],
    \ 'passive_filetypes': []
\}
nnoremap <Leader>sc :SyntasticCheck<CR>
nnoremap <Leader>sr :SyntasticReset<CR>
nnoremap <Leader>si :SyntasticInfo<CR>
nnoremap <Leader>sm :SyntasticToggleMode<CR>


" --------------------
" Local customizations
" --------------------

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
