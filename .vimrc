set nocompatible                 " Vim vi互換なし

"-------------------------------------------------------------------------------
" バンドル Bundle
"-------------------------------------------------------------------------------

"neobunlde.vimで管理してるpluginを読み込む
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif


""" NeoBundle
NeoBundle 'Shougo/neobundle.vim'

""" Edit
NeoBundle 'The-NERD-Commenter' " NERD_commenter.vim :最強コメント処理
NeoBundle 'nathanaelkane/vim-indent-guides' " インデントを表示する
NeoBundle 'tpope/surround.vim' "テキストを括弧で囲む／削除する
NeoBundle 'h1mesuke/vim-alignta' " コード整形

""" Completion/Move/Search/Encoding
NeoBundle 'Shougo/neocomplcache' " 補完プラグイン
NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'camelcasemotion' " CamelCase/snake_case単位でのワード移動
NeoBundle 'EasyMotion' " 単語ジャンプを簡単に
NeoBundle 'banyan/recognize_charcode.vim' " 文字コードの自動判別

""" Utility
NeoBundle 'Lokaltog/vim-powerline.git' " ステータスバーをカッコよく
NeoBundle 'minibufexpl.vim' "バッファをタブ風管理
NeoBundle 'vim-scripts/TwitVim' "Twitter
NeoBundle 'mattn/gist-vim' "Gist.vim
NeoBundle 'mattn/webapi-vim' "Web-API
NeoBundle 'thinca/vim-ref' "Vim-Ref

""" Programming/Syntax
NeoBundle 'thinca/vim-quickrun' " QuickRun
NeoBundle 'tpope/vim-markdown' " Markdown
NeoBundle 'kana/vim-altr' " vim altr
NeoBundle 'JavaScript-syntax' " JavaScript
NeoBundle 'jQuery' " jQuery
NeoBundle 'kchmck/vim-coffee-script' " Coffee Script
NeoBundle 'yuroyoro/vim-python' " Python
NeoBundle 'yuroyoro/vim-scala' " Scala
NeoBundle 'ruby.vim' " Ruby
NeoBundle 'tpope/vim-rails' " Rails
NeoBundle 'derekwyatt/vim-sbt' " sbt
NeoBundle 'Rip-Rip/clang_complete' " C/C++
NeoBundle 'osyo-manga/neocomplcache-clang_complete' " C/C++

""" Unite.vim
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'ujihisa/unite-colorscheme' "Unite colorscheme
NeoBundle 'sgur/unite-qf' "Unite QuickFix
NeoBundle 'h1mesuke/unite-outline' "Unite outline
NeoBundle 'tacroe/unite-mark' " Unite mark

filetype plugin on
filetype indent on

"-------------------------------------------------------------------------------
" 基本設定 Basics
"-------------------------------------------------------------------------------
let mapleader = ","              " キーマップリーダー
set scrolloff=5                  " スクロール時の余白確保
set textwidth=0                  " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                     " バックアップ取らない
set autoread                     " 他で書き換えられたら自動で読み直す
set noswapfile                   " スワップファイル作らない
set hidden                       " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start   " バックスペースでなんでも消せるように
set formatoptions=lmoq           " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                     " ビープをならさない
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set modelines=0                  " モードラインは無効

" OSのクリップボードを使用する
set clipboard+=unnamed
" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

"ヤンクした文字は、システムのクリップボードに入れる"
set clipboard=unnamed

" Ev/Rvでvimrcの編集と反映
" Zvでzshrcを編集
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC
command! Zv edit ~/.zshrc

" ファイルタイプ判定をon
filetype plugin on

"-------------------------------------------------------------------------------
" インデント Indent
"-------------------------------------------------------------------------------
set autoindent   " 自動でインデント
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent      " Cプログラムファイルの自動インデントを始める

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=2 shiftwidth=2 softtabstop=0

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off

  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
endif

