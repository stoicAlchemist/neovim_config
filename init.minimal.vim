
" Author: Brian(xangelux) Martínez
" Description: Configuration file for nvim
" Contact: xangelux at gmail dot com

" Prelude {{{
  scriptencoding 'utf-8'
  autocmd! bufwritepost init.vim source %
  autocmd FocusLost * :silent! wall
  autocmd VimResized * :wincmd =
  set fileencoding=utf-8
  set termencoding=utf-8
  set spell spelllang=es_mx,en
  imap kj <ESC>
  imap Kj <ESC>
  imap KJ <ESC>
  nnoremap <leader>W mz:let @x=@/<CR>:%s/\s\+$//<CR>:let @/=@x<CR>`z
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

  " VIMINFO to save {{{

    " This option should be after nocompatible
    " '50       -> Save 50 marks
    " n$HOME... -> Where the viminfo file will be saved
    set viminfo='50,<800,/50,h,n$HOME/.config/nvim/temp/viminfo " This line can cause errors in nvim

  "}}}

  " Directory check {{{

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

  "}}}

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
  if !exists('gui_oni')
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
    "set guifont=Anonymice\ Nerd\ Font\ Complete\ Mono:h12
    "set guifont=Dejavu\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h12
  endif
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
  if !exists('gui_oni')
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Set the cursor as a pipe when in insert mode
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " This is ignored if termguicolors is used

    set showmatch   " Show matching parens when closing
    set matchtime=6 " Show for this amount of tenth's of a second

    " tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
    " http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users

    if exists('$TMUX')
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
      let &t_SI = "\<Esc>]50;CursorShape=1\x7"
      let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
  endif

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
  " In insert too
  imap <Up> <NOP>
  imap <Down> <NOP>
  imap <Left> <NOP>
  imap <Right> <NOP>
" }}}

" Plugins {{{
  call plug#begin('~/.config/nvim/plugged')

  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-jdaddy', {'for': 'json'}
  Plug 'tpope/vim-sleuth'   " Switch indent depending on ft
  Plug 'tpope/vim-rvm'
  Plug 'vim-ruby/vim-ruby', {'for': 'ruby'} " Ruby text Objects, motions and indents
  Plug 'vim-scripts/ruby-matchit', {'for': 'ruby'}  " Match the end word to close block
  Plug 'andymass/vim-matchup' " Use % to match unsopported languages like ruby
  Plug 'andreshazard/vim-logreview' " Log reviewer
  Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'mhinz/vim-signify' " Show signs gutter with VCS info
  if !exists('gui_oni')
    Plug 'Raimondi/delimitMate' " Auto-close matching parens
  endif
  Plug 'vim-scripts/AnsiEsc.vim' " Color ANSI escape chars
  Plug 'mileszs/ack.vim' " Add command to use Ack instead of Grep
  Plug 'sheerun/vim-polyglot' " Most programming languages support
  Plug 'Yggdroot/indentLine'  " Show indentation line to guide
  " NERDTree
  Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
  Plug 'Xuyuanp/nerdtree-git-plugin', {'on':  'NERDTreeToggle'}
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight', {'on':  'NERDTreeToggle'}
  Plug 'ryanoasis/vim-devicons', {'on':  'NERDTreeToggle'}

  if !exists('gui_oni')
    Plug 'tomasr/molokai'
    Plug 'morhetz/gruvbox' " Colorscheme
    Plug 'altercation/vim-colors-solarized' " Colorscheme
    Plug 'vim-airline/vim-airline' " Powerline for vim
    Plug 'vim-airline/vim-airline-themes'
  endif

  call plug#end()
  filetype plugin indent on

" }}}

" Plugin Configs {{{
  " EasyAlign {{{
    vmap <Enter> <Plug>(EasyAlign)
  " }}}
  " Autocomplete options {{{
    set complete=.,w,b,u,t
    set completeopt=longest,menuone,preview
    " Ignore directories and files
    set wildignore+=*.DS_Store
    set wildignore+=*/_build**
    set wildignore+=*/.ssh
    set wildignore+=*cache/**
  " }}}
  if !exists('gui_oni')
    " Colorscheme {{{
      set termguicolors
      set t_Co=256
      set t_AB=^[[48;5;%dm
      set t_AF=^[[38;5;%dm
      colorscheme gruvbox
      set background=dark

      hi clear SpellBad
      hi SpellBad cterm=underline
    " }}}
  endif
  " IndentLine {{{
    let g:indent_guides_start_level=2
    let g:indent_guides_guide_size=1
    let g:indentLine_char=''
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
  if !exists('gui_oni')
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
  endif
  " FZF {{{
    nmap <leader>f :Files<CR>
    nmap <leader>b :Buffers<CR>
  "}}}
  if has("unix")
    let s:uname = system("uname -s")
    if match(s:uname, "arwin") && !exists("Ctags")
      command! Ctags execute  "!`brew --prefix`/bin/ctags -R ."
    endif
  endif
" }}}"
