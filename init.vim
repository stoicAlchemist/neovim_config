
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
  if exists('veonim')
    set guifont=DejaVuSansMono\ Nerd\ Font:h16
  endif
  if !exists('veonim')
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
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[38;2;%lu;%lu;%lum"
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
  " Ruby {{{
    Plug 'tpope/vim-rvm'
    Plug 'vim-ruby/vim-ruby', {'for': 'ruby'} " Ruby text Objects, motions and indents
    Plug 'vim-scripts/ruby-matchit', {'for': 'ruby'}  " Match the end word to close block
  " }}}
  Plug 'andymass/vim-matchup' " Use % to match closing pair
  " Elixir {{{
    Plug 'elixir-editors/vim-elixir', {'for': 'elixir.nvim'}
    Plug 'thinca/vim-ref', {'for': 'elixir.nvim'}
    Plug 'awetzel/elixir.nvim', {'do': 'yes \| ./install.sh', 'for': 'elixir'}
  " }}}

  " Go Language {{{
    Plug 'fatih/vim-go'
    au FileType go set noexpandtab
    au FileType go set shiftwidth=4
    au FileType go set softtabstop=4
    au FileType go set tabstop=4
  " }}}
  Plug 'andreshazard/vim-logreview' " Log reviewer
  Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
  Plug 'junegunn/fzf.vim'
  Plug 'pbogut/fzf-mru.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'mhinz/vim-signify' " Show signs gutter with VCS info
  Plug 'Raimondi/delimitMate' " Auto-close matching parens
  Plug 'Yggdroot/indentLine'  " Show indentation line to guide
  Plug 'vim-scripts/AnsiEsc.vim' " Color ANSI escape chars
  Plug 'mileszs/ack.vim' " Add command to use Ack instead of Grep
  Plug 'sheerun/vim-polyglot' " Most programming languages support
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'majutsushi/tagbar' " Generate a tag panel to check structure
  Plug 'sff1019/vim-joker' " Colorscheme
  Plug 'hashivim/vim-terraform' " Terraform syntax and command

  " Syntax highlight {{{
    Plug 'othree/yajs.vim' " Better Syntax highlight for JavaScript
    au FileType jproperties set synmaxcol=500
    Plug 'othree/html5.vim' " Better Syntax for Oceanic Theme
    Plug 'HerringtonDarkholme/yats.vim' " Better Syntax highlight for TypeScript
  " }}}

" Colorschemes {{{
  Plug 'vim-airline/vim-airline' " Powerline for vim
  Plug 'vim-airline/vim-airline-themes'
  Plug 'morhetz/gruvbox' " Colorscheme
  Plug 'ayu-theme/ayu-vim' " Nice dark Color
  Plug 'mhartington/oceanic-next' " Nice Oceanic Color
  Plug 'joshdick/onedark.vim' " Inspired on Atom's colorscheme
  Plug 'altercation/vim-colors-solarized' " This needs some config and linking
" }}}

  " Documentation {{{
    Plug 'rizzatti/dash.vim'
  " }}}

  " NERDTree {{{
    Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
    Plug 'Xuyuanp/nerdtree-git-plugin', {'on':  'NERDTreeToggle'}
    Plug 'vwxyutarooo/nerdtree-devicons-syntax'
    "Plug 'stoicAlchemist/vim-nerdtree-syntax-highlight', {'on':  'NERDTreeToggle'}
    " WARNING: This should be the last plugin loaded
    Plug 'ryanoasis/vim-devicons', {'on':  'NERDTreeToggle'}
  " }}}

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
    set wildignore+=*.DS_Store
    set wildignore+=*/_build**
    set wildignore+=*/.ssh
    set wildignore+=*cache/**
    " let g:deoplete#enable_at_startup = 1
  " }}}
  if !exists('veonim')
    " Colorscheme {{{
      set termguicolors
      set t_Co=256
      set t_AB=^[[48;5;%dm
      set t_AF=^[[38;5;%dm
      " Needs base16 on iterm: https://github.com/chriskempson/base16-iterm2
      "let ayucolor="mirage"
      "colorscheme ayu
      "colorscheme OceanicNext
      if !exists('veonim')
        let g:gruvbox_italic=1
        colorscheme onedark
      endif
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
    let g:NERDTreeWinSize = 50
    let g:NERDTreeQuitOnOpen = 1

    " Disable arrow icons at the left side of folders for NERDTree.
    let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
    let g:WebDevIconsNerdTreeBeforeGlyphPadding = ' '
    let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
    highlight! link NERDTreeFlags NERDTreeDir
    autocmd FileType nerdtree setlocal signcolumn=no
    let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.spec\.ts$'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['^package.json$'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['lock'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['^Jenkinsfile$'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['^Gemfile$'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.ru$'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['^Rakefile$'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['^README\.'] = ''

    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['properties'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tgz'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['erb'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jbuilder'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''

    " To fix spacing problems in NERDTree
    if exists("g:loaded_webdevicons")
      call webdevicons#refresh()
    endif
  "}}}"

  if !exists('veonim')
  " Airline {{{
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
      let g:airline_powerline_fonts = 1
    endif
    " let g:airline_left_sep         = '⮀'
    " let g:airline_left_alt_sep     = '⮁'
    " let g:airline_right_sep        = '⮂'
    " let g:airline_right_alt_sep    = '⮃'
    " let g:airline_symbols.branch   = '⭠'
    " let g:airline_symbols.readonly = '⭤'
    " let g:airline_symbols.linenr   = '⭡'
    let g:airline_detect_spell     = 0 " Don't display spell
    let g:airline#extensions#hunks#enabled = 0 " Don't display the hunks info
    let g:airline_theme='lucius' " I like this theme better
  " }}}
  endif
  " FZF {{{
    if !exists('veonim')
      nmap <leader>f :Files<CR>
      nmap <leader>b :Buffers<CR>
    else
      nmap <leader>f :Veonim files<CR>
      nmap <leader>b :Veonim buffers<CR>
    endif
  "}}}
  if has("unix")
  " Ctags {{{
    let s:uname = system("uname -s")
    if match(s:uname, "arwin") && !exists("Ctags")
      " Exhuberant Ctags must be installed using brew
      command! Ctags execute  "!`brew --prefix`/bin/ctags -R --exclude=@/Users/brianmartinez/.ctagsignore ."
    endif
  " }}}
  endif

  " Elixir {{{
    let g:elixir_maxmenu     = 5
    let g:elixir_docpreview  = 1
    let g:elixir_showerror   = 1
    let g:elixir_autobuild   = 0
    let g:elixir_comp_minlen = 2
    let g:elixir_maxpreviews = 5
  " }}}

  " Ack configs {{{
    if !exists('veonim')
      let g:ackprg = 'rg --vimgrep --smart-case'
    endif
  " }}}

  " Tagbar {{{
    nmap <leader>g :TagbarToggle<CR>
    let g:tagbar_type_typescript = {
          \ 'ctagstype': 'typescript',
          \ 'kinds': [
          \ 'c:classes',
          \ 'n:modules',
          \ 'f:functions',
          \ 'v:variables',
          \ 'v:varlambdas',
          \ 'm:members',
          \ 'i:interfaces',
          \ 'e:enums',
          \ ]
          \ }
  " }}}

  " Coc {{{
    command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
  " }}}
" }}}"

" Project Configurations {{{
  " Angular 2 {{{
    if filereadable('ng-package.json')
      " For the use with angular custom tags
      let g:ale_html_tidy_options='--custom-tags blocklevel'
    endif
  " }}}
" }}}