"-------------------------------------------------------------------------------
" 表示 Apperance
"-------------------------------------------------------------------------------
set showmatch         " 括弧の対応をハイライト
set number            " 行番号表示
" set list              " 不可視文字表示
" set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set display=uhex      " 印字不可能文字を16進数で表示

" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" コマンド実行中は再描画しない
set lazyredraw
" 高速ターミナル接続を行う
set ttyfast

"-------------------------------------------------------------------------------
" 検索設定 Search
"-------------------------------------------------------------------------------
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト
"Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" Ctrl-iでヘルプ
nnoremap <C-i>  :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

"-------------------------------------------------------------------------------
" 移動設定 Move
"-------------------------------------------------------------------------------
"---------------------------
"  カーソル移動
"---------------------------
" カーソルを表示行で移動する。論理行移動は<C-n>,<C-p>
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up>   gk

" insert mode での移動
inoremap  <C-e> <END>
inoremap  <C-a> <HOME>

" インサートモードの十字キーを修正
imap OA <Up>
imap OB <Down>
imap OC <Right>
imap OD <Left>
"---------------------------
"  カーソル移動
"---------------------------
" Space-Spaceで次のbufferへ。BS-BSで前のbufferへ
nmap <Space><Space> :bn<CR>
nmap <BS><BS> :bp<CR>
" C-w -> C-n/p で次/前のbufferへ
nmap <C-w><C-n> :bn<CR>
nmap <C-w><C-p> :bp<CR>

" <C-w><C-w>でバッファを削除する
map <C-w><C-w> <ESC>:bnext \| bdelete #<CR>
command! Bw :bnext \| bdelete #

" C-w !で分割を解除
nnoremap <C-w>! <C-w>o

" C-w oで次のウィンドウへ
nnoremap <C-w>o <C-w>w
nnoremap <C-w><C-o> <C-w>w

"---------------------------
"  その他
"---------------------------
" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 矩形選択で自由に移動する
set virtualedit+=block

"ビジュアルモード時vで行末まで選択
vnoremap v $h

" insert mode でjjでesc
inoremap jj <Esc>

