if &compatible
  set nocompatible
endif

" dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.vim/dein')

" dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 起動時に読み込むプラグイン群
  call dein#add('Shougo/dein.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tomasr/molokai')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tomtom/tcomment_vim')
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" nerdtree
nmap <silent> <C-e>	 :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>	 :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks = 1
let g:nerdtree_tabs_open_on_console_startup=1
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$")) == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() | q | endif
" end nerdtree
" 初期設定ファイル
filetype plugin indent on

syntax on

set nowrap

set hlsearch
set ignorecase
set smartcase

set autoindent

set ruler
set number
set list
set showcmd
set wildmenu

set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4
set smarttab

set clipboard=unnamed
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [ []<Left>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap ' ''<Left>
inoremap " ""<Left>
" end 初期設定ファイル
" color scheme
colorscheme molokai
set background=dark
set t_Co=256
" end color scheme
" airline
set laststatus=2
" end airline
