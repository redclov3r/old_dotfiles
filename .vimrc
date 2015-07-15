set fileencodings=utf-8
set encoding=utf-8

set noswapfile

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#rc()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My bundles here:
"
" original repos on GitHub
"Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/neocomplete.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'rstacruz/sparkup', {'rtp': 'vim'}
Plugin 'sjbach/lusty'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bufkill.vim'
Plugin 'miripiruni/CSScomb-for-Vim'
Plugin 'kien/ctrlp.vim'
Plugin 'othree/html5.vim'
Plugin 'sukima/xmledit'
Plugin 'Raimondi/delimitMate'
Plugin 'joonty/vim-phpqa'
"Plugin 'joonty/vdebug'
Plugin 'mattn/emmet-vim'
Plugin 'groenewege/vim-less'
Plugin 'editorconfig/editorconfig-vim'
"Plugin 'wookiehangover/jshint.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-session'
" Plugin 'spf13/PIV' " PHP in VIM
" Colorschemes
Plugin 'nanotech/jellybeans.vim'
Plugin 'sickill/vim-monokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'morhetz/gruvbox'
Plugin 'Bogdanp/github.vim'
" vim-scripts repos
Plugin 'L9'
Plugin 'jelera/vim-javascript-syntax'
"Plugin 'javascript.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'php.vim'
"Plugin 'FuzzyFinder'
" non-GitHub repos
"Plugin 'git://git.wincent.com/command-t.git'

"Allow unsaved Files
set hidden

" change the mapleader to ,
let mapleader=","

" make :W map to :w
:command! W w

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
set cursorline    " highlight current line
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set matchtime=2   " For .2 seconds
" set matchpairs+=<:> 
                  " specially for html
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set expandtab     " spaces instead of tabs
filetype plugin indent on     " required!

set visualbell

if has("gui_running")
endif

" Autoload the plugin files for filetypes
filetype plugin on

if has("gui_running")
    syntax enable
    if has("gui_gtk2")
        set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 9
        "set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10
        set lines=50 columns=200 
    elseif has("gui_macvim")
        set guifont=Source\ Code\ Pro:h11
    elseif has("gui_win32")
        set guifont=Consolas:h11
        set lines=50 columns=200 
        "set guifont=SourceCodePro:h10:cANSI
    endif
    " set t_Co=256
    set hlsearch " Highlight
    set clipboard=autoselect " 
    set guioptions-=T
    " set guifont=Consolas:h10
    set nu
    set background=dark
    "colorscheme wombat "or blackboard
    "colorscheme desertEx
    " standard color scheme
    "colorscheme monokai
    "colorscheme distinguished
    "colorscheme solarized
    colorscheme gruvbox
    "colorscheme jellybeans
    " filetype dependent colors (which don't seem to work...)
    " au BufEnter,Filetype python colorscheme desertEx
    " au BufEnter,Filetype javascript colorscheme molokai
    " au BufEnter,Filetype css,scss colorscheme wombat
    " au BufEnter,Filetype html colorscheme wombat
else
    colorscheme desert
endif

set statusline=%<%f%m%r%y%{&ff}%=Char:\ %b\ 0x%B\ Line:\ %l/%L,\ Column:\ %c%V\ %P

""""" Folding
set foldmethod=indent " By default, use indent to determine folds
set foldlevelstart=99 " All folds open by default

" <space> toggles folds opened and closed
nnoremap <space> za

" <space> in visual mode creates a fold over the marked range
vnoremap <space> zf

" work more logically with wrapped lines
noremap j gj
noremap k gk

nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>

" Shortcuts
noremap <F9> :NERDTreeToggle<CR>
nnoremap <C-j><C-l> :LustyJuggler<CR>
nmap <F10> :TagbarToggle<CR>

" Recognize markdown files
autocmd BufNewFile,BufRead *.md set filetype=markdown

" PLUGINS

""""""""""""""""""""""""""""""""
" ctrlp

let g:ctrlp_custom_ignore = {
            \ 'dir': '\v(node_modules|vendor|build|dist)',
            \ }

""""""""""""""""""""""""""""""""
" phpqa
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codesniffer_autorun = 0
"let g:phpqa_codesniffer_args = "--standard=WordPress"


""""""""""""""""""""""""""""""""
" ultisnips
let g:UltiSnipsListSnippets="<C-Tab>"
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:ultisnips_author="Philipp Kreutzer <kreutzer@bucs-it.de>"


""""""""""""""""""""""""""""""""
" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplete#close_popup() . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "\<CR>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

""""""""""""""""""""""""""""""""
" XML Edit
let g:xmledit_enable_html = 1

""""""""""""""""""""""""""""""""
" Airline
"let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
set laststatus=2

""""""""""""""""""""""""""""""""
" Emmet
"inoremap <C-M> <C-Y>,


""""""""""""""""""""""""""""""""
" PIV
let g:DisableAutoPHPFolding = 1

""""""""""""""""""""""""""""""""
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""
" Session
let g:session_autoload = 'no'
let g:session_autosave = 'no'
