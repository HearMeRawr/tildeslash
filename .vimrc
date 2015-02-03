"""Yoplitein's simple and sweet .vimrc

""general stuff
"disable Vi compatability; enable syntax highlight,
"spaces instead of tabs, line/column numbers,
"highlighted searches and line numbers
"all that good stuff, basically
set nocompatible
syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ruler
set hlsearch
set nu
set ignorecase
set smartcase

"fix for function key weirdness under screen
if match($TERM, "screen")!=-1
    set term=xterm
endif

""binds and other automation
nnoremap <F1> :noh<return><esc>
nnoremap <F2> :set nonumber!<CR>
nnoremap <F5> :undo<CR>
nnoremap <F6> :redo<CR>
nnoremap n :next<CR>
nnoremap b :previous<CR>

"sets F3 to toggle pasting mode
set pastetoggle=<F3>

"clears entire buffer
command ClearPaste call feedkeys("G\<End>vggd")
nnoremap <F4> :ClearPaste<CR>

"move lines up and down
command MoveLineUp call feedkeys(line(".")==1?"":"ddkkp")
command MoveLineDown call feedkeys("ddp")

nnoremap w :MoveLineUp<CR>
nnoremap s :MoveLineDown<CR>

"don't delete blank lines
inoremap <CR> <CR>x<BS>

"goppend made me do it
nnoremap x :echo "hi goppend"<CR>

""highlighting settings
"change comments to a light blue (courtesy of Kev)
hi comment ctermfg=blue

""Enable automatic indentation
"stolen from somewhere, I don't remember where though
"probably Stack Overflow
if has("autocmd")
  filetype plugin indent on
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  "Disable automatic comment insertion on <CR>
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
else
  set autoindent
endif
