" Configuration file for vim
" Inspired by http://github.com/mbrochh/vim-as-a-python-ide
" See also: http://www.vimbits.com

" Author: Ben Spoor
" Date: 15-jun-2014

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" ------------------------- Colors ---------------------------------------------
syntax on
set colorcolumn=80
set background=dark

" Select colorscheme if present
" Taken from http://stackoverflow.com/questions/5698284
" Nice Wombat colorscheme from http://www.vim.org/scripts/script.php?script_id=2465 
if filereadable( expand("$HOME/.vim/colors/wombat256mod.vim") )
    colorscheme wombat256mod
else
    colorscheme ron
endif

" ------------------------- Interface ------------------------------------------
" Create informative statusbar
" Taken from: http://archive09.linux.com/feature/120126
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set laststatus=2

" Line numbers and length
set number " Line numbers

set nowrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing

" Set font size
" Taken from: http://stackoverflow.com/questions/3316244/set-gvim-font-in-vimrc-file
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monospace\ 9 
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h9:cANSI
  endif
endif

" ------------------------- Editing --------------------------------------------
" Undo history
set history=700
set undolevels=700

" -------------------- Spaces, tabs & indentation ------------------------------
" Spaces instead of Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Easier moving of code blocks
vnoremap < <gv  " Better indentation
vnoremap > >gv  " Better indentation

" ---------------------------- Searching ---------------------------------------
" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Work with very magic regexes always
" meaning everything except a-z, A-Z, _  and 0-9 have to be escaped
nnoremap / /\v
vnoremap / /\v

" Search for visually selected text
" Taken from http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap // y/<c-r>"<cr>

" Clear last search highlighting
" stackoverflow.com/questions/657447
nnoremap <esc> :noh<return><esc>

