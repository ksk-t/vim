" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When this option is enabled, vi will use spaces instead of tabs
set tabstop     =3
set softtabstop =3
set shiftwidth  =3
set expandtab
set relativenumber
set backspace=indent,eol,start
set nu rnu
set ignorecase " Ingore case when searching
set hlsearch
 
nnoremap <F4>  :NERDTreeToggle<CR>
nnoremap <c-z> <nop>
noremap <C-S>          :update<CR>
vnoremap <C-S>         <C-C>:update<CR>
inoremap <C-S>         <C-O>:update<CR>
nnoremap <C-p>         :Files<CR>
 
" Remap plane focus
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
 
call plug#begin('~/.vim/plugged')
 
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'morhetz/gruvbox'
Plug 'psliwka/vim-smoothie'
Plug 'octol/vim-cpp-enhanced-highlight'
 
call plug#end()

if has('termguicolors')
    set termguicolors
endif

colorscheme gruvbox
 
