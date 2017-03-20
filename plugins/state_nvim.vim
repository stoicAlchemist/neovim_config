if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/brianmartinez/.config/nvim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/brianmartinez/.config/nvim/plugins'
let g:dein#_runtime_path = '/Users/brianmartinez/.config/nvim/plugins/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/brianmartinez/.config/nvim/plugins/.cache/init.vim'
let &runtimepath = '/Users/brianmartinez/.config/nvim,/etc/xdg/nvim,/Users/brianmartinez/.local/share/nvim/site,/usr/local/share/nvim/site,/Users/brianmartinez/.config/nvim/plugins/.cache/init.vim/.dein,/usr/share/nvim/site,/usr/local/share/nvim/runtime,/Users/brianmartinez/.config/nvim/plugins/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/brianmartinez/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/brianmartinez/.config/nvim/after,/Users/brianmartinez/.config/nvim/plugins/repos/github.com/Shougo/dein.vim'
filetype off
