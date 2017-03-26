
" Author: Brian (xangelux) Martínez
" Description: Configuration file for nvim
" Contact: xangelux at gmail dot com

" Prelude {{{
  scriptencoding 'utf-8'
  autocmd! bufwritepost init.vim source %
  autocmd FocusLost * :silent! wall
  autocmd VimResized * :wincmd =
  set path+=** " to use find on files
  set fileencoding=utf-8
  set termencoding=utf-8
  let mapleader=","
  set spell spelllang=es_mx,en
  imap kj <ESC>
  imap Kj <ESC>
  imap KJ <ESC>
  nmap <C-o> i<CR><Esc>
  nnoremap <leader>W mz:%s/\s\+$//<CR>:let @/=''<CR>`z
  nnoremap <leader><Space> :noh<CR>
  command! W w
  command! Q q
  cmap wq w
  command! Qa qa
  command! QA qa
  set backupdir=$HOME/.config/nvim/temp/backup/
  set directory=$HOME/.config/nvim/temp/swap/
  set viewdir=$HOME/.config/nvim/temp/view/
  set undodir=$HOME/.config/nvim/temp/undo/
  set backup
  set noswapfile
  set undofile
  " This option should be after nocompatible
  " '50       -> Save 50 marks
  " n$HOME... -> Where the viminfo file will be saved
  set viminfo='50,<800,/50,h,n$HOME/.config/nvim/temp/viminfo " This line can cause errors in nvim
  if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
  endif
  if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
  endif
  if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
  endif
  if !isdirectory(expand(&viewdir))
    call mkdir(expand(&viewdir), "p")
  endif
  set autowrite
  set history=1000
  set timeoutlen=300
  set clipboard+=unnamed
  set autoread
  set viewoptions=folds,options,cursor,unix,slash " For mkview
  autocmd filetype crontab setlocal nobackup nowritebackup " So it works with crontab
" }}}

" Visual {{{
  set number
  set relativenumber
  syntax on
  set synmaxcol=200
  set list
  set listchars=tab:▸\ ,trail:·,eol:¬,extends:»,precedes:«,nbsp:+
  set colorcolumn=81
  set fillchars=diff:⣿,vert:│
  set showbreak=↪
  set cursorline
  set wrap
  set nrformats-=octal
  set encoding=utf-8
  set incsearch
  set showcmd
  set laststatus=2
  set showmode
  set lazyredraw
  set diffopt+=iwhite,vertical
  set hlsearch
  set ignorecase
  set smartcase
  set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
  set ruler " Line and column number of the cursor position
  set guioptions+=aceLlRrb " Need to add LlRrb to remove it
  " a: Selection is available to be pasted on the system and is yanked to "* reg
  " c: Console dialogs instead of popups
  " e: Show tabline
  set guioptions-=LlRrb
  set scrolloff=3
  set sidescroll=1
  set sidescrolloff=6
  set foldlevelstart=0
  set textwidth=80
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Set the cursor as a pipe when in insert mode
  " let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " This is ignored if termguicolors is used

  "
  " Formatting options:
  "
  " q Allow formatting of comments using gq
  " r Automatically insert the current comment leader after new line
  " n When formatting text, recognize numbered lists
  " l Long lines are not broken in insert mode
  " 2 When formatting text, use the indent of the second line of a paragraph
  "   for the rest of the paragraph
  " j Where it makes sense, remove a comment leader when joining lines
  " t Auto-wrap text using textwith
  " c Auto-wrap comments using textwidth, inserting the current comment leader
  "   automatically.
  " o Automatically insert the current commen leader after hitting o or O
  " v Only break a line at a blank char
  "

  set formatoptions=qrnl2jtcov

" }}}

" Indentation {{{
  set autoindent " Copy indent in new line
  set smartindent " New indent level if needed
  set expandtab
  set softtabstop=2
  set smarttab
  set tabstop=2
  set shiftwidth=2 " Width to indent for >> and << operators
  set backspace=indent,eol,start
  set shiftround
"}}}

" Folds {{{
  nnoremap <Space> za
  vnoremap <Space> za
  augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
  augroup END
" }}}

" Navigation {{{
  nmap <C-j> <C-w>j
  nmap <C-k> <C-w>k
  nmap <C-l> <C-w>l
  nmap <C-h> <C-w>h
  " Disabling keys
  nmap <Up> <NOP>
  nmap <Down> <NOP>
  nmap <Left> <NOP>
  nmap <Right> <NOP>
