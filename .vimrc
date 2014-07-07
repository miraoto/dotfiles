set nocompatible

filetype off               "ファイルタイプ関連を無効化
filetype plugin indent off "ファイルタイプ関連を無効化

" NeoBundle {{{
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'itchyny/lightline.vim'  " ステータスバーを装飾
NeoBundle 'scrooloose/syntastic'   " 各種シンタックスチェック
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim' " 最近利用したファイルを表示
NeoBundle 'Shougo/unite-outline'
NeoBundle 'basyura/unite-rails'
NeoBundle 'kana/vim-smartinput' " 括弧などの補完
NeoBundle 'kana/vim-submode'
NeoBundle 'cohama/vim-smartinput-endwise' " vim-endwiseみたいなもの
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'tomtom/tcomment_vim' " 複数行コメントアウト
NeoBundle 'vim-jp/vimdoc-ja' " ドキュメントの日本語化
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundleLazy 'alpaca-tc/alpaca_tags', {
  \ 'rev' : 'development',
  \ 'depends': ['Shougo/vimproc', 'Shougo/unite.vim'],
  \ 'autoload' : {
  \   'commands' : ['Tags', 'TagsUpdate', 'TagsSet', 'TagsBundle', 'TagsCleanCache'],
  \   'unite_sources' : ['tags']
  \ }}
" }}}

" NeoBundle#ruby {{{
NeoBundle 'tpope/vim-rails'   " railsプロジェクト間の移動
NeoBundle 'tpope/vim-endwise' " 対になる文字を補完
" }}}


" colorschema {{{
colorscheme desert
" }}}

" 文字コード {{{
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,cp932
" }}}


" 編集 {{{
set matchtime=3 " ハイライト秒数
set showmatch   " 対応する括弧をハイライト
" }}}


" 表示 {{{
syntax on " シンタックスハイライト有効
set ambiwidth=double "
set autoindent    "_
set cmdheight=2   " メッセージ表示欄を2行確保
set expandtab     " タブ入力を複数の空白入力に置き換える
set ruler         " カーソル行表示
set nu            " 行番号表示
set showcmd       " コマンドの一部を画面の最下行に表示
set shiftwidth=4  " インデントの各段階に使われる空白の数
set softtabstop=0 " <Tab> の挿入や <BS> の使用等の編集操作をするときに、<Tab> が対応する空白の数
set tabstop=4     " ファイル内の <Tab> が対応する空白の数
set title         " タイトル表示
set t_Co=256      " 
set list          " タブ文字を CTRL-I で表示し、行末に $ で表示
set listchars=trail:_,eol:¬,tab:^\  " Listモードに利用する文字を設定
set laststatus=2  " 最下ウィンドウにステータスを表示
set nowildmenu    " 
set wildmode=longest " 
set visualbell t_vb= " ビープ音なし
" }}}


" ファイル処理 {{{
set autoread      " 外部でファイルに変更がされた場合は読みなおす
set hidden        " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set history=50    " コマンドラインの履歴を50件保存する
set noswapfile    " ファイル保存時にスワップファイルを作らない
set nobackup      " ファイル保存時にバックアップファイルを作らない
set nowritebackup " 
" }}}


" 検索 {{{
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索マッチ文字列をハイライト
set ignorecase " 大文字/小文字を区別しない
set smartcase  " 検索文字に大文字がある場合大文字/小文字を区別する
set wrapscan   " 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
" }}}

" syntastic {{{
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map={
\  'mode': 'passive',
\ 'active_filetypes': ['php', 'ruby', 'javascript'],
\ 'passive_filetypes': []
\}
let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_php_checkers=['php']
let g:syntastic_quite_warnings=0
" }}}

" vim-submode {{{
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')
" }}}

" neocomplcache
" http://vim-users.jp/2010/10/hack177/¬
" {{{
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" }}}

" for PHP {{{
autocmd FileType php autocmd BufWritePre * :%s/\t/    /ge " ファイル保存時にタブをスペースに変換
" }}}

" for ruby {{{
autocmd BufEnter *.rb,*.rake,*.slim :set ts=2 sw=2 sts=0
" }}}

" forbid arrow Keymaps {{{
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" }}}

" Filer Keymaps {{{
nnoremap <silent><Space>j  :VimFilerExplorer<CR> " ファイラー起動
" nnoremap <silent><Space>jj  :VimFiler<CR> " プロジェクトファイラー起動
" }}}

" Escape Keymaps {{{
inoremap <silent> jj <ESC>
inoremap <silent> <C-c> <ESC>
" }}}

" Tab Keymaps {{{
" 新タブ
nnoremap <silent><Space>t :tabnew<CR>
" }}}

" VimShell Keymaps {{{
" VimShell起動
nnoremap <silent><Space>s :VimShell<CR>
" }}}

" alpaca_tags
let g:alpaca_update_tags_config = {
  \ '_' : '-R --sort=yes --languages=-js,html,css',
  \ 'js' : '--languages=+js',
  \ '-js' : '--languages=-js,JavaScript',
  \ 'php' : '--languages=+php',
  \ 'ruby': '--languages=+Ruby',
  \ 'css' : '--languages=+css',
  \ '-style': '--languages=-css,scss,js,JavaScript,html'
  \ }

augroup AlpacaTags
  autocmd!
  if exists(':Tags')
    autocmd BufWritePost *.rb TagsUpdate ruby
    autocmd BufWritePost *.php TagsUpdate php
    autocmd BufWritePost *.css TagsUpdate css
    autocmd BufWritePost *.js TagsUpdate js
    autocmd BufEnter * TagsSet
  endif
augroup END
nnoremap <expr>tt  ':Unite tags -horizontal -buffer-name=tags -input='.expand("<cword>").'<CR>'
" }}}

" ctags Keymaps {{{
" 指定のタグ先にジャンプ
" nnoremap ,<C-]> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
" }}}

" vim smartinput_endwise {{{
call smartinput_endwise#define_default_rules()
" }}}

" Unite Keymaps {{{
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
" }}}


filetype plugin indent on

NeoBundleCheck
