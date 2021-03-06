" This must be first, because it changes other options as side effect
set nocompatible

filetype off                    " force reloading *after* pathogen loaded
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'altercation/vim-colors-solarized'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'othree/html5.vim'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'scrooloose/nerdtree'
Bundle 'mattn/zencoding-vim'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'LustyJuggler'
"Bundle 'Jinja'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on       " enable detection, plugins and indenting in one step

" Change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" autocmd VimEnter * set vb t_vb=

" Solarized settings
syntax enable
set background=dark
colorscheme solarized
" Toggle solarized background
call togglebg#map("<F6>")

" Powerline
set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim
"python from powerline.bindings.vim import source_plugin; source_plugin()

" Editing behaviour {{{
set showmode                    " always show what mode we're currently editing in
"set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set virtualedit=all             " allow the cursor to go in to "invalid" places
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set gdefault                    " search/replace "globally" (on a line) by default
                                " but it is enabled for some file types (see later)
set pastetoggle=<F2>            " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
set mouse=a                     " enable using the mouse if terminal emulator
                                "    supports it (xterm does)
set fileformats="unix,dos,mac"
set formatoptions+=1            " When wrapping paragraphs, don't end lines
                                "    with 1-letter words (looks stupid)

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
" set visualbell           " don't beep
set noerrorbells         " don't beep
set laststatus=2

set nobackup
set noswapfile
set hidden


" filetype specific config
autocmd FileType php setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType twig setlocal shiftwidth=2 tabstop=2 softtabstop=2

if has('gui_running')
    " fancy Powerline symbols
    let g:Powerline_symbols = 'fancy'
endif

" set ofu=syntaxcomplete
" set ignorecase
" set noautoindent
" set smartindent
" set showcmd
" set ruler
" set expandtab
" set softtabstop=4
" set wildmenu
" set wildmode=longest,full
" set scrolloff=10
" set omnifunc=1

" PHP Settings
let php_sql_query = 1
let php_htmlInStrings = 1
let php_noShortTags = 1

" ctrlp settings
let g:ctrlp_dotfiles = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]deploy$',
  \ }

nmap <silent> ,/ :nohlsearch<CR>
nnoremap <leader>w <C-w>v<C-w>l

" Managing buffers with LustyJuggler {{{
map <leader>b :LustyJuggler<CR>
" }}}

" NERDTree shortcut
map <F10> :NERDTree<CR>
