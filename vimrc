let mapleader = ','

set tabstop=3       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=3    " Indents will have a width of 4
set softtabstop=3   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set autoindent
set smarttab
set backspace=indent,eol,start "makes backspace work like it does in most programs
set relativenumber
set guifont=Consolas:h12
set hlsearch
set hidden

" Buffers
nnoremap <leader>b :Buffers<cr>

" Auto close brackets
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Misc custom
nnoremap <C-s> :update<cr>
set belloff=all

" File search
nnoremap <C-p> :call fzf#run(fzf#wrap({'source': 'find . -name "*.cpp" -or -name "*.h"'}))<cr>
nnoremap <C-f> :Rg 

" Moving between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l

" Term specific stuff
tnoremap <C-n> <C-w>N
tnoremap <C-e> <C-l>

" Tab 
nnoremap <Tab> :tabnext<cr>
nnoremap <S-Tab> :tabprev<cr>
nnoremap <leader>tn :tabedit<cr>

" Explorer
let g:netrw_banner = 0
function! NetrwMapping()
  nmap <buffer> H u
  nmap <buffer> h -^
  nmap <buffer> l <CR>

  nmap <buffer> . gh
  nmap <buffer> P <C-w>z

  nmap <buffer> L <CR>:Lexplore<CR>
  nmap <buffer> <Leader>dd :Lexplore<CR>
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

" Commenting blocks of code.
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

colorscheme desertink

"Debuffer stuff
packadd termdebug
let g:termdebugger = "aarch64-linux-gdb"
let g:termdebug_popup = 0
let g:termdebug_wide = 163

" Plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'toupeira/vim-desertink'
call plug#end()


