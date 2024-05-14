" -------
" General
" -------

set hidden " Allow hidden buffers
set noerrorbells visualbell " Disable audible bell because it's annoying.
set mouse+=a " Enable mouse support in all modes
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
set noshowmode " Don't show current mode (shown in lightline plugin)
set ruler " Show mouse position on status line

if !has('nvim')
colorscheme snazzy
let g:lightline = {'colorscheme': 'snazzy'} " Status bar theme
" Load status bar setup
let $STATUSFILE=expand("~/.vim/status-config.vim")
if filereadable($STATUSFILE)
    source $STATUSFILE
endif
endif


" ------
" Editor
" ------

set wrap " Enable line wrapping
set linebreak " Won't linebreak in the middle of a word
set backspace=indent,eol,start " Allow backspace past insert point and over new line
set scrolloff=3 " Keep 3 lines around cursor at top and bottom of screen


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

if !has('nvim')

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
endif


" --------------------------
" Neovim-Specific Configuration
" --------------------------

if has('nvim')
    " Interface directly with the system keyboard
    set clipboard+=unnamedplus

    " Setup providers
    let g:python3_host_prog = "~/.pyenv/versions/neovim/bin/python"
    let g:ruby_host_prog = "~/.rbenv/versions/3.2.2/bin/neovim-ruby-host"
    let g:node_host_prog = "~/.nvm/versions/node/v16.16.0/bin/neovim-node-host"
    let g:perl_host_prog = "/opt/homebrew/bin/perl"
endif


" --------------------------
" Vim-Specific Configuration
" --------------------------

if !has('nvim')
    set nocompatible " Not vi compatible
    set t_vb= " Disable audible bell
endif


" --------------------
" Local customizations
" --------------------

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
