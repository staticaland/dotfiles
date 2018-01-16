" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'tpope/vim-commentary'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/seoul256.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'

" Initialize plugin system
call plug#end()

" let g:onedark_termcolors = 256

colorscheme onedark

let g:goyo_width = '90%'
let g:goyo_height = '90%'

nmap <F5> :Goyo<cr>

let g:airline#extensions#ale#enabled = 1
