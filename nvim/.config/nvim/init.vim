" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

Plug 'NLKNguyen/papercolor-theme'
Plug 'francoiscabrol/ranger.vim'
Plug 'godlygeek/tabular'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'plasticboy/vim-markdown'
Plug 'rbgrouleff/bclose.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'godlygeek/tabular'
Plug 'machakann/vim-highlightedyank'

" Initialize plugin system
call plug#end()

" let g:onedark_termcolors = 256

" colorscheme onedark
set background=light
" colo PaperColor

let g:goyo_width = '90%'
let g:goyo_height = '90%'

nmap <F5> :Goyo<cr>

let g:airline#extensions#ale#enabled = 1

if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

set paste               " Paste from a windows or from vim
let mapleader=","

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

if &t_Co >= 256 || has("gui_running")
    colorscheme PaperColor
endif

if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif

set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.

set pastetoggle=<F2>
set showcmd

map ø :

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" On window resize, if goyo is active, do <c-w>= to resize the window
autocmd VimResized * if exists('#goyo') | exe "normal \<c-w>=" | endif
set showmatch

set foldenable          " enable folding
set foldlevelstart=0   " open most folds by default
set foldnestmax=10      " 10 nested fold max
nnoremap <space> za
highlight EndOfBuffer guifg=bg

let g:vim_markdown_frontmatter = 1
set conceallevel=2

nnoremap <leader>l :%!marklink<CR>
vnoremap <leader>l :!marklink<CR>

set inccommand=nosplit " preview substitutions
