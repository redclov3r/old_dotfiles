""" Settings
set encoding=utf-8
set ffs=unix,dos,mac "Default file types
set nocompatible " Don't be compatible with vi
set hidden " Allow unsaved Files
let mapleader="," " change the mapleader to ,


""" Init Vundle
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

" Plugins:
"Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bufkill.vim'
" Plugin 'taglist.vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'miripiruni/CSScomb-for-Vim'
Plugin 'kien/ctrlp.vim'
Plugin 'othree/html5.vim'
Plugin 'wookiehangover/jshint.vim'
Plugin 'sjbach/lusty'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'klen/python-mode'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-fugitive'
Plugin 'jakar/vim-json'
Plugin 'jcf/vim-latex'
Plugin 'tpope/vim-surround'
Plugin 'sukima/xmledit'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'mattn/emmet-vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'garbas/vim-snipmate'

""" Remaps
:command W w " make :W map to :w
:command Wq wq " make :Wq map to :wq

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Basic editing settings
set tabstop=4     " a tab is four spaces
set softtabstop=4 " 4 spaces as a tab for bs/del
set backspace=2 " Backspace over anything! (Super backspace!)
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set cindent       " apply the C indenting rules
set nosmartindent
set number        " always show line numbers
set numberwidth=1 " Use 1 col + 1 space for numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set matchtime=2   " For .2 seconds
" set matchpairs+=<:> " specially for html
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set cursorline    " highlight current line
set ttyfast
set scrolloff=3 " Keep 3 lines below and above the cursor

" Bad whitespace
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Autoload the plugin files for filetypes
filetype plugin on

"" Skip this file unless we have +eval
if 1

"""" Movement
" work more logically with wrapped lines
noremap j gj
noremap k gk

if has("gui_running")
syntax enable
" set t_Co=256
set clipboard=autoselect " 
set guioptions-=T
set guifont=Consolas:h12
"colorscheme wombat "or blackboard
"colorscheme desertEx
" standard color scheme
colorscheme jellybeans
else
colorscheme desert
endif

"""" Messages, Info, Status
set shortmess+=a " Use [+] [RO] [w] for modified, read-only, modified
set showcmd " Display what command is waiting for an operator
set laststatus=2 " Always show statusline, even if only 1 window
set report=0 " Notify me whenever any lines have changed
set confirm " Y-N-C prompt if closing with unsaved changes
set vb t_vb= " Disable visual bell! I hate that flashing.
set statusline=%<%f%m%r%y%=Char:\ %b\ 0x%B\ Line:\ %l/%L,\ Column:\ %c%V\ %P

"""" Coding
set history=100 " 100 Lines of history
set showfulltag " Show more information while completing tags
filetype plugin indent on " Let filetype plugins indent for me
set tags=$HOME/.vim/tags

""""" Folding
set foldmethod=indent " By default, use indent to determine folds
set foldlevelstart=99 " All folds open by default

"""" Command Line
set wildmenu " Autocomplete features in the status bar
set wildmode=longest:full,list
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,*.jpg,.svn,_generated_static/**,node_modules

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	sys.path.insert(0, project_base_dir)
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" <space> toggles folds opened and closed
nnoremap <space> za

" <space> in visual mode creates a fold over the marked range
vnoremap <space> zf


"""""""""""""""""""""""""""""""""
" Filetype settings
"""""""""""""""""""""""""""""""""

" Indentation for various Fileformats
au BufRead,BufNewFile *.py set ai sw=4 sts=4 et tw=0 " Pythonfiles with: autoindentation, shiftwidth of 4 spaces, 4 spaces per tab,
au BufRead,BufNewFile *.js set ai sw=4 sts=4 et tw=0 "						expanding tabs and a textwidth of 72 characters. 
au BufRead,BufNewFile *.coffee set ai sw=4 sts=4 et tw=0 
au BufRead,BufNewFile *.html set ai sw=4 sts=4 et tw=0
au BufRead,BufNewFile *.json set ai sw=4 sts=4 et tw=0
au BufNewFile *.html,*.py,*.pyw,*.c,*.h,*.json set fileformat=unix " setting EOL format

" Latex
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 0 " remove Placeholders <++>
au BufRead,BufNewFile *.tex set ai sw=2 sts=2 et tw=0 "						expanding tabs and a textwidth of 72 characters. 
au BufRead,BufNewFile *.tex set iskeyword+=:

nnoremap <silent> <leader>c :!clear;python %<CR>

"""""""""""""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""""""""""""

" python-mode
let python_highlight_all=1
let python_highlight_indents=0
syntax on
" let pymode_lint_write=0 "disable linting because of errors caused by wrong python version in MacVim
let g:pymode_lint_ignore = "E501" " ignore too long lines in python

" delimitMate
let delimitMate_matchpairs = "(:),[:],{:}"

" taglist
nmap <F4> :TlistToggle<CR>

" NERDTreeToggle
nmap <F8> :NERDTreeToggle<CR>

" LustyJuggler 
nmap <c-j><c-l> :LustyJuggler<CR>

" CtrlP
let g:ctrlp_map = '<D-t>'

" UlitiSnips
" reset ultisnip shortcuts, because of youcompleteme
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" xmledit
let g:xmledit_enable_html = 1
endif
