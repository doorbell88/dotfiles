"----------------------------- Basic Vim Settings ------------------------------
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set number              " Show line numbers

set tabstop=4           " tab is 4 spaces
set shiftwidth=4        " shiftwidth is same as tab
set expandtab           " expand tabs into spaces as you type
set textwidth=80        " for auto-formatting paragraphs

" searching
set incsearch           " do incremental searching
set hlsearch            " do highlight searching
set cursorcolumn        " highlight the column the cursor is on
set cursorline          " highlight the line the cursor is on
"highlight clear CursorLine " only the line number will be highlighted
"(to change the number line)
"highlight CursorLineNR ctermbg=red

set laststatus=2        " always show status bar
set statusline+=%F      " show filepath/filename

set history=50          " keep 50 lines of command line history
set showcmd             " display incomplete commands

set timeoutlen=1000     " mapping delays
set ttimeoutlen=0       " key code delays (delay after <ESC> key)

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" indentation
"let g:pyindent_open_paren   = '&sw'
"let g:pyindent_nested_paren = '&sw'
"let g:pyindent_continue     = '&sw'

" switch buffers without having to save
set hidden
set switchbuf=useopen,usetab

" set scroll offset (scrolloff) For scrolling with the cursor. Default is 0
set scrolloff=2         " scroll offset ('set so=5')

" >>>>>  CODE FOLDING <<<<<
" Indent code folding
set foldmethod=indent   " fold by indent
set foldignore=         " fold comments along with everything else

" Marker code folding
"set foldmethod=marker
set foldmarker=#Region,#End\ Region     " for Visual Basic


"-------------------------------- Key Mappings ---------------------------------
"                   Yank until end of line (instead of entire line)
nnoremap Y          y$

"                   Search for what is highlighted in VISUAL MODE
vnoremap //         y/<C-R>"<CR>

"                   # Comment
vnoremap ,c         ^o^<C-v>I# <ESC>
nnoremap ,c         v^o^<C-v>I# <ESC>j0
"                   % Comment
vnoremap ,%         ^o^<C-v>I% <ESC>
nnoremap ,%         v^o^<C-v>I% <ESC>j0

