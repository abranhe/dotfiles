set number			" Show current line number
set relativenumber		" Show relative line number

" The color scheme I like at the moment
colorscheme slate

" Tell vim to not use vi features
set nocompatible

" Search down into sub folders
set path+=**

" Package manager
call plug#begin('~/.local/share/nvim/plugged')

"
" Plugins
"

" Multiline cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/goyo.vim', {'for': 'markdown'}

call plug#end()
