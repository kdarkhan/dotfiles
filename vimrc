set nocompatible              " be iMproved, required
filetype off

if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'ervandew/supertab'
Plug 'lervag/vimtex'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'tomtom/tcomment_vim'
Plug 'lazywei/vim-matlab'
" Plugin 'SirVer/ultisnips'
Plug 'editorconfig/editorconfig-vim'
Plug 'luochen1990/rainbow'
" Plugin 'flazz/vim-colorschemes'
" Plugin 'easymotion/vim-easymotion'
" Plugin 'rust-lang/rust.vim'

" On my laptop I have osx and linux dual boot with shared /home (or osx /Users) partitions.
" Since YouCompleteMe uses compiled code, it cannot be used on both machines.
" I use separate directory for each os
if has("unix")
    let s:uname = system("uname -s")
    if s:uname =~ "Darwin"
        " echo 'hello osx'
        Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer', 'dir': '~/.vim/osx-vim-ycm'}
    elseif s:uname =~ "Linux"
        Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang', 'dir': '~/.vim/linux-vim-ycm'}
        " echo 'hello linux'
    endif
endif

call plug#end()


filetype plugin indent on

set number

set encoding=utf-8

"set tabstop=4 shiftwidth=4
" set expandtab
set backspace=indent,eol,start

set hlsearch
set incsearch
set ignorecase
set smartcase
syntax on
set mouse=a

set ruler
set showcmd
set linebreak
" set nolist

if exists('$DISPLAY')
    " running under X11
    let g:airline_theme = "ubaryd"
else
    " running on console
endif

"let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts = 1
" let g:airline_theme='bubblegum'

" set colorscheme and airline theme
" set background=dark
" colorscheme hybrid_material
" colorscheme codeschool
" set background=dark
" let g:solarized_termcolors=16 "this is what fixed it for me
" colorscheme solarized

let g:enable_bold_font = 1

" highlight current line
set cursorline

" show trainling whitespace
" set listchars=tab:▸\ ,eol:¬,space:·
set listchars=tab:▸\ ,space:·
set list

" ================ Completion =======================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set iskeyword-=_

" Include '.' for class member, ',' for separator, ';' end-statement,
" and <[< bracket starts and "'` quotes.
let g:camelchar = "A-Z0-9.,;:{([`'\""

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|target\|dist'

if has('gui_running')
  set guioptions-=T  " no toolbar
  set lines=40 columns=148 linespace=0
  set background=dark
  " colorscheme solarized
  let g:airline_theme = "ubaryd"
  colorscheme hybrid_reverse
  " colorscheme hybrid_material
  if has('gui_macvim')
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h14
  else
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 14
  endif
endif



" move to dispay line
" nnoremap k gk
" nnoremap gk k
" nnoremap j gj
" nnoremap gj j
" nnoremap 0 g0
" nnoremap g0 0
" nnoremap $ g$
" nnoremap g$ $

let g:ycm_python_binary_path = '/usr/bin/python3'


let g:sneak#streak = 1

"let mapleader = ","
let mapleader = "\<Space>"

nmap <leader>ft :NERDTreeToggle<cr>
nmap <leader>la :VimtexCompile<cr>

" enable spell check for latex files
autocmd FileType tex setlocal spell spelllang=en_us complete+=k

autocmd Filetype html setlocal tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal tabstop=4 shiftwidth=4
autocmd Filetype scala setlocal tabstop=2 shiftwidth=2
autocmd Filetype coffee setlocal tabstop=2 shiftwidth=2
autocmd Filetype python setlocal tabstop=4 shiftwidth=4

" disable edits on readonly file
autocmd BufRead * let &l:modifiable = !&readonly

" remember cursor position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Cyrillic support
"set keymap=russian-jcuken
set keymap=kazakh-jcuken
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan


set modeline
set modelines=1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" let g:UltiSnipsListSnippets = "<c-tab>"

" UltiSnips triggering
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:tex_conceal = ""
let g:tex_fast = "bMpr"
let g:tex_fold_enabled=0
let g:rainbow_active = 1

packadd! matchit

