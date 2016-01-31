syntax on
syntax enable
set background=light
colorscheme solarized
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set nu
set nocompatible
if has("autocmd")
 au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
   \| exe "normal g'\"" | endif
endif  
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*
set ai
set wildmenu
set wildmode=list:longest,full
set mouse=
set backspace=2
set number
set ignorecase
set smartcase
filetype plugin indent on
