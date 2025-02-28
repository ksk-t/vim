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
set number
set showcmd

" Buffers
nnoremap <leader>b :Buffers<cr>

" Auto close brackets
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Misc custom
nnoremap <C-s> :update<cr>
set belloff=all

" File search
nnoremap <C-p> :Files<cr>
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


"Debugger stuff
packadd termdebug
let g:termdebugger = "aarch64-linux-gdb"
let g:termdebug_popup = 0
let g:termdebug_wide = 163

"COC Config
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap /<leader>q :nnoremap <leader>m :T 

" Plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kassio/neoterm'
Plug 'morhetz/gruvbox'
call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (has("nvim"))
 "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
 let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
 set termguicolors
endif

set background=dark
let g:gruvbox_contrast_dark = 'hard'
autocmd vimenter * ++nested colorscheme gruvbox

