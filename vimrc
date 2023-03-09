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

" Auto close brackets
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Misc custom
nnoremap <silent> <C-s> :update<cr>

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

" Explorer
let g:netrw_banner = 0

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

colorscheme darkblue
