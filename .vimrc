set tags=tags
syntax on
set redrawtime=10000
set re=0
set splitright
" set guicursor=
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
set noshowmatch
set noshowmode
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
" set termguicolors
set scrolloff=8
set modifiable

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Tmux italic
" highlight Comment cterm=italic

" Import plugins
if filereadable(expand("~/.vim/.vimrc.plug"))
 source ~/.vim/.vimrc.plug
endif

" set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

map <C-n> :NERDTreeToggle<CR>
map <C-S-p> :Files<CR>
map <C-p> :GFiles<CR>
map <C-h> :History<CR>
map <C-b> :Buffers<CR>
map <C-f> :Rg<CR>
map <C-t> :e <cfile><cr>
map <S-Tab> :bn<CR>
map <F5> :setlocal spell! spelllang=en_gb<CR>
vnoremap <leader>pp :Prettier<CR>
vnoremap <leader>p "_dP

let loaded_matchparen = 1
let mapleader = " "

" CoC
" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
nmap <leader>qf  <Plug>(coc-fix-current)
nnoremap <leader>cp :CocFzfList<CR>
nnoremap <leader>cpd :CocFzfList diagnostics<CR>
nnoremap <leader>cpa :CocFzfList actions<CR>
nnoremap <leader>cpo :CocFzfList outline<CR>
nnoremap <leader>cpy :CocFzfList yank<CR>

" allow to scroll in the preview
set mouse=a

" mappings
"nnoremap <leader><.><.> :<C-u>CocFzfList<CR>
"nnoremap <leader><.>a       :<C-u>CocFzfList diagnostics<CR>
"nnoremap <leader><.>b       :<C-u>CocFzfList diagnostics --current-buf<CR>
"nnoremap <leader><.>c       :<C-u>CocFzfList commands<CR>
"nnoremap <leader><.>e       :<C-u>CocFzfList extensions<CR>
"nnoremap <leader><.>l       :<C-u>CocFzfList location<CR>
"nnoremap <leader><.>o       :<C-u>CocFzfList outline<CR>
"nnoremap <leader><.>s       :<C-u>CocFzfList symbols<CR>
"nnoremap <leader><.>p       :<C-u>CocFzfListResume<CR>

" Sweet Sweet FuGITive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>gc :GCheckout<CR>

" Search and replace hotkey
nnoremap H :%s//gc<left><left><left>

" Move highlighted text up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Status bar config
set statusline+=%#warningmsg#

" Fix files automatically on save
let g:ale_fixers = {}
let g:ale_javascript_eslint_use_global = 1
let g:ale_linters = {
  \'javascript': ['eslint'],
  \'vue': ['eslint', 'stylelint', 'tsserver'],
\}

let g:ale_fixers = {
  \'javascript': ['prettier', 'eslint'],
  \'vue': ['eslint', 'stylelint'],
\}

" JS Syntax highlight
"let g:javascript_plugin_jsdoc = 1

let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '--'
let g:ale_fix_on_save = 1
" Close NERDTree when closing the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

let g:onedark_terminal_italics = 1
let g:onedark_terminal_italics=1
colorscheme onedark
