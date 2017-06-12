" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
"#----------------------------------------------------#
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
    if(&relativenumber == 1)
        set nonumber
        set norelativenumber
    elseif(&number == 1)
        set relativenumber
        set nonumber
    else 
        set number
    endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

"#____________________________________________________# 
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
"#____________________________________________________# 


if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file
endif

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

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
