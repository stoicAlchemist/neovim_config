
" Author: Brian(xangelux) Martínez
" Description: Configuration file for nvim
" Contact: xangelux at gmail dot com

" Telling VIM that the following lines are to be converted to 'utf-8' encoding.
" This is used for when strings should be interpreted as weird encoding. With
" empty arguments, it resets to 'do not convert'
scriptencoding 'utf-8'

" Prelude {{{
  " When this init.vim file is saved, reload configs. This might cause colors
  " glitches or issues with plugins like Airbrake.
  autocmd! bufwritepost init.vim source %
  autocmd VimResized * :wincmd =
  " Content encoding for the opened buffer
  set fileencoding=utf-8
  " Content encoding for the opened terminal
  set termencoding=utf-8
  " Spell languages in order of use
  set spell spelllang=es_mx,en
  " It's easier to hit kj to Escape
  imap kj <ESC>
  imap Kj <ESC>
  imap KJ <ESC>
  " Custom mapping to delete all trailing spaces
  nnoremap <leader>W mz:let @x=@/<CR>:%s/\s\+$//<CR>:let @/=@x<CR>`z
  " As highlight search is set, this will turn highlight off with a mapping
  nnoremap <leader><Space> :noh<CR>
  " Fat/dumb fingers, none have original functionality
  command! W w
  command! Q q
  cmap wq w
  command! Qa qa
  command! QA qa
  " Patch mode is used to generate .orig files, this files are saved in backup directory
  set backupdir=$HOME/.config/nvim/temp/backup/
  " Mkview is used to 'save' a view of the current window and it's saved here
  set viewdir=$HOME/.config/nvim/temp/view/
  " Undo files are created to have 'infinite' undo
  set undodir=$HOME/.config/nvim/temp/undo/
  " Turn on backup, turn off swap files and turn on 'infinite undo'
  set backup
  set noswapfile
  set undofile

  " VIMINFO to save {{{

    " This option should be after nocompatible (default nocompatible in NVIM)
    " '50       -> Save 50 marks
    " n$HOME... -> Where the viminfo file will be saved
    set viminfo='50,<800,/50,h,n$HOME/.config/nvim/temp/viminfo " This line can cause errors in nvim

  "}}}

  " Directories check {{{

    if !isdirectory(expand(&backupdir))
      call mkdir(expand(&backupdir), "p")
    endif
    if !isdirectory(expand(&undodir))
      call mkdir(expand(&undodir), "p")
    endif
    if !isdirectory(expand(&viewdir))
      call mkdir(expand(&viewdir), "p")
    endif

  "}}}

  " Save buffer to file for each buffer action (next, rewind, last, first, etc.)
  " All this are taking into account you are using the argument list
  set autowrite
  " Max commands to remember in the history
  set history=1000
  " Milliseconds to wait for a key sequence to complete
  set timeoutlen=300
  " Always use the unnamed registry when performing operations like delete,
  " yank, change etc. The unnamed registry can be used by external tools to
  " copy/paste between the OS clipboard and Vim's registry
  " - pbcopy, pbpaste (macOS)
  " - xclip (if $DISPLAY is set)
  " - tmux
  " - g:clipboard
  set clipboard+=unnamed
  " Detect when a file is being changed while a it's buffer is open and reload
  " it if confirmed
  set autoread
  " Stuff to save when creating a view with mkview
  set viewoptions=folds,options,cursor,unix,slash
  " So crontab works properly, disable backup and writebackup
  autocmd filetype crontab setlocal nobackup nowritebackup
" }}}

