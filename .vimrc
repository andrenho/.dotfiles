"
" INITIALIZATION
"

" load vimrc from current directory
set exrc                            " load local .vimrc
set secure                            " protect against malicious local .vimrc


"
" SPECIAL KEYS
"

let mapleader = ","

" changing tabs with ALT+,/.
map  <ESC>, :tabp<CR>
imap <ESC>, <ESC>:tabp<CR>
map  <ESC>. :tabn<CR>
imap <ESC>. <ESC>:tabn<CR>
map  <ESC>[5;3~ :tabp<CR>
imap <ESC>[5;3~ <ESC>:tabp<CR>
map  <ESC>[6;3~ :tabn<CR>
imap <ESC>[6;3~ <ESC>:tabn<CR>

nmap <Tab> :b#<CR>
map <Leader>;   :set hlsearch!<CR>
map <Leader>e   :cl!<CR>
map <Leader>,   :b#<CR>

"
" EDITING
"
set nowrap                                  " by default, don't wrap
set encoding=utf-8                          " default encoding = UTF-8
set autoindent                              " indent mode
set scrolloff=3                             " start to scroll 8 lines away from to or bottom
set ts=2
set sts=2
set sw=2
set expandtab

" jump to last know position when opening a file
autocmd BufReadPost * 
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


"
" SEARCH
"
set hlsearch                                " highlight searches
set incsearch                               " incremental search


"
" STATUS LINE
"
set wildmenu                               " better autocompletion
set wildmode=longest,list:longest
set completeopt=menu,menuone,longest
set fillchars=""                           " no separator characters
set laststatus=2                           " show status line
set ruler                                  " show position in file
set showcmd                                " show command line
set history=100                            " command line history


"
" BUFFERS
"
set hidden


" 
" SYNTAX / INDENTATION
"
filetype plugin indent on               " activate filetype identation
syntax on                               " activate syntax
"colorscheme andredark
"set cursorline                          " highlight current line
set background=dark

" Omni-completion
set omnifunc=syntaxcomplete#Complete
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> j          pumvisible() ? "\<C-n>" : "\j"
inoremap <expr> k          pumvisible() ? "\<C-p>" : "\k"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
set completeopt+=longest,menuone

inoremap <C-Space> <C-x><C-o>
imap <buffer> <Nul> <C-Space>
smap <buffer> <Nul> <C-Space>

" performance
set synmaxcol=2048                      " max syntax column (to avoid hanging for files without enter)
set tabpagemax=100                      " sanity

" 
" KEYBOARD / MOUSE
"
set backspace=indent,eol,start          " how backspace works
if has('mouse')                         " activate mouse
  set mouse=a                            " mouse active for all modes
  set ttymouse=xterm2                     " allow mouse dragging
endif

" smart home
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" movement with wrap
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

" move cursor inside a paragraph
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
"inoremap <Down> <C-o>gj
"inoremap <Up> <C-o>gk

"
" INTERACTION WITH OS AND OTHER APPLICATIONS
"
set t_Co=256                            " 256 colors
set guioptions=                            " no menu bar or buttons in graphic mode
set vb                                  " disable beep
set t_ut=                                " fix background color in tmux
" set ttyfast                            " indicates that we have a fast terminal

" correct CTRL-PGUP/DOWN in rxvt
nmap <ESC>[5^ <C-PageUp>
nmap <ESC>[6^ <C-PageDown>
nmap <ESC><ESC>[5^ <C-PageUp>
nmap <ESC><ESC>[6^ <C-PageDown>
imap <ESC>[5^ <C-PageUp>
imap <ESC>[6^ <C-PageDown>
imap <ESC><ESC>[5^ <C-PageUp>
imap <ESC><ESC>[6^ <C-PageDown>

" faster ESC
set timeoutlen=1000
set ttimeoutlen=0


" 
" FILE SPECIFIC BEHAVIOUR
"

" text
autocmd FileType text setlocal textwidth=78

" TeX
autocmd FileType tex  setlocal wrap lbr textwidth=0 colorcolumn=

" C
let c_hi_identifiers       = 'all'
let c_hi_libs               = ['*'] 
let c_no_curly_error=1

" python
syn keyword Keyword self
let python_highlight_numbers = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1

" rust
filetype on
au BufNewFile,BufRead *.rs set filetype=rust

" typescript
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_quickfix = 1
augroup quickfix
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'vue': ['eslint']
\}
let g:ale_sign_warning = '+'
let g:ale_sign_error = '+'
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
highlight ALEError ctermbg=52
highlight ALEErrorSign ctermbg=52
highlight ALEWarning ctermbg=18
highlight ALEWarningSign ctermbg=18
autocmd FileType qf setlocal wrap

" NERDtree
noremap <F10> <ESC>:NERDTreeToggle<CR>

" fix issue with putty showing help when click inside the window
:noremap <F15> <nop> 
:noremap! <F15> <nop>

