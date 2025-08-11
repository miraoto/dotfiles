" ========================================
" - Plugin manager: dein.vim
" - Lint/fix: ALE
" - Fuzzy & finder: Denite
" - File explorer: defx
" NOTE: Vim8 + Python3 推奨。:echo has('python3') で確認。無い場合は Neovim 推奨。
"       pip3 install --user pynvim が必要になることがあります。
" ========================================

" ---- Basic ----
if &compatible | set nocompatible | endif
set encoding=utf-8
scriptencoding utf-8

let mapleader = "\<Space>"

" ---- Performance ----
set ttyfast
set lazyredraw
set updatetime=300

" ---- Files/backup/undo ----
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

" ---- UI ----
set number
set relativenumber
set cursorline
set laststatus=2
set showcmd
set wildmenu
set wildmode=longest:full,full
set signcolumn=yes
set termguicolors
set showmatch

" Tabs/indent
set expandtab
set shiftwidth=2
set tabstop=2
set smartindent
set autoindent

" Search
set ignorecase smartcase
set incsearch
set hlsearch

" View
set wrap
set linebreak
set breakindent
set scrolloff=4
set sidescrolloff=4

" Clipboard & mouse
if has('clipboard')
  set clipboard+=unnamedplus
endif
set mouse=a

" Security
set modelines=0

" ---- dein bootstrap ----
filetype off
if empty(glob('~/.vim/dein/repos/github.com/Shougo/dein.vim'))
  silent !mkdir -p ~/.vim/dein/repos/github.com/Shougo
  silent !git clone --depth=1 https://github.com/Shougo/dein.vim ~/.vim/dein/repos/github.com/Shougo/dein.vim
  autocmd VimEnter * call dein#install()
endif

set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/dein'))

" ---- Plugins ----
" Colors & UI
call dein#add('altercation/vim-colors-solarized')
call dein#add('itchyny/lightline.vim')

" Lint/Fix
call dein#add('dense-analysis/ale')

" Finder & Explorer (modern stack)
call dein#add('Shougo/denite.nvim')     " requires Python3
call dein#add('Shougo/defx.nvim')       " requires Python3 (pynvim)
call dein#add('ryanoasis/vim-devicons') " optional icons for defx

" Helpful editing (optional but recommended)
" call dein#add('tpope/vim-surround')
" call dein#add('tpope/vim-commentary')
" call dein#add('airblade/vim-gitgutter')
" call dein#add('tpope/vim-sleuth')

call dein#end()
filetype plugin indent on
syntax on

" ---- Colorscheme ----
set background=dark
try
  colorscheme solarized
catch
  clightlineolorscheme default
endtry

" ---- lightline ----
let g:lightline = {
\ 'colorscheme': 'wombat',
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

" ========================================
" ALE (lint & fix)
" ========================================
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s (%severity%)'
let g:ale_lint_on_text_changed = 'never'  " タイピング中は重くしない
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" 代表的な言語の fixer 例（必要に応じて調整）
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

" Node/Prettier のパスを自動解決（プロジェクトローカル優先）
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_prettier_options = ''
let g:ale_fix_on_save_ignore = ['markdown']

" ========================================
" Denite (fuzzy finder)
" ========================================
" 推奨: ripgrep (rg) があれば検索が高速
if executable('rg')
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--no-heading', '--smart-case'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif

" UI tweaks
call denite#custom#option('default', {
\ 'winrow': 1,
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'prompt': '> ',
\})

" Keymaps
nnoremap <silent> <Leader>f :Denite file_rec<CR>
nnoremap <silent> <Leader>b :Denite buffer<CR>
nnoremap <silent> <Leader>m :Denite file_mru<CR>
nnoremap <silent> <Leader>g :Denite grep:. -no-empty<CR>

" ========================================
" defx (file explorer)
" ========================================
" 基本設定
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

" defx 起動ショートカット
nnoremap <silent> <Leader>e :Defx -toggle -resume -columns=icons:indent:git:filename -buffer-name=defx<CR>

" devicons 連携
let g:webdevicons_enable = 1
let g:webdevicons_enable_denite = 1
let g:webdevicons_enable_nerdtree = 0

" ========================================
" Editing niceties
" ========================================
" wrapped lines でも直感的に移動
nnoremap j gj
nnoremap k gk

" Save/quit
nnoremap <Leader>w :write<CR>
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>x :xit<CR>

" Window navigation like tmux
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize splits
nnoremap <Leader><Left>  :vertical resize -5<CR>
nnoremap <Leader><Right> :vertical resize +5<CR>
nnoremap <Leader><Up>    :resize +3<CR>
nnoremap <Leader><Down>  :resize -3<CR>

" Toggle search highlight
nnoremap <Leader>/ :set hlsearch!<CR>

" ---- Finish ----
if dein#check_install()
  call dein#install()
endif