"-------------------------------------------------------------------------------
" カラー関連 Colors
"-------------------------------------------------------------------------------
" ターミナルタイプによるカラー設定
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86" || &term =~ "xterm-256color"
 set t_Co=16
 set t_Sf=^[[3%dm
 set t_Sb=^[[4%dm
elseif &term =~ "xterm-color"
 set t_Co=8
 set t_Sf=^[[3%dm
 set t_Sb=^[[4%dm
endif

" ハイライト on
syntax enable

" 補完候補の色づけ for vim7
hi Pmenu ctermbg=white ctermfg=darkgray
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
hi PmenuSbar ctermbg=0 ctermfg=9

"-------------------------------------------------------------------------------
" 編集関連 Edit
"-------------------------------------------------------------------------------
" insertモードを抜けるとIMEオフ(ショートカットキーでは不可能 - jj, C-c, 英数＋かななど)
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" C-hでバックスペース
inoremap <C-h> <BS>

" Visualモードでのpで選択範囲をレジスタの内容に置き換える
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" S-yで行末までヤンク
nnoremap Y y$

" Tabキーを空白に変換
set expandtab

" XMLの閉タグを自動挿入
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END

" :Ptでインデントモード切替
command! Pt :set paste!

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge

" 日時の自動入力
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y/%m/%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

" <leader>j でJSONをformat
" http://wozozo.hatenablog.com/entry/2012/02/08/121504
map <Leader>j !python -m json.tool<CR>

" quickfixウィンドウではq/ESCで閉じる
autocmd FileType qf nnoremap <buffer> q :ccl<CR>
autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>

" cwでquickfixウィンドウの表示をtoggleするようにした
function! s:toggle_qf_window()
  for bufnr in range(1,  winnr('$'))
    if getwinvar(bufnr,  '&buftype') ==# 'quickfix'
      execute 'ccl'
      return
    endif
  endfor
  execute 'botright cw'
endfunction
nnoremap <silent> cw :call <SID>toggle_qf_window()<CR>

"-------------------------------------------------------------------------------
" エンコーディング関連 Encoding
"-------------------------------------------------------------------------------
set ffs=unix,dos,mac  " 改行文字
set encoding=utf-8    " デフォルトエンコーディング

" cvsの時は文字コードをeuc-jpに設定
autocmd FileType cvs      :set fileencoding=euc-jp
" 以下のファイルの時は文字コードをutf-8に設定
autocmd FileType svn      :set fileencoding=utf-8
autocmd FileType js       :set fileencoding=utf-8
autocmd FileType css      :set fileencoding=utf-8
autocmd FileType html     :set fileencoding=utf-8
autocmd FileType xml      :set fileencoding=utf-8
autocmd FileType java     :set fileencoding=utf-8
autocmd FileType scala    :set fileencoding=utf-8

" ワイルドカードで表示するときに優先度を低くする拡張子
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" 指定文字コードで強制的にファイルを開く
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932

"-------------------------------------------------------------------------------
" テンプレート設定 template
"-------------------------------------------------------------------------------
autocmd BufNewFile *.c  0r ~/.vim/template/c.c
autocmd BufNewFile *.cpp  0r ~/.vim/template/cpp.cpp
autocmd BufNewFile *.java 0r ~/.vim/template/java.java
autocmd BufNewFile *.php 0r ~/.vim/template/php.php
autocmd BufNewFile *.html 0r ~/.vim/template/html.html
autocmd BufNewFile *.js 0r ~/.vim/template/js.js
autocmd BufNewFile *.coffee 0r ~/.vim/template/coffee.coffee

"-------------------------------------------------------------------------------
" プラグインごとの設定 Plugins
"-------------------------------------------------------------------------------
"------------------------------------
" Alignta
"------------------------------------
vnoremap <Leader>a :Align<Space>

"------------------------------------
" MiniBufExplorer
"------------------------------------
"set minibfexp
let g:miniBufExplMapWindowNavVim=1 "hjklで移動
let g:miniBufExplSplitBelow=0  " Put new window above
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1
let g:miniBufExplMaxSize = 10

":MtでMiniBufExplorerの表示トグル
command! Mt :TMiniBufExplorer

"------------------------------------
" NERD_commenter.vim
"------------------------------------
" コメントの間にスペースを空ける
let NERDSpaceDelims = 1
"<Leader>xでコメントをトグル(NERD_commenter.vim)
map <Leader>x <Leader>c<space>
""未対応ファイルタイプのエラーメッセージを表示しない
let NERDShutUp=1

"------------------------------------
" vim-indent-guides
"------------------------------------
nnoremap <silent> <Space>id :<C-u>IndentGuidesToggle<Enter>
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
if 'dark' == &background
  hi IndentGuidesOdd  ctermbg=black
  hi IndentGuidesEven ctermbg=darkgrey
else
  hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey
endif

"------------------------------------
" camelcasemotion.vim
"------------------------------------
" <Shift-wbe>でCameCaseやsnake_case単位での単語移動
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
" text-objectで使用できるように
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

"------------------------------------
" unite.vim
"------------------------------------
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    f [unite]

nnoremap [unite]u  :<C-u>Unite -no-split<Space>

" 全部乗せ
nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -no-split -buffer-name=files buffer file_mru bookmark file<CR>
" ファイル一覧
nnoremap <silent> [unite]f  :<C-u>Unite -no-split -buffer-name=files file<CR>
" バッファ一覧
nnoremap <silent> [unite]b  :<C-u>Unite -no-split buffer<CR>
" 常用セット
nnoremap <silent> [unite]u  :<C-u>Unite -no-split buffer file_mru<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m  :<C-u>Unite -no-split file_mru<CR>
" 現在のバッファのカレントディレクトリからファイル一覧
nnoremap <silent> [unite]d  :<C-u>UniteWithBufferDir -no-split file<CR>
" アウトラインを表示
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
" マーク一覧を表示
nnoremap <silent> [unite]m  :<C-u>Unite mark<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  " ESCキーを2回押すと終了する
  nmap <buffer> <ESC>      <Plug>(unite_exit)
  nmap <buffer> <ESC><ESC> <Plug>(unite_exit)
  imap <buffer> jj      <Plug>(unite_insert_leave)
  nnoremap <silent><buffer> <C-k> :<C-u>call unite#mappings#do_action('preview')<CR>
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  " Start insert.
  let g:unite_enable_start_insert = 1

  " ウィンドウを分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')

  " ウィンドウを縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
endfunction"}}}

let g:unite_source_file_mru_limit = 200

" unite-plugins
cnoremap UH Unite help<Enter>
cnoremap UO Unite outline<Enter>

"------------------------------------
" quickrun.vim
"------------------------------------
let g:quickrun_config = {}

"------------------------------------
" PowerLine
"------------------------------------
let g:Powerline_symbols = 'fancy'

"------------------------------------
" neocomplecache.vim
"------------------------------------
" NeoComplCacheを有効にする
let g:neocomplcache_enable_at_startup = 1
" smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplcache_enable_camel_case_completion = 1
" _(アンダーバー)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplcache_min_syntax_length = 3
" neocomplcacheを自動的にロックするバッファ名のパターン
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" -入力による候補番号の表示
let g:neocomplcache_enable_quick_match = 1
" 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)
let g:neocomplcache_enable_auto_select = 1

" NeoComplChache 補完候補の色づけ
hi Pmenu ctermbg=white ctermfg=darkgray
hi PmenuSel ctermbg=12 ctermfg=black
hi PmenuSbar ctermbg=0 ctermfg=9

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'scala' : $HOME.'/.vim/dict/scala.dict',
    \ 'java' : $HOME.'/.vim/dict/java.dict',
    \ 'c' : $HOME.'/.vim/dict/c.dict',
    \ 'cpp' : $HOME.'/.vim/dict/cpp.dict',
    \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
    \ 'coffee' : $HOME.'/.vim/dict/javascript.dict',
    \ 'ocaml' : $HOME.'/.vim/dict/ocaml.dict',
    \ 'perl' : $HOME.'/.vim/dict/perl.dict',
    \ 'php' : $HOME.'/.vim/dict/php.dict',
    \ 'scheme' : $HOME.'/.vim/dict/scheme.dict',
    \ 'vim' : $HOME.'/.vim/dict/vim.dict'
    \}

" ユーザー定義スニペット保存ディレクトリ
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'

" スニペット
imap <C-l> <Plug>(neocomplcache_snippets_expand)
smap <C-l> <Plug>(neocomplcache_snippets_expand)

" 補完・スニペッドのキーマッピング
" TABで補完できるようにする
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" 補完候補が出ていたら確定、なければ改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
" <C-h>, <BS>: 補完候補を閉じる
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" 補完をキャンセルしpopupを閉じる
inoremap <expr><C-e> neocomplcache#cancel_popup()

" FileType毎のOmni補完を設定
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete

"------------------------------------
" Vim-Ref
"------------------------------------
let g:ref_source_webdict_sites = {
\   'alc': {
\     'url': 'http://eow.alc.co.jp/search?q=%s',
\     'keyword_encoding': 'utf-8',
\   }
\ }
let g:ref_source_webdict_sites.default = 'alc'

" alc出力に対するフィルタ 最初の数行を削除
function! g:ref_source_webdict_sites.alc.filter(output)
  return join(split(a:output, "\n")[34 :], "\n")
endfunction

" ,ra でalcから検索
nmap <Leader>sa :<C-u>Ref webdict<space>

"------------------------------------
" C/C++ 補完
"------------------------------------
let g:neocomplcache_force_overwrite_completefunc=1
let g:clang_complete_auto=1

"------------------------------------
" vim altr 対応ファイルを開く
"------------------------------------
nmap <F2> <Plug>(altr-forward)
