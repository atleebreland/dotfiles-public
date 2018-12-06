" ========
"
" Filetype
" ========
filetype off
filetype plugin indent on

" ========
" General Setup
" =======
set nocompatible
"set relativenumber
set number
set visualbell
set laststatus=2
set encoding=utf-8
set t_Co=256
set background=dark
set showcmd
set hidden
"set spell
set history=1000
set undolevels=500
set colorcolumn=120
set textwidth=120

colorscheme solarized
"let g:solarized_termcolors=256

set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*.swp,*.swo,*.swn
set wildmode=list:full

" =========
" Searching
" =========
set hlsearch
set incsearch
set showmatch
set smartcase
let g:EasyMotion_smartcase = 1
set ignorecase

" ========
" Editing
" ========
syntax enable
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab
set expandtab

"set rubydll=/usr/local/opt/ruby@2.3/lib/libruby.dylib

" ========
" Mappings
" ========

let mapleader = ","
let g:maplead = ","

"Enter adds a line below the current one in command mode
"map <silent> <CR> o<ESC>
map <silent> <CR> :w<CR>

" Let backspace act the same as in insert mode
map <silent> <Backspace> X

" Quickly open vimrc
nnoremap <leader>e :e! ~/.vimrc<cr>

" Easier split movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Escape quicker by mashing j and k or hitting jj
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>
"inoremap <Esc> <NOP>

" Provide consistent capital behavior for y
map Y y$

" Remap H/L to go to start/end of line rather than screen. Experimental.
map H ^
map L $

" Sane regexes
nnoremap / /\v
vnoremap / /\v

" Binding to turn off searching highlighting
nnoremap <leader><space> :nohlsearch<cr>

" Force save a read only file
cmap w!! %!sudo tee > /dev/null %


set pastetoggle=<F9>
nmap <F8> :TagbarToggle<CR> 
map <F2> :NERDTreeToggle<CR>
nnoremap <F5> :GundoToggle<CR>

nmap <Leader>m :NERDTreeFind<CR>

" Use absolute numbering in normal mode and relative in insert mode
"au InsertEnter * :set nu
"au InsertLeave * :set rnu
"au WinEnter * :setlocal relativenumber
"au WinLeave * :setlocal nonumber


call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'rking/ag.vim'
    Plug 'vim-python/python-syntax'
    Plug 'tpope/vim-unimpaired'
    Plug 'burnettk/vim-angular'
    Plug 'digitaltoad/vim-pug'
    Plug 'slim-template/vim-slim'
    Plug 'thoughtbot/vim-rspec'
    Plug 'Lokaltog/vim-easymotion'
    Plug 'vim-airline/vim-airline'
    Plug 'justinmk/vim-sneak'
    Plug 'Quramy/tsuquyomi'
    Plug 'leafgarland/typescript-vim'
    Plug 'leafgarland/typescript-vim'
    Plug 'Raimondi/delimitMate'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-surround'
    Plug 'sjbach/lusty'
    Plug 'scrooloose/nerdtree'
    "Plug 'taglist.vim'
    Plug 'majutsushi/tagbar'
    Plug 'tpope/vim-repeat'
    Plug 'msanders/snipmate.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-rails'
    Plug 'vim-ruby/vim-ruby'
    Plug 'sjl/gundo.vim'
    Plug 'ap/vim-css-color'
    Plug 'vim-scripts/omlet.vim'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'eagletmt/ghcmod-vim'
    Plug 'benmills/vimux'
    Plug 'tpope/vim-sleuth'
    Plug 'PeterRincker/vim-argumentative'
    Plug 'jimenezrick/vimerl'
    Plug 'exu/pgsql.vim'
    Plug 'rust-lang/rust.vim'
    Plug 'tpope/vim-abolish'
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'mxw/vim-jsx'
    Plug 'ianks/vim-tsx'
    Plug 'pangloss/vim-javascript'
    Plug 'fatih/vim-go'
    Plug 'mdempsky/gocode', {'rtp': 'vim/'}
    "Plug 'jiangmiao/auto-pairs' --
    "Plug 'scrooloose/snipmate-snippets' --
    "Plug 'ervandew/supertab' --
    Plug 'Valloric/YouCompleteMe'
    "Plug 'scrooloose/syntastic'
    "Plug 'ctrlpvim/ctrlp.vim' --
    "Plug 'def-lkb/merlin', {'rtp' : 'vim/'} --
    "Plug 'takac/vim-hardtime' --
    Plug 'w0rp/ale'
    Plug 'uarun/vim-protobuf'
    "Plug 'davidhalter/jedi-vim'
call plug#end()

" Resize splits when window is resized
au VimResized * exe "normal! \<c-w>="

" Shortcut for easymotion, mapped to caps lock through F3
nmap <F3> ,,
nmap <Space> ,,
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Show trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

"let g:syntastic_python_checker_args = '--ignore=W191'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_python_exec = 'python'
let g:syntastic_python_flake8_exe = 'python -m flake8'

" Set slim for templates
au BufRead,BufNewFile *.slim set filetype=slim

" Set jade for templates
au BufRead,BufNewFile *.jade set filetype=pug

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv

