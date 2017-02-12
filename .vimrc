set nocompatible

filetype off               "ファイルタイプ関連を無効化
filetype plugin indent off "ファイルタイプ関連を無効化

set runtimepath+=~/.vim/dein/dein.vim
call dein#begin(expand('~/.vim/dein'))

call dein#add('altercation/vim-colors-solarized')
call dein#add('itchyny/lightline.vim')  " ステータスバーを装飾
call dein#add('scrooloose/syntastic')   " 各種シンタックスチェック
call dein#add('Shougo/vimfiler')
call dein#add('Shougo/vimproc')
call dein#add('Shougo/vimshell')
call dein#add('szw/vim-tags')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim') " 最近利用したファイルを表示
call dein#add('Shougo/unite-outline')
call dein#add('basyura/unite-rails')
call dein#add('kana/vim-smartinput') " 括弧などの補完
call dein#add('kana/vim-submode')
call dein#add('cohama/vim-smartinput-endwise') " vim-endwiseみたいなもの
call dein#add('tsukkee/unite-tag')
call dein#add('tomtom/tcomment_vim') " 複数行コメントアウト
call dein#add('vim-jp/vimdoc-ja') " ドキュメントの日本語化
call dein#add('ekalinin/Dockerfile.vim')
call dein#add('kchmck/vim-coffee-script')
call dein#add('alpaca-tc/alpaca_tags', {
  \ 'rev' : 'development',
  \ 'depends': ['Shougo/vimproc', 'Shougo/unite.vim'],
  \ 'autoload' : {
  \   'commands' : ['Tags', 'TagsUpdate', 'TagsSet', 'TagsBundle', 'TagsCleanCache'],
  \   'unite_sources' : ['tags']
  \ }})
" }}}

" NeoBundle#ruby {{{
call dein#add('tpope/vim-rails')   " railsプロジェクト間の移動
call dein#add('slim-template/vim-slim')
call dein#add('tpope/vim-endwise') " 対になる文字を補完
" }}}
call dein#end()

" colorschema {{{
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
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

" for javascript {{{
autocmd BufEnter *.js :set ts=2 sw=2 sts=0 et
" }}}

" for coffeescript {{{
autocmd BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデント設定
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
" オートコンパイル
  "保存と同時にコンパイルする
autocmd BufWritePost *.coffee silent make! 
  "エラーがあったら別ウィンドウで表示
autocmd QuickFixCmdPost * nested cwindow | redraw! 
" Ctrl-cで右ウィンドウにコンパイル結果を一時表示する
nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h
" }}}

" for digdag {{{
au BufNewFile,BufRead *.dig setf yaml
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
"    autocmd BufWritePost *.rb TagsUpdate ruby
"    autocmd BufWritePost *.php TagsUpdate php
"    autocmd BufWritePost *.css TagsUpdate css
"    autocmd BufWritePost *.js TagsUpdate js
"    autocmd BufEnter * TagsSet
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

" vim-tags {{{
let g:vim_tags_project_tags_command = "/usr/local/Cellar/ctags/5.8_1/bin/ctags -f tags -R . 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/Cellar/ctags/5.8_1/bin/ctags -R -f Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
set tags+=tags,Gemfile.lock.tags
" }}}


filetype plugin indent on

if dein#check_install()
  call dein#install()
endif
