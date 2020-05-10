highlight clear SignColumn
set nocompatible
filetype on
syntax on

set linespace=30
set signcolumn=yes
set hlsearch
set incsearch
set copyindent
set relativenumber
set autowrite
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undo
set undofile
set tabstop=4
set smartindent
set softtabstop=4
set shiftwidth=4
set expandtab
set splitbelow
set splitright

let g:startify_custom_header = []
let g:startify_session_autoload = 1
let g:startify_enable_special = 0
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]
let g:startify_bookmarks = [
            \ { 'v': '~/.vimrc' },
            \ { 'z': '~/.zshrc' },
            \ '~/Code/richardbagshaw.co.uk/src/pages/index.js',
            \ ]

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let mapleader=","

imap jj <Esc>
nmap <leader>l :set list!<CR>
nnoremap <silent> <leader><Space> :Startify<CR>
nmap <Leader>ev :e ~/.vimrc<cr>
nnoremap <Leader>ff :Ag<CR>
nmap <leader>s :w<cr>
nmap <leader>ec :source %<CR>

au FileType php nmap <buffer> <Leader>u :PhpactorImportClass<CR>
au FileType php nmap <buffer> <Leader>e :PhpactorClassExpand<CR>

let g:buffergator_suppress_keymaps=1
nmap <leader>b :BuffergatorToggle<CR>

autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.blade.php set ft=html
autocmd BufNewFile,BufRead *.vue set ft=vue"
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

au FileType php nnoremap <buffer> <leader>f :call PhpCsFixerFixFile()<CR>
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_php_path = "php"

:imap <C-Space> <C-X><C-O>

map <C-p> :GFiles<cr>
map <leader>p :GFiles<cr>
set rtp+=/usr/local/bin/fzf

au FileType php nnoremap <silent> <Leader>gd :PhpactorGotoDefinition<CR>
nnoremap <silent> <Leader>gb :e#<CR> 

set fillchars+=vert:│
highlight VertSplit ctermbg=NONE ctermfg=black guibg=NONE
highlight LineNr ctermfg=darkgrey

let g:gitgutter_enabled = 1
highlight GitGutterAdd ctermfg=Green
highlight GitGutterDelete ctermfg=Red
highlight GitGutterChange ctermfg=Yellow
set updatetime=100

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nnoremap <leader>t :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1
let g:undotree_SplitWidth=50

map <Leader>n :NERDTreeToggle<CR>
map <Leader>1 :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeWinSize=40
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git$','\.svn','\.idea$',
    \ '\.bzr','\.DS_Store','\.sass-cache','\.vagrant']
let NERDTreeQuitOnOpen=1
let NERDTreeDirArrows=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeHijackNetrw = 0
nnoremap <silent> <Leader>sd :NERDTreeFind<CR>

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'jwalton512/vim-blade'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'
Plug 'airblade/vim-gitgutter'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'phpactor/ncm2-phpactor'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'easymotion/vim-easymotion'
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'ryanoasis/vim-devicons'
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'mattn/emmet-vim'

call plug#end()

filetype plugin indent on

" Which Key Testing

" let g:which_key_map = {}

" autocmd VimEnter * call which_key#register(',', "g:which_key_map")
" nnoremap <silent> <leader> :<c-u>WhichKey ','<CR>
" vnoremap <silent> <leader> :<c-u>WhichKey ','<CR>
" set timeoutlen=500

" let g:which_key_map =  {
"     \ ',': 'which_key_ignore',
"     \ '1': 'which_key_ignore',
"     \ 'pcd': 'which_key_ignore',
"     \ 'b': 'buffers',
"     \ 'n': 'files',
"     \ 'l': 'whitespace',
"     \ 's': 'write',
"     \ 'p': 'fzf',
"     \ 'sd': 'jump to location',
"     \ }

" let g:which_key_map.e = {
"     \ 'name': 'configuration',
"     \ 'v': 'edit .vimrc',
"     \ 'c': 'source .vimrc'
"     \ }

" au FileType php let g:which_key_map.e = "Expand Class (top)"
" au FileType php let g:which_key_map.u = "Import Class (hover)"
" au FileType php let g:which_key_map.f = "php cs fixer"

" let g:which_key_map.h = {
"     \ 'name' : 'GitGutter',
"     \ }

" let g:which_key_map.e = {
"     \ 'name' : 'Configuration Files',
"     \ 'v' : 'Configure .vimrc',
"     \ }

" let g:which_key_map.f = {
"     \ 'name' : 'Search',
"     \ 'f' : 'Full Text Search',
"     \ }

" let g:which_key_map.g = {
"     \ 'name' : 'Goto',
"     \ 'b' : 'Goto Previous'
"     \ }

" au FileType php let g:which_key_map.g.d = "Goto Definition"

" autocmd FileType which_key highlight WhichKey ctermbg=12 ctermfg=7
" autocmd FileType which_key highlight WhichKeySeperator ctermbg=12 ctermfg=7
" autocmd FileType which_key highlight WhichKeyGroup cterm=bold ctermbg=12 ctermfg=7
" autocmd FileType which_key highlight WhichKeyDesc cterm=bold ctermbg=12 ctermfg=7
" autocmd FileType which_key highlight WhichKeyFloating ctermbg=12 ctermfg=7

