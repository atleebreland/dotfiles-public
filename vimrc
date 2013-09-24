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
set relativenumber
set visualbell
set laststatus=2
set encoding=utf-8
set t_Co=256
set background=dark
set showcmd
set hidden
set spell
set history=1000
set undolevels=500
set colorcolumn=80

colorscheme solarized

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
inoremap <Esc> <NOP>

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

" Use absolute numbering in normal mode and relative in insert mode
au InsertEnter * :set nu
au InsertLeave * :set rnu
au WinEnter * :setlocal relativenumber
au WinLeave * :setlocal nonumber

let g:Powerline_symbols = 'fancy'

autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /

" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'Raimondi/delimitMate'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-surround'
    Bundle 'LustyJuggler'
    Bundle 'scrooloose/nerdtree'
    Bundle 'taglist.vim'
    Bundle 'majutsushi/tagbar'
    Bundle 'tpope/vim-repeat'
    Bundle 'msanders/snipmate.vim'
    "Bundle 'scrooloose/snipmate-snippets'
    "Bundle 'ervandew/supertab'
    Bundle 'Valloric/YouCompleteMe'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'scrooloose/syntastic'
    Bundle 'tpope/vim-rails'
    Bundle 'sjl/gundo.vim'
    Bundle 'ap/vim-css-color'
    Bundle 'vim-scripts/omlet.vim'
    Bundle 'kien/ctrlp.vim'
    Bundle 'vim-scripts/Parameter-Text-Objects'
    Bundle 'michaeljsmith/vim-indent-object'
    Bundle 'tpope/vim-haml'
    Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    Bundle 'tpope/vim-ragtag'
    Bundle 'eagletmt/ghcmod-vim'
    Bundle 'benmills/vimux'
    Bundle 'def-lkb/merlin', {'rtp' : 'vim/'}
    Bundle 'tpope/vim-sleuth'
    Bundle 'PeterRincker/vim-argumentative'
    "...All your other bundles...
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif

"source ~/.vim/bundle/snipmate.vim/snippets/support_functions.vim

" Wordwise copy from above line
inoremap <silent> <C-Y> <C-C>:let @z = @"<CR>mz
    \:exec 'normal!' (col('.')==1 && col('$')==1 ? 'k' : 'kl')<CR>
    \:exec (col('.')==col('$')-1 ? 'let @" = @_' : 'normal! yw')<CR>
    \`zp:let @" = @z<CR>a

" Resize splits when window is resized
au VimResized * exe "normal! \<c-w>="

" Handle URL
" Stolen from https://github.com/askedrelic/homedir/blob/master/.vimrc
" OSX only: Open a web-browser with the URL in the current line
function! HandleURI()
    let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
    echo s:uri
    if s:uri != ""
        exec "!open \"" . s:uri . "\""
    else
        echo "No URI found in line."
     endif
endfunction
map <leader>u :call HandleURI()<CR>

" Set up tags for coffeescript
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

" Shortcut for opening compiled javascript files
vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>
map <leader>c :CoffeeCompile<CR>

" Shortcut for easymotion, mapped to caps lock through F3
nmap <F3> ,,
nmap <Space> ,,

" Quick way to jump to lines in compiled javascript files
command -nargs=1 C CoffeeCompile | :<args>

" Show trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

let g:syntastic_python_checker_args = '--ignore=W191'

" Configure powerline to only show the filname
let g:Powerline_stl_path_style = 'filename'

" Macro to remove last set of parens on line
let @q = '$A F)%r $F)D'

" Set sparkup for templates
au BufRead,BufNewFile *.tmpl set filetype=html

" Remap the next mapping key for sparkup (conflicts with tab stuff)
let g:sparkupNextMapping = '<c-x>'

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv

" Sane navigation
noremap j gj
noremap k gk
noremap gj j
noremap gk k

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
map <Leader>o :w<CR>:call ClearRun("make run")<CR>
let VimuxUseNearestPane = 1

set tabstop=4
set shiftwidth=4
set softtabstop=4