"                   Uncomment visual selection (Visual, or Visual Line)
"vnoremap ,u         :norm ^x<CR>
"nnoremap ,u         :norm ^x<CR>j0
vnoremap ,u         <C-v>^o^whx
nnoremap ,u         :s:\(^\s*\)\([#%]\s\=\)\(\s*\):\1\3:<CR>:noh<CR>

"                   Insert space below(j) above(k) left(j) right(l) w/o insert
"nnoremap <C-j>      o<ESC>
"nnoremap <C-k>      O<ESC>
nnoremap <C-h>      i <ESC>
nnoremap <C-l>      a <ESC>

"                   Shift lines down (j) or up (k)
vnoremap <C-j>      :m '>+1<CR>gv=gv
vnoremap <C-k>      :m '<-2<CR>gv=gv
"nnoremap <C-j>      :m .+1<CR>==
"nnoremap <C-k>      :m .-2<CR>==
inoremap <C-j>      <ESC>:m .+1<CR>==gi
inoremap <C-k>      <ESC>:m .-2<CR>==gi

"                   Surround the highlighted text with quotes, parens, etc.
vnoremap ,"         c""<ESC>P
vnoremap ,'         c''<ESC>P
vnoremap ,(         c()<ESC>P
vnoremap ,)         c()<ESC>P
vnoremap ,{         c{}<ESC>P
vnoremap ,}         c{}<ESC>P
vnoremap ,[         c[]<ESC>P
vnoremap ,]         c[]<ESC>P
vnoremap ,<         c<><ESC>P
vnoremap ,>         c<><ESC>P

"                   Surround the word with quotes, parens, etc.
nnoremap ,"         viwc""<ESC>P
nnoremap ,'         viwc''<ESC>P
nnoremap ,(         viwc()<ESC>P
nnoremap ,)         viwc()<ESC>P
nnoremap ,{         viwc{}<ESC>P
nnoremap ,}         viwc{}<ESC>P
nnoremap ,[         viwc[]<ESC>P
nnoremap ,]         viwc[]<ESC>P
nnoremap ,<         viwc<><ESC>P
nnoremap ,>         viwc<><ESC>P

"                   Remove surrounding quotes, parens, etc.
nnoremap ,r"        yi"va"p
nnoremap ,r'        yi'va'p
nnoremap ,r(        yi(va(p
nnoremap ,r)        yi)va)p
nnoremap ,r{        yi{va{p
nnoremap ,r}        yi}va}p
nnoremap ,r[        yi[va[p
nnoremap ,r]        yi]va]p
nnoremap ,r<        yi<va<p
nnoremap ,r>        yi>va>p

"                   Type closing quote/paren/etc after typing first one
"inoremap ""         ""<Left>
"inoremap ''         ''<Left>
"inoremap ``         ``<Left>
"inoremap ()         ()<Left>
"inoremap []         []<Left>
"inoremap {}         {}<Left>
"inoremap <>         <><Left>

"                   Move left/right/down/up without leaving insert mode
inoremap <C-h>      <Left>
inoremap <C-l>      <Right>
inoremap <C-j>      <Down>
inoremap <C-k>      <Up>

"                   Scroll up/down one line at a time more easily
nnoremap <C-j>      <C-e>
nnoremap <C-k>      <C-y>

"                   Create a title
nnoremap ,t         A <ESC>I <ESC>:ce<CR>O#<C-o>79a-<ESC>j^h<C-v>g_lygvkpjdd

"                   center on next search item
"nnoremap n          nzz
"nnoremap N          Nzz
nnoremap <silent> n n:set cursorline cursorcolumn<CR>
nnoremap <silent> N N:set cursorline cursorcolumn<CR>

"                   Shortcut to turn off search highlighting
"nnoremap ,n         :noh<CR>
nnoremap ,n         :noh<CR>:set nocursorline nocursorcolumn<CR>
nnoremap <silent> <Leader>c :set cursorline! cursorcolumn!<CR>


"                   press space for code folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" (for the below vnoremap, must have foldmethod=manual)
vnoremap <silent> <Space> zf


"------------------------------- Abbreviations ---------------------------------
" Python, Bash
:ab #w ################################################################################
:ab #- #-------------------------------------------------------------------------------
:ab #_ #_______________________________________________________________________________
:ab #= #===============================================================================
" C, C++
:ab //w ////////////////////////////////////////////////////////////////////////////////
:ab //- //------------------------------------------------------------------------------
:ab //_ //______________________________________________________________________________
:ab //= //==============================================================================
" MATLAB
:ab %w %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:ab %- %-------------------------------------------------------------------------------
:ab %_ %_______________________________________________________________________________
:ab %= %===============================================================================


"--------------------------------- Functions -----------------------------------
"toggle between absolute / relative line numbers
" (number) > (relativenumber) > (nonumber) > (number)
function! NumberToggle()
    if(&number == 1)
        set nonumber
        set relativenumber
    elseif(&relativenumber == 1)
        set nonumber
        set norelativenumber
    else
        set norelativenumber
        set number
    endif
endfunc
nnoremap <silent> <C-n> :call NumberToggle()<cr>

" Be able to use both MANUAL and INDENT foldmethods
augroup vimrc
    " This autocommand sets 'indent' as the fold method before a file is
    " loaded, so that indent-based folds will be defined.
    au BufReadPre * setlocal foldmethod=indent
    " This one allows you to manually create folds while editing.
    " It's executed after the modeline is read, so it won't change the fold
    " method if the modeline set the fold method to something else like 'marker'
    " or 'syntax'
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

" different options for centering serach terms
nnoremap <silent> <F4> :call <SID>SearchMode()<CR>
function s:SearchMode()
    if !exists('s:searchmode') || s:searchmode == 0
        echo 'Search next: scroll hit to middle if not on same page'
        nnoremap <silent> n n:call <SID>MaybeMiddle()<CR>:set cursorline cursorcolumn<CR>
        nnoremap <silent> N N:call <SID>MaybeMiddle()<CR>:set cursorline cursorcolumn<CR>
        let s:searchmode = 1
    elseif s:searchmode == 1
        echo 'Search next: scroll hit to middle'
        "nnoremap n nzz
        "nnoremap N Nzz
        nnoremap <silent> n nzz:set cursorline cursorcolumn<CR>
        nnoremap <silent> N Nzz:set cursorline cursorcolumn<CR>
        let s:searchmode = 2
    else
        echo 'Search next: normal'
        nunmap n
        nunmap N
        nnoremap <silent> n n:set cursorline cursorcolumn<CR>
        nnoremap <silent> N N:set cursorline cursorcolumn<CR>
        let s:searchmode = 0
    endif
endfunction

" If cursor is in first or last line of window, scroll to middle line.
function s:MaybeMiddle()
    if winline() < &so || winline() > winheight(0) - &so
        normal! zz
    endif
endfunction

"================================ ColorScheme ==================================
if $TERM == 'screen'    " get  256 colors to work while in tmux
    set t_Co=256
endif

syntax enable           " Use syntax highlighting

"______________________________________________________________
"......................... gruvbox ............................
    colorscheme gruvbox
    set background=dark
    let g:gruvbox_contrast_dark = 'medium'  " hard, medium, soft
    let g:gruvbox_contrast_light = 'soft'   " hard, medium, soft

"______________________________________________________________
"........................ solarized ...........................
    "colorscheme solarized

    "if !has('gui_running')
    "    " Compatibility for Terminal
    "    let g:solarized_termtrans=1
    "    if (&t_Co >= 256 || $TERM == 'xterm-256color')
    "        " Do nothing, it handles itself.
    "        let g:solarized_termcolors=256
    "    else
    "        " Make Solarized use 16 colors for Terminal support
    "        let g:solarized_termcolors=16
    "    endif
    "endif

    "set background=dark
    "let g:solarized_visibility = "high"
    "let g:solarized_contrast = "high"

    "".......................... colors ............................
    "" change Visual Mode highlighting colors
    "hi Visual ctermbg=Yellow ctermfg=DarkGray
    "" change Search Mode highlighting colors
    "hi Search cterm=None ctermfg=Black ctermbg=LightBlue
    "" change code folding so folded text is not bold or underline
    "hi Folded cterm=None

"______________________________________________________________
"..................... space-vim-dark .........................
    "colorscheme space-vim-dark

    "".......................... colors ............................
    "" change background to black
    "hi Normal ctermbg=None
    "" change Search Mode highlighting colors
    "hi Search cterm=None ctermfg=Black ctermbg=LightGreen
    "" change code folding so folded text is not bold
    "hi Folded cterm=None

"______________________________________________________________
"......................... inkpot .............................
    "colorscheme inkpot

    "" change Search Mode highlighting colors
    "hi Search cterm=None ctermfg=Black
    "" change code folding so folded text is less harsh/bright
    "hi Folded ctermbg=97


"----------------------------- Borrowed Features -------------------------------
if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
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
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif


"-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-
" Uncomment to turn off autoindent
setlocal noautoindent
setlocal nocindent
setlocal nosmartindent
setlocal indentexpr=
"
" (or run this to turn it off for a specific file)
"setl noai nocin nosi inde=
"-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-


"===============================================================================
"                                   PLUGINS
"===============================================================================
"//////////////////////////////// Vundle Setup \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

".....................................................................
" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the 'user/repository' format
"Plugin 'gmarik/vundle'

" We could also add repositories with a '.git' extension
Plugin 'scrooloose/nerdtree.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-python/python-syntax'
Plugin 'morhetz/gruvbox'
"Plugin 'valloric/youcompleteme'

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Tagbar'
".....................................................................

" Now we can turn our filetype functionality back on
filetype plugin indent on
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\////////////////////////////////////////


"----------------------------------- Tagbar ------------------------------------
let g:tagbar_ctags_bin='/usr/local/bin/ctags'   " Proper Ctags locations
let g:tagbar_width = 35                         " Default is 40, seems too wide
let g:tagbar_sort  = 0                          " Do not alpha-sort names
"
"                \t                             Display panel with \+t
noremap <silent> <Leader>t                      :TagbarToggle<CR>


"---------------------------------- NERDTree -----------------------------------
"                \n                             Display NERDTree panel: \+n
noremap <silent> <Leader>n                      :NERDTreeToggle<CR>

" automatically close NERDTree when quitting vim (if it's the only buffer)
autocmd bufenter * if (winnr("$") == 1
            \ && exists("b:NERDTree")
            \ && b:NERDTree.isTabTree()) 
            \| q | endif


"---------------------------------- Airline ------------------------------------
let g:airline_theme = 'gruvbox'                 " luna, solarized, wombat, gruvbox
let g:airline#extensions#tabline#enabled = 1    " Display all buffers
let g:airline#extensions#tabline#fnamemod =':t' " Display just the filename

" Tab navigation
"        \[                                     Previous buffer
nnoremap <leader>[                              :bprevious<CR>

"        \]                                     Next buffer
nnoremap <leader>]                              :bnext<CR>

"        \bq                                    Close current buffer (tab)
nnoremap <leader>bq                             :bn<BAR>bd#<CR>

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


"-------------------------------------------------------------------------------
" Clean up after sourcing ~/.vimrc
:noh
