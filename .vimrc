set nocompatible              " be iMproved, required
filetype off

if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl --create-dirs -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'tomtom/tcomment_vim'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
Plug 'morhetz/gruvbox'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

if has('mac')
  Plug '/usr/local/opt/fzf' " default location of fzf installed through brew
endif
" uncomment to download fzf
" Plug 'junegunn/fzf', { 'dir': '~/opt/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " should be brew installed on macos
call plug#end()

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

set number

set encoding=utf-8

" set tabstop=2
set tabstop=4 shiftwidth=4
" set expandtab
set backspace=indent,eol,start

set hlsearch
set incsearch
set ignorecase
set smartcase
syntax on
set mouse=a

if exists('&inccommand')
  set inccommand=split
endif

if exists('&jumpoptions')
  set jumpoptions=stack
endif

set ruler
set showcmd
set linebreak
" set nolist

" airline setup
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
set laststatus=2
let g:airline_powerline_fonts = 1
" let g:airline_theme='bubblegum'
let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }

let g:enable_bold_font = 1

" highlight current line
set cursorline

" show whitespace
" set listchars=tab:▸\ ,eol:¬,space:·
set listchars=tab:▸\ ,space:·
set list

" highlight trailing whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

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

let mapleader = "\<Space>"

nmap <leader>ft :NERDTreeToggle<CR>
nmap <leader>ff :NERDTreeFind<CR>
nmap <leader>q :q!<CR>
nmap <leader>fm :make<CR>
nnoremap <leader>fj :%!python3 -m json.tool<CR>

"Remove all trailing whitespace
nnoremap <leader>tw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprev<CR>
nmap <leader>bd :bdelete<CR>
nmap <leader>bb :Buffers<CR>

nmap <leader>tn :tabnext<CR>
nmap <leader>tp :tabprev<CR>

nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit -v<CR>
nmap <leader>ga :Git add -p<CR>
nmap <leader>gm :Gcommit --amend<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gw :Gwrite<CR>

nnoremap <C-P> :Files<CR>

" enable spell check for latex files
autocmd FileType tex setlocal spell spelllang=ru_ru complete+=k

" indent settings are handled by editorconfig now
" autocmd Filetype html setlocal tabstop=2 shiftwidth=2

" disable edits on readonly file
autocmd BufRead * let &l:modifiable = !&readonly

" remember cursor position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Cyrillic support
set keymap=russian-jcuken
"set keymap=kazakh-jcuken

set iminsert=0
set imsearch=0
" highlight lCursor guifg=NONE guibg=Cyan


set modeline
set modelines=1

let g:rainbow_active = 1

let g:netrw_liststyle = 3
let g:netrw_banner = 0

let g:UltiSnipsExpandTrigger = "<nop>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

set termguicolors
let g:gruvbox_sign_column="bg0"
colorscheme gruvbox
"highlight SignColumn ctermbg=black
"highlight SignColumn ctermfg=223 ctermbg=235 guifg=#ebdbb2 guibg=#282828
"highlight SignColumn ctermbg=235 guibg=#282828
"hi Search cterm=NONE ctermfg=yellow ctermbg=grey
" colorscheme peachpuff

" Configuration for vim-scala
"au BufRead,BufNewFile *.sbt set filetype=scala
autocmd FileType json syntax match Comment +\/\/.\+$+

" NERDTree setup
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
let NERDTreeRespectWildIgnore=1
let NERDTreeMinimalUI=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" COC configs
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


" SNIPPETS
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
hi CocHighlightText cterm=NONE ctermfg=yellow ctermbg=grey

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>ld  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>le  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>lc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>lo  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>ls  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>lj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>lk  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>lr  :<C-u>CocListResume<CR>

nnoremap <silent> <leader>lh  :<C-u>CocCommand clangd.switchSourceHeader<CR>

" Sync nerdtree window when switching files
function s:sync_nerd_tree()
    if &modifiable && !&diff && exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1
        let buf = expand('%:p')
        let root = g:NERDTree.ForCurrentTab().getRoot().path.str()
        " ensure that the new file is not outside of root
        " which is problematic for my setup because NERDTreeFind switches root
        " to parent to include outside files.
        if strlen(buf) > 0 && stridx(buf, root) == 0
          try
            NERDTreeFind
            normal! zz
            if bufname('%') =~# 'NERD_tree'
              wincmd p
            endif
          endtry
        endif
    endif
endfunction

autocmd BufEnter * call s:sync_nerd_tree()