
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vim/vimrc


" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set tags=tags
syntax on
set redrawtime=10000
set encoding=UTF-8
set re=0
set splitright
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

highlight ColorColumn ctermbg=0 guibg=lightgrey

" allow to scroll in the preview
set mouse=a

let loaded_matchparen = 1
let mapleader = " "
let g:coc_global_config="$HOME/.config/coc/coc-settings.json"
" Tmux italic
" highlight Comment cterm=italic
call plug#begin('~/.vim/plugged')
" Plebvim lsp Plugins
"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
"Plug 'tjdevries/nlua.nvim'
"Plug 'tjdevries/lsp_extensions.nvim'
"Plug 'vim-utils/vim-man'
"Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
"Plug 'neovim/nvim-lsp'
"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
"Plug 'nvim-lua/diagnostic-nvim'


Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-vetur'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'antoinemadec/coc-fzf'

Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'theprimeagen/vim-be-good'
Plug 'paretje/nvim-man'
" git blame
Plug 'APZelos/blamer.nvim'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'colepeters/spacemacs-theme.vim'

" Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

" theme
Plug 'sainnhe/sonokai'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'

"prettier
Plug 'sbdchd/neoformat'

"Plug 'pangloss/vim-javascript'
Plug 'wakatime/vim-wakatime'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" show marks
Plug 'kshenoy/vim-signature'

" comments
Plug 'preservim/nerdcommenter'

" workspace
Plug 'thaerkh/vim-workspace'

Plug 'neoclide/coc-snippets'
"Plug 'honza/vim-snippets'

" Typescript syntax hightlighter
"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'leafgarland/typescript-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
 \ 'do': 'yarn install',
 \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

"debugger
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

call plug#end()


" Close NERDTree when closing the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeWinSize=50
"map <C-n> :NERDTreeToggle<CR>
map <C-t> :e <cfile><cr>
vnoremap <leader>.p :Prettier<CR>


" Search and replace hotkey
nnoremap H :%s//gc<left><left><left>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <C-h> ""y:%s/<C-R>=escape(@", '/\')<CR>//g<Left><Left>

" Sweet Sweet FuGITive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>gc :GCheckout<CR>


" keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-k> <esc>:m .-2<CR>==a
inoremap <C-j> <esc>:m .+1<CR>==a
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" copy till end of the line
nnoremap Y y$

" Important!!
if has('termguicolors')
  set termguicolors
endif
" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

" lsp
"set completeopt=menuone,noinsert,noselect
"let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
"let g:webdevicons_enable_airline_tabline = 1
"let g:webdevicons_enable_airline_statusline = 1

"let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
"let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.spec.[tj]s$'] = 'ﭧ'

"fun! LspLocationList()
    "" lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
"endfun

"nnoremap <leader>.d :lua vim.lsp.buf.definition()<CR>
"nnoremap <leader>.i :lua vim.lsp.buf.implementation()<CR>
"nnoremap <leader>.sh :lua vim.lsp.buf.signature_help()<CR>
"nnoremap <leader>.rr :lua vim.lsp.buf.references()<CR>
"nnoremap <leader>.rn :lua vim.lsp.buf.rename()<CR>
"nnoremap <leader>.h :lua vim.lsp.buf.hover()<CR>
"nnoremap <leader>.a :lua vim.lsp.buf.code_action()<CR>
"nnoremap <leader>.sd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
"nnoremap <leader>.n :lua vim.lsp.diagnostic.goto_next()<CR>
"nnoremap <leader>.ll :call LspLocationList()<CR>

"augroup THE_PRIMEAGEN_LSP
    "autocmd!
    "autocmd! BufWrite,BufEnter,InsertLeave * :call LspLocationList()
"augroup END
" / lsp

" import lua
lua require("custom")

" telescope
nnoremap <leader>t :Telescope<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <C-b> :lua require('telescope.builtin').buffers()<CR>
nnoremap <C-S-p> :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
" nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
" nnoremap <leader>vrc :lua require('theprimeagen.telescope').search_dotfiles()<CR>
" nnoremap <leader>va :lua require('theprimeagen.telescope').anime_selector()<CR>
" nnoremap <leader>vc :lua require('theprimeagen.telescope').chat_selector()<CR>
nnoremap <leader>gc :lua require('telescope.builtin').git_branches()<CR>
" nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
" nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.git_create_worktree()<CR>
" / telescope
"

" CoC
" GoTo code navigation.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"
nmap <leader>gd <Plug>(coc-definition)
nmap <silent> K <Plug>(coc-diagnostic-info)
"nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>.r :CocRestart
nmap <leader>.f  <Plug>(coc-fix-current)
nnoremap <leader>.l :CocFzfList<CR>
nnoremap <leader>.d :CocFzfList diagnostics<CR>
nnoremap <leader>.b :CocFzfList diagnostics --curent-buf<CR>
nmap <leader>.a :CocAction<CR>
nmap <tab> :CocAction<CR>
nnoremap <leader>.o :CocFzfList outline<CR>
nnoremap <leader>.y :CocFzfList yank<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


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
"
" coc global extension
let g:coc_global_extensions = [
			\ 'coc-pairs',
			\ 'coc-java',
			\ 'coc-json',
			\ 'coc-sh',
			\ 'coc-git',
			\ 'coc-snippets',
			\ 'coc-vimlsp',
			\ 'coc-texlab',
			\ 'coc-phpls',
			\ 'coc-phpactor',
			\ 'coc-clangd',
			\ 'coc-yaml',
			\ 'coc-docker',
			\ 'coc-tsserver',
			\ 'coc-css',
			\ 'coc-html',
			\ ]
" / Coc



fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

let g:fzf_branch_actions = {
      \ 'track': {'keymap': 'ctrl-n'},
      \}
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '**'
"let g:ale_sign_warning = '--'
let g:ale_fix_on_save = 1

" Blamer
 let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_relative_time = 1
let g:blamer_show_in_visual_modes = 1
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = '  '

" Explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

nmap <c-N> :CocCommand explorer<CR>
nmap <c-M> :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif


"debugger
let g:vimspector_enable_mappings = 'HUMAN'
