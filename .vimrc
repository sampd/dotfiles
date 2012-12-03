syntax on
colorscheme murphy
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set nu
set nocompatible
" Uncomment the following to have Vim jump to the last position when
 " reopening a file
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
set mouse=a
set backspace=2
set number
set ignorecase
set smartcase
filetype plugin indent on
