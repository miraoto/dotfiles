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
NeoBundle 'itchyny/lightline.vim' " ステータスバーを装飾
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'vim-jp/vimdoc-ja' " ドキュメントの日本語化
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
set cmdheight=2   " メッセージ表示欄を2行確保"
set expandtab     " タブ入力を複数の空白入力に置き換える"
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
" }}}


" ファイル処理 {{{
set autoread      " 外部でファイルに変更がされた場合は読みなおす"
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

" for PHP {{{
autocmd FileType php autocmd BufWritePre * :%s/\t/    /ge " ファイル保存時にタブをスペースに変換
" autocmd FileType php set makeprg=php\ -l\ % " ファイル保存時にPHPのシンタックスエラーをチェック
" autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
" }}}

" for ruby {{{
autocmd BufEnter *.rb,*.slim :set ts=2 sw=2 sts=0
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

" ctags Keymaps {{{
" 指定のタグ先にジャンプ
" nnoremap ,<C-]> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
" }}}


filetype plugin indent on

NeoBundleCheck
