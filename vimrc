

" Do not save backup files.
set nobackup

" Disable --More-- prompt
set nomore

" While searching though a file incrementally highlight matching characters as you type.
set incsearch


" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

set backspace=indent,eol,start  " more powerful backspacing

"***************************************************************
"" Editting Settings
"***************************************************************

" make sure we are on viM, not vi
set nocompatible


"***************************************************************
"" File loading
"***************************************************************


" Automatically start new buffers on INSERT mode
autocmd BufRead,BufNewFile * start


" Autoload plugins on demand when files open
filetype plugin on


" default to UTF-8 with Unix newlines for new files
set fileformat=unix
set fileencoding=utf-8


" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx




"***************************************************************
"" Visual Settings
"***************************************************************
colorscheme evening
syntax on
set ruler
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline
"highlight CursorLine ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
highlight CursorLine ctermbg=black guibg=#282825


"" Use modeline overrides
set modeline
set modelines=10

" open menu on F4
if !has("gui_running")
  :source $VIMRUNTIME/menu.vim 
  :set wildmenu                        
  :set cpoptions-=<
  :set wildcharm=<C-Z>
  :map <F4> :emenu <C-Z>
endif

""------------
"" Status Bar
set laststatus=2
hi NRMColor guifg=Black guibg=Green ctermbg=46 ctermfg=0
hi INSColor guifg=Black guibg=Cyan ctermbg=51 ctermfg=0
hi RPLColor guifg=Black guibg=maroon1 ctermbg=165 ctermfg=0
hi VISColor guifg=Black guibg=Orange ctermbg=202 ctermfg=0

set statusline =%#NRMColor#%{(mode()=='n')?'\ \ NRM\ ':''}
set statusline+=%#INSColor#%{(mode()=='i')?'\ \ INS\ ':''}
set statusline+=%#RPLColor#%{(mode()=='R')?'\ \ RPL\ ':''}
set statusline+=%#VISColor#%{(mode()=='v')?'\ \ VIS\ ':''}

set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%4*\ %<%f%*            "filename
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=*                 "spacer
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%1*%5l%*               "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor


set showmode! "don't show mode on bottom line, already on to status line


"

"***************************************************************
"" Key Mappins
"***************************************************************

" Cut-Copy-Paste
noremap <C-x> "*d
noremap <C-c> "*y
noremap <C-v> "*p
inoremap <C-x> <C-o>"*yx
inoremap <C-c> <C-o>"*y
inoremap <C-v> <C-o>"*p



" Emacs-like chords
noremap <C-x><C-f> <Esc>:e ./
noremap <C-x><C-f> <Esc>:e ./
noremap <C-x><C-s> <Esc>:w<CR>
inoremap <C-x><C-s> <Esc>:w<CR>a
noremap <C-x><C-c> <Esc>:confirm q<CR>
inoremap <C-x><C-c> <Esc>:confirm q<CR>a
" Workaround for C-x C-c not working
noremap <C-x><C-z> <Esc>:confirm q<CR>a
inoremap <C-x><C-z> <Esc>:confirm q<CR>a

" Emacs-like navigation/selection
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-u> <Esc>d0xi
inoremap <C-k> <Right><Esc>d$a
inoremap <C-y> <Esc>pa

noremap <C-a> <Home>
noremap <C-e> <End>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>

nnoremap <C-a> <Home>
nnoremap <C-e> <End>
nnoremap <C-u> d0
nnoremap <C-k> D
nnoremap <C-y> P<Right>

noremap <CS-f> 

""------------
"" 'Leader' key

"enable an indicator when <leader> is pressed
set showcmd 
let mapleader = ","

map <leader><leader> :ls<CR>:b<Space>
map <leader>n :bnext<cr>
map <leader>p :bprevious<cr>
map <leader>d :bdelete<cr>



"**************************************************************
" Auto Commands
"**************************************************************

if has ('autocmd') " Remain compatible with earlier versions

" source $MYVIMRC when modified
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
"    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END

endif " has autocmd

"**************************************************************
" Plugins
"**************************************************************



" Install vim-plug if not found
"if empty(glob($HOME.'/.vim/autoload/plug.vim'))
"  silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"endif



