" .vimrc
" Plugin manager: dein.vim | Lint: ALE | Finder: Denite | Explorer: defx

if &compatible | set nocompatible | endif
set encoding=utf-8
scriptencoding utf-8

let mapleader = "\<Space>"

set ttyfast
set lazyredraw
set updatetime=300

set hidden
set nobackup nowritebackup
set undofile
if has('persistent_undo')
  let &undodir = expand('~/.vim/undo')
  if !isdirectory(&undodir) | call mkdir(&undodir, 'p') | endif
endif
set swapfile
let &directory = expand('~/.vim/swap')
if !isdirectory(&directory) | call mkdir(&directory, 'p') | endif

set number
set norelativenumber
set cursorline
set laststatus=2
set showcmd
set wildmenu
set wildmode=longest:full,full
set signcolumn=yes
set termguicolors
set showmatch

set expandtab
set shiftwidth=2
set tabstop=2
set smartindent
set autoindent

set ignorecase smartcase
set incsearch
set hlsearch

set wrap
set linebreak
set breakindent
set scrolloff=4
set sidescrolloff=4

if has('clipboard')
  set clipboard+=unnamedplus
endif
set mouse=a

set modelines=0

filetype off
if empty(glob('~/.vim/dein/repos/github.com/Shougo/dein.vim'))
  silent !mkdir -p ~/.vim/dein/repos/github.com/Shougo
  silent !git clone --depth=1 https://github.com/Shougo/dein.vim ~/.vim/dein/repos/github.com/Shougo/dein.vim
  autocmd VimEnter * call dein#install()
endif

set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/dein'))

call dein#add('altercation/vim-colors-solarized')
call dein#add('itchyny/lightline.vim')
call dein#add('dense-analysis/ale')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/defx.nvim')
call dein#add('ryanoasis/vim-devicons')

call dein#end()
filetype plugin indent on
syntax on

set background=dark
try
  colorscheme solarized
catch
  colorscheme default
endtry

let g:lightline = {
\ 'colorscheme': 'powerline',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': { 'gitbranch': 'LightlineGitBranch' }
\ }
function! LightlineGitBranch()
  if exists('*fugitive#head')
    return fugitive#head()
  endif
  return ''
endfunction

highlight CursorLine cterm=NONE ctermbg=237 ctermfg=White guibg=#444444 guifg=#ffffff

let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s (%severity%)'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_fixers = {
\  'javascript': ['prettier'],
\  'typescript': ['prettier'],
\  'typescriptreact': ['prettier'],
\  'json': ['prettier'],
\  'css': ['prettier'],
\  'scss': ['prettier'],
\  'html': ['prettier'],
\  'ruby': ['rubocop'],
\  'python': ['black'],
\}

let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_prettier_options = ''
let g:ale_fix_on_save_ignore = ['markdown']

if executable('rg')
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--no-heading', '--smart-case'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif

call denite#custom#option('default', {
\ 'winrow': 1,
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'prompt': '> ',
\})

nnoremap <silent> <Leader>f :Denite file_rec<CR>
nnoremap <silent> <Leader>b :Denite buffer<CR>
nnoremap <silent> <Leader>m :Denite file_mru<CR>
nnoremap <silent> <Leader>g :Denite grep:. -no-empty<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
  nnoremap <silent><buffer><expr> c    defx#do_action('copy')
  nnoremap <silent><buffer><expr> m    defx#do_action('move')
  nnoremap <silent><buffer><expr> p    defx#do_action('paste')
  nnoremap <silent><buffer><expr> l    defx#do_action('open')
  nnoremap <silent><buffer><expr> E    defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P    defx#do_action('preview')
  nnoremap <silent><buffer><expr> K    defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N    defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d    defx#do_action('remove')
  nnoremap <silent><buffer><expr> r    defx#do_action('rename')
  nnoremap <silent><buffer><expr> .    defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> q    defx#do_action('quit')
endfunction

nnoremap <silent> <Leader>e :Defx -toggle -resume -columns=icons:indent:git:filename -buffer-name=defx<CR>

let g:webdevicons_enable = 1
let g:webdevicons_enable_denite = 1
let g:webdevicons_enable_nerdtree = 0

nnoremap j gj
nnoremap k gk

nnoremap <Leader>w :write<CR>
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>x :xit<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader><Left>  :vertical resize -5<CR>
nnoremap <Leader><Right> :vertical resize +5<CR>
nnoremap <Leader><Up>    :resize +3<CR>
nnoremap <Leader><Down>  :resize -3<CR>

nnoremap <Leader>/ :set hlsearch!<CR>

if dein#check_install()
  call dein#install()
endif
