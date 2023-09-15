syntax on

set noerrorbells
set tabstop=8 softtabstop=8
set shiftwidth=8
set smarttab
set noexpandtab
set autoindent smartindent
set number relativenumber
"set nowrap
set textwidth=78
set backspace=eol,start,indent
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=10
set colorcolumn=80
set noequalalways
set autochdir
set hlsearch

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'yegappan/taglist'
Plug 'preservim/tagbar'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'skywind3000/gutentags_plus'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'eugen0329/vim-esearch'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
call plug#end()

set t_Co=256
colorscheme gruvbox
"set transparent bg
autocmd vimenter
hi Normal guibg=NONE ctermbg=NONE
set background=dark

if executable('rg')
    let g:rg_device_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" leader key is set to space bar
let mapleader=" "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

let g:ctrlp_use_caching=0

let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_c_cpp_conf.py'
set rtp+=~/.vim/plugged/YouCompleteMe

" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['.root']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

" disable gutentag default mapping
let g:gutentags_plus_nomap = 1

"let g:GtagsCscope_Auto_Load = 0

"vim Airline theme settings
"let g:airline_theme='tomorrow'
let g:airline_theme='badwolf'

" Movement of cursur in vim terminals
" Left
nnoremap <leader>h :wincmd h<CR>
" Down
nnoremap <leader>j :wincmd j<CR>
" Up
nnoremap <leader>k :wincmd k<CR>
" Right
nnoremap <leader>l :wincmd l<CR>

" Code browsing
" Backward
nnoremap <leader>o :wincmd o<CR>
" Forward
nnoremap <leader>[ :wincmd i<CR>
" Jump to definition
nnoremap <leader>] :wincmd ]<CR>

" open terminal from vim . Use Ctrl+w+w to switch between vim and terminal
nnoremap <leader>t :botright vertical term<CR>

" show undo tree
nnoremap <leader>u :UndotreeShow<CR>

" show dir and files
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" ripgrep
nnoremap <leader>ps :Rg<SPACE>

" resize the vertical split window width
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <leader>v :vertical resize 90<CR>

" show functions, variables, macros in the current file
nnoremap <silent> <leader>d :TagbarToggle<CR> 

" Below are not woking with c/cpp
" nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
" nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>

" gutentag new mapping
" Find symbol (reference) under cursor
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
" Find symbol definition under cursor
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
" Functions calling this function
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
" Find text string under cursor
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
" Find egrep pattern under cursor
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
" Find file name under cursor
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
" Find files #including the file name under cursor
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
" Functions called by this function
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
" Find places where current symbol is assigned
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
" Find current word in ctags database
noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>

" Nerd Tree
"nnoremap <leader>n : NERDTreeFocus<CR>
"nnoremap <leader>nn :NERDTree<CR>
noremap <leader>n : NERDTreeToggle<CR>
"nnoremap <leader>nf : NERDTreeFind<CR>

" loading the plugin
let g:webdevicons_enable = 1

" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1

" adding the custom source to unite
let g:webdevicons_enable_unite = 1

" adding the column to vimfiler
let g:webdevicons_enable_vimfiler = 1

" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1

" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFolders0penClose = 1

" change the default folder/directory glyph/icon
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ""

" change the default dictionary mappings for file extension matches

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['c'] = 'c'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['h'] = 'h'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sh']= 'sh'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['py']= 'py'
"let g :WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['h'] ='ру'

if &diff
	“colorscheme github
	colorscheme molokai
endif

