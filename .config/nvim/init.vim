" plugins {{{
call plug#begin('$XDG_DATA_HOME/nvim/plugged')

Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'dylanaraps/wal.vim'


Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'mhartington/oceanic-next'
Plug 'w0ng/vim-hybrid'
Plug '29decibel/codeschool-vim-theme'

Plug 'neovimhaskell/haskell-vim'
call plug#end()
" }}}

" echo ">^.^<"

set autoindent
set encoding=utf-8
set visualbell

filetype on
filetype plugin indent on

set hlsearch

set nowrap

" highlight trailing whitespace {{{
match DiffDelete /\v\s+$/
autocmd BufWinEnter * match DiffDelete /\v\s+$/
autocmd InsertEnter * match DiffDelete /\s\+\%#\@<!$/
autocmd InsertLeave * match DiffDelete /\v\s+$/
autocmd BufWinLeave * call clearmatches()
nnoremap <leader>w <silent>:match DiffDelete /\v\s+$/<cr>
" }}}

" visual {{{
syntax on
set showcmd
" statusline {{{
set statusline=%F
set statusline+=%=
set statusline+=%l/%L\:%v
"}}}
set colorcolumn=80
set number
set relativenumber
set cursorline
set t_Co=256
colorscheme palenight

" Highlight ansi colour escape codes \033[CODEm
au BufRead,BufNewFile * :call matchadd('Special', '\v\\033\[(\d+;?)+m')
" }}}

" language specific {{{
augroup folding
	" fold on syntax
	au FileType tex,go,py setlocal foldmethod=indent
augroup END

augroup latex
	" auto compile latex
	au BufWritePost *.tex :!pdflatex %
augroup END

augroup java
	au FileType java setlocal tabstop=4
	au FileType java setlocal shiftwidth=4
	au FileType java setlocal foldmethod=indent
	au BufWritePost *.java :!javac %
augroup END

augroup haskell
	au FileType haskell setlocal expandtab
	au FileType haskell setlocal tabstop=4
	au FileType haskell setlocal shiftwidth=4
	au FileType haskell setlocal foldmethod=indent
augroup END

augroup python
	" Highlight ansi colour escape codes \033[CODEm
	au BufRead,BufNewFile python :call matchadd('Special', '\v(<=".*?){(\d|\w)*}')
augroup END
" }}}

" general mappings {{{
let mapleader = "\<space>"
" easily acces registres
nnoremap - "
" remap : to <cr> to save a keystroke
nnoremap <cr> :
" use vim "very magic" regex
nnoremap č /\v
nnoremap ć "
inoremap <space><tab> <tab>
"}}}

" vim settings {{{
" editing vim config
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

augroup vim
	" vim foldig
	au FileType vim setlocal foldmethod=marker
augroup END
" }}}

" ignore arrow keys and : {{{
nnoremap : <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
" }}}

" important to make govim work
let g:go_def_mapping_enabled = 0

" COC settings {{{
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

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

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

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" }}}

" {{{ Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
" }}}
