set nocompatible              " be iMproved, required
filetype off

if empty(glob("~/.vim/autoload/plug.vim"))
    if confirm("~/.vim/autoload/plug.vim is missing.\n" .
        \ "Do you want to install vim-plug from Internets?",
        \ "&Yep\n&Nope", 2) == 1
            execute '!curl --create-dirs -fLo ~/.vim/autoload/plug.vim ' .
                        \ 'https://raw.github.com/junegunn/vim-plug/master/plug.vim'
      echo repeat("x", 50) .
             \ "\n\nDON'T FORGET TO RUN :PlugInstall AFTER RESTARTING VIM\n\n" .
             \ repeat("x", 50) . "\n\n"
    endif
else
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
    " Plug 'SirVer/ultisnips' " using coc-snippets for now
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'ryanoasis/vim-devicons'
    Plug 'kdarkhan/vim-snippets'

    if has('mac')
      Plug '/usr/local/opt/fzf' " default location of fzf installed through brew
    endif
    " uncomment to download fzf from git
    " Plug 'junegunn/fzf', { 'dir': '~/opt/fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim' " should be brew installed on macos
    call plug#end()
endif


" general settings not requiring any plugins
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

set ruler
set showcmd
set linebreak
" set nolist

set laststatus=2

let g:enable_bold_font = 1

" highlight current line
set cursorline

" show whitespace
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

let mapleader = "\<Space>"

nmap <leader>q :q!<CR>
nmap <leader>fm :make<CR>
nnoremap <leader>fj :%!python3 -m json.tool<CR>

"Remove all trailing whitespace
nnoremap <leader>fw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprev<CR>
nmap <leader>bd :bdelete<CR>
nmap <leader>bb :Buffers<CR>

nmap <leader>tn :tabnext<CR>
nmap <leader>tp :tabprev<CR>

nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" enable spell check for latex files
" autocmd FileType tex setlocal spell spelllang=ru_ru complete+=k

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
set keymap=russian-jcukenwin
set iminsert=0
"set keymap=kazakh-jcuken
" set imsearch=0


set modeline
set modelines=1

autocmd FileType json syntax match Comment +\/\/.\+$+


" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/
augroup whitesp
  autocmd!
  autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
augroup END

" nvim specific configs
if exists('&inccommand')
  set inccommand=split
endif

if exists('&jumpoptions')
  set jumpoptions=stack
endif

" if directory with plugins exists, probably plugins are installed
if !empty(glob("~/.vim/plugged/"))

    autocmd ColorScheme * highlight CocHighlightText guifg=#52B2CF
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

    " colorscheme
    if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
      " disable background to use transparency supported by the terminal
      " to get transparent background
      autocmd ColorScheme * highlight Normal guibg=NONE
      " autocmd ColorScheme * highlight NonText guibg=NONE guifg=gray
      autocmd ColorScheme * highlight Whitespace guibg=NONE guifg=#606060
      autocmd ColorScheme * highlight SignColumn guibg=NONE
      autocmd ColorScheme * highlight CocErrorSign guibg=NONE guifg=red

      colorscheme gruvbox
      let g:gitgutter_set_sign_backgrounds = 1
    else
      colorscheme gruvbox
    endif

    " airline setup
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    let g:airline_powerline_fonts = 1
    " let g:airline#extensions#tabline#close_symbol = '-'
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

    " nerdtree setup
    nmap <leader>ft :NERDTreeToggle<CR>
    nmap <leader>ff :NERDTreeFind<CR>

    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    autocmd StdinReadPre * let s:std_in=1
    let NERDTreeRespectWildIgnore=1
    let NERDTreeMinimalUI=1
    let g:netrw_liststyle = 3
    let g:netrw_banner = 0

    " autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

    " coc.nvim setup
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
    " imap <C-l> <Plug>(coc-snippets-expand)

    " Use <C-j> for select text for visual placeholder of snippet.
    vmap <C-j> <Plug>(coc-snippets-select)

    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<c-j>'

    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<c-k>'

    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <C-j> <Plug>(coc-snippets-expand)

    " use <tab> for trigger completion and navigate to the next complete item
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    inoremap <silent><expr> <Tab>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<Tab>" :
          \ coc#refresh()

    inoremap <silent><expr> <S-Tab>
          \ pumvisible() ? "\<C-p>" :"\<C-d>"

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


    " Remap for rename current word
    nmap <leader>lr <Plug>(coc-rename)

    " Remap for format selected region
    xmap <leader>lf  <Plug>(coc-format-selected)
    nmap <leader>lf  <Plug>(coc-format-selected)

    nmap <leader>lal  <Plug>(coc-codelens-action)

    augroup lsp
      autocmd!
      " Highlight symbol under cursor on CursorHold
      autocmd CursorHold * silent call CocActionAsync('highlight')

      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    " xmap <leader>a  <Plug>(coc-codeaction-selected)
    " nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap for do codeAction of current line
    nmap <leader>lac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>laf  <Plug>(coc-fix-current)

    nmap <leader>lar  <Plug>(coc-refactor)

    " organize imports
    nmap <leader>lao  :call CocAction('runCommand', 'editor.action.organizeImport')<cr>

    " function text object support
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " class text object support
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')

    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)


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
    " nnoremap <silent> <leader>lr  :<C-u>CocListResume<CR>

    nnoremap <silent> <leader>lh  :<C-u>CocCommand clangd.switchSourceHeader<CR>

    nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1, 5) : "\<C-f>"
    nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0, 5) : "\<C-b>"
    inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 5)\<cr>" : "\<Right>"
    inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 5)\<cr>" : "\<Left>"

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


    let g:gruvbox_sign_column="bg0"
    let g:rainbow_active = 1
    let g:UltiSnipsExpandTrigger = "<nop>"
    let g:UltiSnipsJumpForwardTrigger="<c-n>"
    let g:UltiSnipsJumpBackwardTrigger="<c-p>"
    " let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/vim-snippets/UltiSnips']
    " let g:UltiSnipsEnableSnipMate = 0

    let g:sneak#use_ic_scs = 1

    nmap <leader>gb :Gblame<CR>
    nmap <leader>gs :Gstatus<CR>
    nmap <leader>gc :Gcommit -v<CR>
    nmap <leader>ga :Git add -p<CR>
    nmap <leader>gm :Gcommit --amend<CR>
    nmap <leader>gp :Gpush<CR>
    nmap <leader>gdd :Gdiff<CR>
    nmap <leader>gdu :diffupdate<CR>
    nmap <leader>gdp :diffput<CR>
    nmap <leader>gdg :diffget<CR>
    nmap <leader>gw :Gwrite<CR>
    nmap <leader>gr :Gread<CR>

    nnoremap <expr> <C-P> (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<CR>"
endif
