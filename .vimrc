set nocompatible
set autoindent
set expandtab
"set list
set number
set showmatch
set smartindent
set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
"set mouse=a
set cmdheight=2
set notimeout ttimeout ttimeoutlen=200
set encoding=utf-8
"set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
"set listchars=tab:»-,trail:-
" 自動再リロード
set autoread
"set listchars=tab:»-,trail:-,eol:↲
set t_Co=256
set backspace=indent,eol,start
" swapファイルを作成しない
set noswapfile
" 全角スペースを視覚化
"highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
"match ZenkakuSpace /　/
"
set guifont=DejaVu\ Sans\ Mono\ 15

" スペースもマッピングされるためコメントは横に記述しません。
" nmap ノーマルモードのキーマップ
" nnoremap ノーマルモードのキーマップ (ただし再帰的にキーマップを追いません)
" imap インサートモードのキーマップ
"
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>
nnoremap j gj
nnoremap k gk
nnoremap <silent><C-e> :NERDTreeToggle<CR>

set pastetoggle=<F10>

" indentで折りたたみをする
set foldmethod=indent
set foldlevel=100

filetype off

if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
        let g:make = 'make'
endif
NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}

"#### Vundle replaed #####
  "set rtp+=~/dotfiles/.vim/bundle/vundle/
  "call vundle#rc()
"#########################

"NeoBundle 'qmarik/vundle'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'Railscasts-Theme-GUIand256color'
colorscheme railscasts
NeoBundle 'mattn/emmet-vim'
NeoBundle 'EnhCommentify.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'hail2u/vim-css3-syntax'
let g:neocomplcache_enable_at_startup = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"    let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
"scssでcssの補完を有効にする
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.scss = '^\s\+\w\+\|\w\+[):;]\?\s\+\|[@!]'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sudo.vim'
NeoBundle 'surround.vim'
NeoBundle 'vim-ruby/vim-ruby'
let ruby_space_errors=1
NeoBundle 'thinca/vim-quickrun.git'
let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'mru.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'wadako111/vim-coffee-script'
NeoBundle 'nathanaelkane/vim-indent-guides.git'
NeoBundle 'briancollins/vim-jst.git'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'vim-scripts/marvim'
NeoBundle 'zoncoen/unite-autojump'

let g:calendar_google_calendar = 1
let g:calendar_locale = "ja"
let g:calendar_first_day = "monday"
" ######## UNITE ##########
NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 0
let g:unite_winwidth = 40
call unite#custom_source('file_rec', 'ignore_pattern', 'vendor/\|tmp/\|log/')
call unite#custom_source('file_rec/async', 'ignore_pattern', 'vendor/\|tmp/\|log/')
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
if has('mac')
  " Mac 用設定
  nnoremap <silent> ,uh :<C-u>Unite file:/Users/takuro_mizobe<CR>
else
  nnoremap <silent> ,uh :<C-u>UniteWithBufferDir -buffer-name=files file:~/ file/new<CR>
endif
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> ,uj :<C-u>UniteWithBufferDir autojump<CR>
nnoremap <silent> ,ut :<C-u>Unite -buffer-name=files buffer file_mru file_rec/async file/new  <CR>
nnoremap <silent> ,um :<C-u>Unite  file_mru <CR>
nnoremap <silent> ,ug :<C-u>Unite grep:%:-iHRn<CR>
nnoremap <silent> ,urc :<C-u>Unite file_rec/async:app/controllers/ -input=!admin<CR><Space>
nnoremap <silent> ,urfc :<C-u>Unite file file/new -input=app/controllers/ <CR>
nnoremap <silent> ,urm :<C-u>Unite file_rec/async:app/models/ -input=!admin <CR><Space>
nnoremap <silent> ,urfm :<C-u>Unite file file/new -input=app/models/ <CR>
nnoremap <silent> ,urv :<C-u>Unite file_rec/async:app/views/ -input=!admin <CR><Space>
nnoremap <silent> ,urfv :<C-u>Unite file file/new -input=app/views/ <CR>
nnoremap <silent> ,urs :<C-u>Unite file_rec/async:app/assets/stylesheets/ <CR>
nnoremap <silent> ,urfs :<C-u>Unite file file/new -input=app/assets/stylesheets/ <CR>
nnoremap <silent> ,urj :<C-u>Unite file_rec/async:app/assets/javascripts/ <CR>
nnoremap <silent> ,urfj :<C-u>Unite file file/new -input=app/assets/javascripts/ <CR>
nnoremap <silent> ,ur4 :<C-u>Unite file_rec/async:app/tasks/ <CR>
nnoremap <silent> ,urf4 :<C-u>Unite file file/new -input=app/tasks/ <CR>
nnoremap <silent> ,uro :<C-u>Unite file_rec/async:config/ <CR>
nnoremap <silent> ,urfo :<C-u>Unite file file/new -input=config/ <CR>
nnoremap <silent> ,uru :<C-u>Unite file_rec/async:app/utils/ <CR>
nnoremap <silent> ,urfu :<C-u>Unite file file/new -input=app/utils/ <CR>

nnoremap <silent> ,url :<C-u>Unite file_rec/async:lib/ <CR>
nnoremap <silent> ,urfl :<C-u>Unite file file/new -input=lib/ <CR>
nnoremap <silent> ,urr :<C-u>Unite file_rec/async:spec/ <CR>
nnoremap <silent> ,urfr :<C-u>Unite file file/new -input=spec/ <CR>
let g:unite_source_file_mru_limit = 100
"##############################


let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=233
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=237
let g:indent_guides_enable_on_vim_startup = 1
set ts=2 sw=2 et


inoremap <Nul> <esc>
highlight CursorIM guibg=Orange guifg=NONE

"<F8> 保存→ rubyで実行
nmap <F8> :w<CR>:!ruby %<CR>

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c ;tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x ;tabclose<CR>
" tx タブを閉じる
"map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
"map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ


"### rails用
let g:surround_{char2nr("-")} = "<% \r %>"
let g:surround_{char2nr("=")} = "<%= \r %>"

"連続でペースト出来るように
vnoremap <silent> <C-p> "0p<CR>

NeoBundle 'tpope/vim-ragtag'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'ctrlpvim/ctrlp.vim'
filetype plugin indent on
"filetype on
syntax on
"NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'othree/yajs.vim', {'autoload':{'filetypes':['javascript']}}
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
NeoBundleCheck