" Visual {{{

  set number
  set relativenumber
  syntax on
  " This might need editing for horrible project's file
  set synmaxcol=200
  " Display non-visible characters like end of line, tabs, trailing spaces etc.
  set list
  " Configure how the non-visible chars will look like
  set listchars=tab:▸\ ,trail:·,eol:¬,extends:»,precedes:«,nbsp:+
  " Mark column for max char length reference
  set colorcolumn=81
  " How filler chars will be displayed
  set fillchars=diff:⣿,vert:│
  " How to show a line has been broken in two
  set showbreak=↪
  " Highlight the current line
  set cursorline
  " Wrap lines when they are too long
  set wrap
  " Format to use when <C-a> and <C-x> are used
  set nrformats-=octal
  " File encoding used for RPC communication
  set encoding=utf-8
  " Search as I type
  set incsearch
  " Show the keys typed when command is being performed
  set showcmd
  " Show status line always (option 2)
  set laststatus=2
  " Show which mode I'm currently in
  set showmode
  " As it's name says, redraw lazily
  set lazyredraw
  " Options for diff:
  " - iwhite: Ignore changes of white space
  " - vertical: Start diff mode in vertical splits unless other specified
  set diffopt+=iwhite,vertical
  " Highlight last searched occurrence
  set hlsearch
  " Ignore case when searching or a pattern
  set ignorecase
  " If upper case used, then be case sensitive
  set smartcase
  set ruler " Line and column number of the cursor position
  set guioptions+=aceLlRrb " Need to add LlRrb to remove it
  " a: Selection is available to be pasted on the system and is yanked to "* reg
  " c: Console dialogs instead of popups
  " e: Show tabline
  set guioptions-=LlRrb
  " Start scrolling 3 lines before reaching the screen edge
  set scrolloff=3
  " Minimum chars off the screen to start scrolling (when wrap is off)
  set sidescroll=1
  " Start scrolling vertically 6 char before reaching screen edge
  set sidescrolloff=6
  " As the name suggests make fold-able since level 0
  set foldlevelstart=0
  " Where to consider 'smart line break' when writing long lines
  set textwidth=80
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " This is ignored if termguicolors is used

  set showmatch   " Show matching parens when closing
  set matchtime=10 " Show for this amount of tenth of a second

  " tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
  " http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users

  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
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
  set expandtab " Don't use tabs, expand to spaces
  set softtabstop=2 " How many chars to show a 'tab' as
  set smarttab " When deleting, figure out if it's a fake 'tab' and delete accordingly
  set tabstop=2 " How many spaces to insert when using Tab
  set shiftwidth=2 " Width to indent for >> and << operators
  " What to allow to 'backspace' delete
  set backspace=indent,eol,start
  " Round indentation to fit expanded tabs
  set shiftround
"}}}

" Folds {{{
  " Toggle folding in normal mode
  nnoremap <Space> za
  " Toggle folding in visual mode
  vnoremap <Space> za

  " Fold by indentation
  set foldmethod=indent

  " If file type is VIM
  augroup ft_vim
    " Start autocommand
    au!
    " If it's a vim file, set window fold method to marker ({{{ and }}} are used
    " as markers to start and end the fold)
    au FileType vim setlocal foldmethod=marker
    " If it's a help buffer window, text width should be 78 for easy reading
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

  Plug 'tpope/vim-fugitive' " Git interaction Plugin
  Plug 'tpope/vim-repeat'   " To use the '.' command on Plugins such as Surround
  Plug 'tpope/vim-surround' " Surround stuff with specific chars or tags
  Plug 'tpope/vim-endwise' " Help adding the correct 'closing' to a language construct
  Plug 'tpope/vim-commentary' " Toggle comment on code depending on language
  Plug 'tpope/vim-jdaddy', {'for': 'json'} " Provides json text object as j and
  " adds gqaj to pretty print said object and gwaj to take the json object on the
  " clipboard and extends it under the cursor
  Plug 'tpope/vim-sleuth'   " Switch indent and tab sizes depending on ft
  " Ruby {{{
    Plug 'tpope/vim-rails'
    Plug 'vim-ruby/vim-ruby', {'for': 'ruby'} " Ruby text Objects, motions and indents
    " Plug 'vim-scripts/ruby-matchit', {'for': 'ruby'}  " Match the end word to close block
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
  Plug 'andreshazard/vim-logreview' " Log reviewer, colors and format
  Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'} " fuzzy finder
  Plug 'junegunn/fzf.vim' " Plugin to use fzf
  Plug 'pbogut/fzf-mru.vim' " Use fzf to filter mru files
  Plug 'mhinz/vim-signify' " Show signs gutter with VCS info
  Plug 'Raimondi/delimitMate' " Auto-close matching parens, not perfect
  Plug 'Yggdroot/indentLine'  " Show indentation line to guide
  Plug 'vim-scripts/AnsiEsc.vim' " Color ANSI escape chars
  Plug 'mileszs/ack.vim' " Add command to use Ack instead of Grep and load window with options
  Plug 'sheerun/vim-polyglot' " Most programming languages support
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP client for autocomplete and such
  Plug 'hashivim/vim-terraform' " Terraform syntax and command

  " Syntax highlight {{{
    Plug 'othree/yajs.vim' " Better Syntax highlight for JavaScript
    Plug 'MaxMEllon/vim-jsx-pretty' " Help JSx syntax
    au FileType jproperties set synmaxcol=500
    Plug 'othree/html5.vim' " Better Syntax for Oceanic Theme
    Plug 'HerringtonDarkholme/yats.vim' " Better Syntax highlight for TypeScript
  " }}}

