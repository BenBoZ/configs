" Configuration file for vim
" Download latest version on http://github.com/BenBoz/configs
" Inspired by http://github.com/mbrochh/vim-as-a-python-ide
" See also: http://www.vimbits.com

" Author: Ben Spoor
" Date: 15-jun-2014

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

:let mapleader = ","
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Fix backspace (stackoverflow question: 11520601)
set backspace=indent,eol,start

" ------------------------- Colors ---------------------------------------------
syntax on
set colorcolumn=80
set background=dark

" Select colorscheme if present
" Taken from http://stackoverflow.com/questions/5698284
" Nice Wombat colorscheme from http://www.vim.org/scripts/script.php?script_id=2465
if filereadable( expand("$HOME/.vim/colors/oceanblack256.vim") )
    colorscheme BusyBee
else
    colorscheme desert
endif

" ------------------------- Interface ------------------------------------------
" Create informative statusbar
" Taken from: http://archive09.linux.com/feature/120126
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

" Remove useless GUI elements
set go-=T " Toolbar
set go-=m " Menu bar
set go-=r " Right hand scrollbar
set go-=l " Left hand scrollbar

" Make them reappear with a toggle key
:nnoremap <leader>m :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<Cr>
:nnoremap <leader>t :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<Cr>
:nnoremap <leader>r :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<Cr>
:nnoremap <leader>l :if &go=~#'l'<Bar>set go-=l<Bar>else<Bar>set go+=l<Bar>endif<Cr>

" Line numbers and length
set number " Line numbers

set nowrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing

" Set font size
" Taken from: http://stackoverflow.com/questions/3316244/set-gvim-font-in-vimrc-file
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ Medium\ 10
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

" Changing case in insert mode
:inoremap <c-up> <esc>viwgUi
:inoremap <c-down> <esc>viwgui

" Comment out a line
autocmd FileType python nnoremap <buffer> <leader>c mmI#`m
autocmd FileType C      nnoremap <buffer> <leader>c mmI//`m
autocmd FileType vim    nnoremap <buffer> <leader>c mmI" `m
autocmd FileType vhdl   nnoremap <buffer> <leader>c mmI-- `m

" Skip through quickfix list
:nnoremap <leader><right> :cn<return>
:nnoremap <leader><left> :cp<return>

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

" Enter newline without entering insert mode
" Taken from http://vim.wikia.com/Insert_newline_without_entering_insert_mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Highlight unwanted spaces and tabs
" Taken from: http://vim.wikia.com/wiki/Highlight_unwanted_spaces
set list listchars=tab:»·,trail:·

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

" Pathogen package manager
" https://github.com/tpope/vim-pathogen
if filereadable( expand("$HOME/.vim/autoload/pathogen.vim") )
    execute pathogen#infect()
endif
