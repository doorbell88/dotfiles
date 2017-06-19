"-------------------------------- Vundle Setup ---------------------------------
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the 'user/repository' format
Plugin 'gmarik/vundle'

" We could also add repositories with a '.git' extension
Plugin 'scrooloose/nerdtree.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Tagbar'

" Now we can turn our filetype functionality back on
filetype plugin indent on


"-------------------------------------------------------------------------------
set number              " Show line numbers

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set foldmethod=indent   " fold by indent
set foldignore=         " fold comments along with everything else

set tabstop=4           " tab is 4 spaces
set shiftwidth=4        " shiftwidth is same as tab
set expandtab           " expand tabs into spaces as you type
set textwidth=80        " for auto-formatting paragraphs

set incsearch           " do incremental searching
set hlsearch            " do highlight searching
"set ignorecase         " ignore case in searches

set laststatus=2        " always show status bar
set statusline+=%F      " show filepath/filename

set history=50          " keep 50 lines of command line history
set showcmd             " display incomplete commands

let g:pyindent_open_paren = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_continue = '&sw'

"Abbreviations
:ab #w ################################################################################
:ab #- #------------------------------------------------------------------------------#
:ab #_ #______________________________________________________________________________#

" // to search for what is highlighted in VISUAL MODE
vnoremap // y/<C-R>"<CR>

" Y to yank until end of line (instead of entire line)
map Y y$

"toggle between absolute / relative line numbers
" number > relativenumber > nonumber > number
function! NumberToggle()
    if(&number == 1)
        set relativenumber
    elseif(&relativenumber == 1)
        set nonumber
        set norelativenumber
    else
        set number
    endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

"--------------------------------- Solarized -----------------------------------
" get solarized 256 colors to work while in tmux
if $TERM == 'screen'
    set t_Co=256
endif

syntax enable     " Use syntax highlighting
colorscheme solarized

if !has('gui_running')
    " Compatibility for Terminal
    let g:solarized_termtrans=1
    if (&t_Co >= 256 || $TERM == 'xterm-256color')
        " Do nothing, it handles itself.
        let g:solarized_termcolors=256
    else
        " Make Solarized use 16 colors for Terminal support
        let g:solarized_termcolors=16
    endif
endif

set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

" change Visual Mode highlighting colors
hi Visual ctermbg=Yellow
hi Visual ctermfg=DarkGray
"-------------------------------------------------------------------------------


if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on
    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!
    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
    augroup END
else
    set autoindent        " always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif


"===============================================================================
"                                   PLUGINS
"===============================================================================

"----------------------------------- Tagbar ------------------------------------
let g:tagbar_ctags_bin='/usr/local/bin/ctags'   " Proper Ctags locations
let g:tagbar_width = 35                         " Default is 40, seems too wide
let g:tagbar_sort  = 0                          " Do not alpha-sort names
noremap <silent> <Leader>t :TagbarToggle<CR>    " Display panel with \+t


"---------------------------------- NERDTree -----------------------------------
noremap <silent> <Leader>n :NERDTreeToggle<CR>  " Display NERDTree panel: \+n

" automatically close NERDTree when quitting vim (if it's the only buffer)
autocmd bufenter * if (winnr("$") == 1
            \ && exists("b:NERDTree")
            \ && b:NERDTree.isTabTree()) 
            \| q | endif


"---------------------------------- Airline ------------------------------------
let g:airline_theme = 'wombat'                  " luna, solarized, wombat
let g:airline#extensions#tabline#enabled = 1    " Display all buffers
let g:airline#extensions#tabline#fnamemod =':t' " Display just the filename

" Tab navigation
nnoremap <leader>[ :bprevious<CR>               " Previous buffer
nnoremap <leader>] :bnext<CR>                   " Next buffer
nnoremap <leader>bq :bn <BAR> bd #<CR>          " Close current buffer (tab)

" ASCII vs unicode (symbols)
set encoding=utf-8                              " for symbols
let g:airline_symbols_ascii = 1                 " Plain ASCII symbols
"let g:airline_powerline_fonts = 1               " Automatically populate symbols

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols = {}
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = '☰'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'

"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