" }}}

" Plugins {{{
    call plug#begin('~/.config/nvim/plugins')

    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'

    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat' " To repeat things that plugins do
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-rvm'
    Plug 'tpope/vim-commentary' " Comment text objects
    Plug 'tpope/vim-jdaddy' " Json manupulation

    Plug 'tomasr/molokai'
    Plug 'junegunn/vim-easy-align'
    Plug 'sjl/gundo.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'rstacruz/sparkup' " Snnippet
    Plug 'geoffharcourt/vim-matchit' " Match closing whatever with %
    Plug 'vim-scripts/ruby-matchit'
    Plug 'vim-scripts/autoclose'
    Plug 'mileszs/ack.vim'
    Plug 'sheerun/vim-polyglot' " Most programming languages support
    Plug 'mtth/scratch.vim' " Scratch buffer
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin' " See git changes in NERDTree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " NERDTRee filetype icons
    Plug 'ryanoasis/vim-devicons' " Icons required by ^
    Plug 'andreshazard/vim-logreview' " Log reviewer
    Plug 'vim-airline/vim-airline' " Powerline for vim
    Plug 'vim-airline/vim-airline-themes'
    call plug#end()

  filetype plugin indent on

" }}}

" Plugin Configs {{{
  " Denite Configurations {{{
    nnoremap <leader>f :Denite -vertical-preview file_rec <CR>
    nnoremap <leader>b :Denite buffer<CR>
    nnoremap <leader>/ :Denite grep:./<CR>
    call denite#custom#source(
          \ 'file_rec', 'matchers', ['matcher_regexp'])
    call denite#custom#var('grep', 'command', ['ack'])
    call denite#custom#var('grep', 'default_opts',
          \ ['--ackrc', $HOME.'/.ackrc', '-H',
          \ '--nopager', '--nocolor', '--nogroup', '--column'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--match'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])

    call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
          \ [ '.git/', '.ropeproject/', '__pycache__/',
          \ '*cache*', '*vendor*', '*.vagrant*', '*.tmp*',
          \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
    let g:denite_source_history_yank_enable=1
    nnoremap <leader>y :Denite history/yank<CR>
    let g:denite_redraw_hold_candidates = 50000
  " }}}
  " Autocomplete options {{{
    set complete=.,w,b,u,t
    set completeopt=longest,menuone,preview
    " Ignore directories and files
    set wildignore+=*.DS_Store
    set wildignore+=*/_build**
    set wildignore+=*/.ssh
    set wildignore+=*/.npm
    set wildignore+=*cache/**
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    xmap <C-k> <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
          \ "\<Plug>(neosnippet_expand_or_jump)"
          \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
          \ "\<Plug>(neosnippet_expand_or_jump)"
          \: "\<TAB>"

    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif
  " }}}
  " Colorscheme {{{
    set termguicolors
    set t_Co=256
    set t_AB=^[[48;5;%dm
    set t_AF=^[[38;5;%dm
    colorscheme molokai

    hi clear SpellBad
    hi SpellBad cterm=underline
  " }}}
  " EasyAlign {{{
    vmap <Enter> <Plug>(EasyAlign)
  " }}}
  " IndentLine {{{
    let g:indent_guides_start_level=2
    let g:indent_guides_guide_size=1
    let g:indentLine_char='│'
  " }}}
  " Nerdtree Config {{{
    nnoremap <leader>t :NERDTreeToggle<CR>
    autocmd FileType nerdtree setlocal nolist
  "}}}"
  " Nerdtree git Config {{{
    let g:NERDTreeIndicatorMapCustom = {
          \ "Modified"  : "✹",
          \ "Staged"    : "✚",
          \ "Untracked" : "✭",
          \ "Renamed"   : "➜",
          \ "Unmerged"  : "═",
          \ "Deleted"   : "✖",
          \ "Dirty"     : "✗",
          \ "Clean"     : "✔︎",
          \ "Unknown"   : "?"
          \ }
  " }}}
  " Airline {{{
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
      let g:airline_powerline_fonts = 1
    endif
    let g:airline_left_sep          = '⮀'
    let g:airline_left_alt_sep      = '⮁'
    let g:airline_right_sep         = '⮂'
    let g:airline_right_alt_sep     = '⮃'
    let g:airline_symbols.branch    = '⭠'
    let g:airline_symbols.readonly  = '⭤'
    let g:airline_symbols.linenr    = '⭡'
  " }}}
" }}}"
