

" make sure we are on viM, not vi
set nocompatible

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

set mouse=a " enable mouse support, even on terminal

"***************************************************************
"" Editting Settings
"***************************************************************

set backspace=indent,eol,start  " more powerful backspacing

set whichwrap+=[,]  " left/right arrows wrap lines when in insert mode

set keymodel=startsel,stopsel " shift+arrow selection

set clipboard=unnamedplus " use system clipboard

"***************************************************************
"" File loading / saving
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

" Look for 'modeline' vim commands in the first lines of a file
set modeline
set modelines=10

" Do not save backup files.
set nobackup

" Abandoning a buffer (eg. opening a different file) will hide it, instead of closing it
set hidden

"***************************************************************
"" Visual Settings
"***************************************************************
colorscheme evening
syntax on
set ruler
"set number

" Highlight cursor line, color changes on Insert mode
set cursorline
autocmd InsertEnter  * highlight CursorLine   ctermbg=black guibg=#082830
autocmd InsertEnter  * highlight CursorLineNR ctermbg=black guibg=#207878
autocmd InsertLeave  * highlight CursorLine   ctermbg=black guibg=#404040
autocmd InsertLeave  * highlight CursorLineNR ctermbg=black guibg=#585858

if &term =~ "xterm\\|rxvt"
  " use a cyan cursor in insert mode
  let &t_SI = "\<Esc>]12;cyan\x7"
  " use a yellow cursor otherwise
  let &t_EI = "\<Esc>]12;yellow\x7"
  silent !echo -ne "\033]12;yellow\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"

  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif


" Highlight trailing whitespaces; eg:                          
highlight ExtraWhitespace ctermbg=darkgrey guibg=#282828
match ExtraWhitespace /\s\+$/


" open menu on F4
if !has("gui_running")
  :source $VIMRUNTIME/menu.vim
  :set wildmenu
  :set cpoptions-=<
  :set wildcharm=<C-Z>
  :map <F4> :emenu <C-Z>
endif

" when on a suported terminal (lax...), aproximate to full color
if (&term =~ "256color" || &term == 'win32')
  set termguicolors
endif


""------------
"" Status Bar
set laststatus=2
hi NRMColor     guifg=Black   guibg=Gray    ctermbg=46 ctermfg=0
hi INSColor     guifg=Black   guibg=Cyan    ctermbg=51 ctermfg=0
hi RPLColor     guifg=Black   guibg=maroon1 ctermbg=165 ctermfg=0
hi VISColor     guifg=Black   guibg=Orange  ctermbg=202 ctermfg=0
hi StatusLine   guifg=#f0f0f0 guibg=#406070
hi StatusLineNC guifg=#b0b0b0 guibg=#404040

set statusline =\ 
set statusline+=%#NRMColor#%{(mode()=='n')?'\ NRM\ ':''}
set statusline+=%#INSColor#%{(mode()=='i')?'\ INS\ ':''}
set statusline+=%#RPLColor#%{(mode()=='R')?'\ RPL\ ':''}
set statusline+=%#VISColor#%{(mode()=='v')?'\ VIS\ ':''}
set statusline+=%#VISColor#%{(mode()=='vl')?'\ VLN\ ':''}
set statusline+=%#VISColor#%{(mode()=='vb')?'\ VBL\ ':''}
set statusline+=%#VISColor#%{(mode()=='f')?'\ FND\ ':''}
set statusline+=%##%{(mode()=='c')?'\ ...\ ':''}

set statusline +=%##\ %n\ %*            "buffer number
set statusline +=%<%f             "filename
set statusline +=\ %m%*                "modified flag
set statusline +=%=                 "spacer
set statusline +=%{&ff}%*            "file format
set statusline +=%y%*                "file type
set statusline +=%5l%*               "current line
set statusline +=/%L%*               "total lines
set statusline +=%4v\ %*             "virtual column number
set statusline +=0x%04B\ %*          "character under cursor

set statusline +=%#NRMColor#

set showmode! "don't show mode on bottom line, already on status line


"***************************************************************
"" Key Mappings
"***************************************************************

" Cut-Copy-Paste
noremap <C-x> "*y+d
noremap <C-c> "*y+y
noremap <C-v> "+p
noremap <C-u> u
inoremap <C-x> <C-o>"*y+yx
inoremap <C-c> <C-o>"*y+y
inoremap <C-v> <C-o>"+p
inoremap <C-z> <C-o>u


" Emacs-like chords
noremap <C-x><C-f> :e ./
inoremap <C-x><C-f> <C-o>:e ./
noremap <C-x><C-s> :w<CR>
inoremap <C-x><C-s> <C-o>:w<CR>
noremap <C-x><C-c> :confirm q<CR>
inoremap <C-x><C-c> <C-o>:confirm q<CR>
" Workaround for C-x C-c not working
noremap <C-x><C-z> :confirm q<CR>
inoremap <C-x><C-z> <C-o>:confirm q<CR>
noremap <C-x>h ggVG
inoremap <C-x>h <ESC>ggVGi

" Emacs-like navigation/selection
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-k> <C-o>c$
inoremap <C-y> <C-o>p
inoremap <C-s> <C-o>/

noremap <C-a> <Home>
noremap <C-e> <End>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-g> <C-c>

nnoremap <C-a> <Home>
nnoremap <C-e> <End>
nnoremap <C-u> d0
nnoremap <C-k> D
nnoremap <C-y> P<Right>


"inoremap <C-f> <C-o>:grep . 

" Other
noremap <F10> :set invnumber<cr>
inoremap <F10> <C-o>:set invnumber<cr>



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
   autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded ".$MYVIMRC | redraw
  augroup END

endif " has autocmd

"**************************************************************
" Plugins
"**************************************************************
packloadall " load packaged plugins, so we can check for them

if exists(":CtrlP")
  noremap  <C-x>f :CtrlP<cr>
  noremap  <C-x>b :CtrlPBuffer<cr>
  noremap  <C-p>  :CtrlPMixed<cr>
  inoremap <C-x>f <C-o>:CtrlP<cr>
  inoremap <C-x>b <C-o>:CtrlPBuffer<cr>
  inoremap <C-p>  <C-o>:CtrlPMixed<cr>
endif

" vim: set expandtab ts=2