" Sane navigation
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Close buffer without closing split
nmap ,d :b#<bar>bd#<CR>

" Gundo settings 
let g:gundo_debug = 1
let g:gundo_preview_bottom = 1

au BufEnter *.hs compiler ghc

" Map next/prev error
nmap <leader>ln :lnext<CR>
nmap <leader>]l :lprevious<CR>

let g:syntastic_ocaml_use_ocamlbuild = 1

" Tmux ocaml bindings
function ClearRun(cmd)          
    call VimuxRunCommand("clear") 
    call VimuxClearRunnerHistory()
    call VimuxRunCommand(a:cmd)
endfunction      
"let g:tmux_command = "PYTHONPATH=/Users/nicholasmeyer/Documents/code/stxbr/backend/pyclient EJABBERD_CONFIG_FILE=/Users/nicholasmeyer/Documents/code/stxbr/backend/etc/ejabberd/ejabberd.yml python pyclient/chatbot.py"
let g:tmux_command = "python code.py"
map <Leader>o :w<CR>:call ClearRun(g:tmux_command)<CR>
let VimuxUseNearestPane = 1

let g:rspec_command = 'call ClearRun("bin/rspec {spec}\n")'
map <Leader>T :call RunCurrentSpecFile()<CR>
map <Leader>S :call RunNearestSpec()<CR>
map <Leader>L :call RunLastSpec()<CR>
map <Leader>A :call RunAllSpecs()<CR>

let g:used_javascript_libs = 'angularjs,angularuirouter,underscore'

if executable('rg')
  " Use rg over grep
  set grepprg=rg\ --vimgrep
endif

" fzf ripgrep
if executable("rg")
    command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --color=never --ignore-case '.shellescape(<q-args>), 1,
          \   <bang>0 ? fzf#vim#with_preview('up:60%')
          \           : fzf#vim#with_preview('right:50%:hidden', '?'),
          \   <bang>0)

    command! -bang -nargs=* RG
          \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
          \   <bang>0 ? fzf#vim#with_preview('up:60%')
          \           : fzf#vim#with_preview('right:50%:hidden', '?'),
          \   <bang>0)
endif

nnoremap <leader>f :Rg<cr>
nnoremap <leader>p :Rg!<cr>
nnoremap <leader>F :exec "RG ".expand("<cword>")<cr>
nnoremap <leader>P :exec "RG! ".expand("<cword>")<cr>

nnoremap <silent> <c-p> :exe 'Files ' . <SID>fzf_root()<CR>

fun! s:fzf_root()
	let path = finddir(".git", expand("%:p:h").";")
	return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfun

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

set tabstop=4
set shiftwidth=4
set softtabstop=4

set completeopt-=preview

" **AG
let g:ag_lhandler="lopen"
nnoremap <Leader>l :<c-u>LAg! ''<Left>
vnoremap <Leader>l :<c-u>LAg! ''<Left>
nnoremap <silent> <leader>L :set operatorfunc=<SID>LAgMovementOperator<cr>g@
vnoremap <silent> <leader>L :<c-u>call <SID>LAgMovementOperator(visualmode())<cr>

nnoremap <Leader>a :<c-u>Ag! ''<Left>
vnoremap <Leader>a :<c-u>Ag! ''<Left>
nnoremap <silent> <leader>A :set operatorfunc=<SID>AgMovementOperator<cr>g@
vnoremap <silent> <leader>A :<c-u>call <SID>AgMovementOperator(visualmode())<cr>

function! s:AgMovementOperatorParent(command, type)
  let unnamed_cache = @@

  if a:type ==# 'v'
    execute "normal! `<v`>y"
  elseif a:type ==# 'char'
    execute "normal! `[v`]y"
  else
    return
  endif

  execute a:command . " -F " . shellescape(@@) . " ."
  let @@ = unnamed_cache
endfunction

function! s:LAgMovementOperator(type)
  call s:AgMovementOperatorParent('LAg!', a:type)
endfunction

function! s:AgMovementOperator(type)
  call s:AgMovementOperatorParent('Ag!', a:type)
endfunction

" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
if exists('+shada')
  set shada+=n~/.nvim/shada
else
  set viminfo+=n~/.vim/viminfo
endif

" This is only present in 7.3+ {{{3
if exists('+undofile')
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

let g:syntastic_javascript_checkers = ['eslint']
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

let g:ale_linters = {'python': ['flake8', 'mypy'], 'javascript': ['eslint']}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

let g:ycm_python_binary_path = '/usr/bin/python'

" Copy to system clipboard by default
"set clipboard=unnamedplus

" bracketed paste mode:
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

nnoremap <leader>yj :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>yi :YcmCompleter GoToImplementationElseDeclaration<CR>
nnoremap <leader>yt :YcmCompleter GetTypeImprecise<CR>
nnoremap <leader>yd :YcmCompleter GetDoc<CR>
nnoremap <leader>yf :YcmCompleter FixIt<CR>
nnoremap <leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <leader>ys :YcmDiags<CR>
nnoremap <leader>yD ::YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>yR :YcmRestartServer<CR><F9>

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
"let g:go_auto_type_info = 1
