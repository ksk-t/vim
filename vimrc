" tabstop:          Width of tab character
 19 " softtabstop:      Fine tunes the amount of white space to be added
 18 " shiftwidth        Determines the amount of whitespace to add in normal mode
 17 " expandtab:        When this option is enabled, vi will use spaces instead of tabs
 16 set tabstop     =3
 15 set softtabstop =3
 14 set shiftwidth  =3
 13 set expandtab
 12 set relativenumber
 11 set backspace=indent,eol,start
 10 set nu rnu
  9 set ignorecase " Ingore case when searching
  8 set hlsearch
  7 
  6 nnoremap <F4>  :NERDTreeToggle<CR>
  5 nnoremap <c-z> <nop>
  4 noremap <C-S>          :update<CR>
  3 vnoremap <C-S>         <C-C>:update<CR>
  2 inoremap <C-S>         <C-O>:update<CR>
  1 nnoremap <C-p>         :Files<CR>
21  
  1 " Remap plane focus
  2 map <C-j> <C-W>j
  3 map <C-k> <C-W>k
  4 map <C-h> <C-W>h
  5 map <C-l> <C-W>l
  6 
  7 call plug#begin('~/.vim/plugged')
  8 
  9 Plug 'junegunn/fzf'
 10 Plug 'junegunn/fzf.vim'
 11 Plug 'preservim/nerdtree'
 12 Plug 'joshdick/onedark.vim'
 13 Plug 'jesseleite/vim-agriculture'
 14 Plug 'morhetz/gruvbox'
 15 Plug 'psliwka/vim-smoothie'
 16 Plug 'octol/vim-cpp-enhanced-highlight'
 17 
 18 call plug#end()
 19 
 20 if has('termguicolors')
 21     set termguicolors
 22 endif
 23 
 24 colorscheme gruvbox
 25 