" Colorschemes {{{
  Plug 'vim-airline/vim-airline' " Powerline for Vim
  Plug 'vim-airline/vim-airline-themes'
  Plug 'morhetz/gruvbox' " Colorscheme
  Plug 'drewtempelmeyer/palenight.vim' " Colorscheme
  Plug 'joshdick/onedark.vim' " Inspired on Atom's colorscheme
  Plug 'rakr/vim-one'
  Plug 'embark-theme/vim'
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
  " Set when auto-completing is triggered:
  " - . => Scan current buffer
  " - w => Scan buffers in other windows
  " - b => Scan all buffers on the list
  " - u => Scan buffers that have been unloaded from the buffers list
  " - t => Tag completion
  " - i => Scan current and included files, if includes polute your list, remove
  "   it
    set complete=.,w,b,u,t,i
    " Options for insert mode completion:
    " - longest => Only insert the longest common text of matches
    " - menuone => Use popup menu also when there is only one match
    " - preview => Show extra information about the current completion
    set completeopt=longest,menuone,preview
    " Ignore this matches on lookup for completion
    set wildignore+=*.DS_Store
    set wildignore+=*/_build**
    set wildignore+=*/.ssh
    set wildignore+=*cache/**
    set wildignore+=*log/*
  " }}}
  " Colorscheme {{{
    set termguicolors
    set t_Co=256
    set t_AB=^[[48;5;%dm
    set t_AF=^[[38;5;%dm
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

    " Needs base16 on iterm: https://github.com/chriskempson/base16-iterm2
    " colorscheme pleasant
    colorscheme one
    let g:pleasant_italic=1
    let g:gruvbox_italic=1
    let g:embark_terminal_italics=1
    set background=dark

    " Clear bad spelling style
    " hi clear SpellBad
    " Show bad spelled words with underline
    hi SpellBad cterm=underline
  " }}}

  " IndentLine {{{
    let g:indent_guides_start_level=2
    let g:indent_guides_guide_size=1
    let g:indentLine_char=''
  " }}}

  " Nerdtree Config {{{
    nnoremap <leader>t :NERDTreeToggle<CR>
    " Don't show list chars when on NERDTree
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

  " Airline {{{
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
      let g:airline_powerline_fonts = 1
    endif
    let g:airline_detect_spell     = 0 " Don't display spell
    let g:airline#extensions#hunks#enabled = 0 " Don't display the hunks info
    " let g:airline_theme = 'one'
  " }}}
  " FZF {{{
    nmap <leader>f :Files<CR>
    nmap <leader>b :Buffers<CR>
  "}}}
  if has("unix")
  " Ctags {{{
    let s:uname = system("uname -s")
    if match(s:uname, "arwin") && !exists("Ctags")
      " Exhuberant Ctags must be installed using brew
      command! Ctags execute  "silent !`brew --prefix`/bin/ctags -R --exclude=@/Users/bmartinez/.ctagsignore ."
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

  " Python {{{
    autocmd FileType python let b:coc_root_patterns = ['requirements.txt']
  " }}}
  " Ack configs {{{
    let g:ackprg = 'rg --vimgrep --smart-case'
  " }}}

  " Coc {{{
  " CoC searches for yarn installed node/javascript libraries, the config may
  " need to change for each computer
    command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    " nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " }}}
" }}}"
