" vim: set foldmarker={{{,}}} foldlevel=0 foldmethod=marker spell:


" █▓▒░ Plug {{{

call plug#begin('~/.vim/plugged')

Plug 'Chiel92/vim-autoformat'
Plug 'NLKNguyen/papercolor-theme'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'dbmrq/vim-ditto'
Plug 'francoiscabrol/ranger.vim'
Plug 'godlygeek/tabular'
Plug 'godlygeek/tabular'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'machakann/vim-highlightedyank'
Plug 'plasticboy/vim-markdown'
Plug 'rakr/vim-one'
Plug 'rbgrouleff/bclose.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'reedes/vim-lexical'
Plug 'rhysd/devdocs.vim'
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'dylanaraps/wal.vim'
let $GROFF_NO_SGR=1
runtime ftplugin/man.vim
" https://github.com/reedes/vim-thematic

" Initialize plugin system
call plug#end()

" }}}


" █▓▒░ Keybindings {{{

let mapleader=","

nnoremap <leader>l :%!marklink<CR>
vnoremap <leader>l :!marklink<CR>
nmap <leader>d <Plug>(devdocs-under-cursor)

nnoremap <leader>b :%!black<CR>
vnoremap <leader>b :!black<CR>

nnoremap <space> za

nmap <F5> :Goyo<cr>

set pastetoggle=<F2>

map ø :

nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off

" }}}


" █▓▒░ Visuals {{{

set t_Co=256
set fillchars=fold:\ , " get rid of obnoxious '-' characters in folds & diffs

set inccommand=nosplit " preview substitutions

set hlsearch      " highlight search terms

set showmatch     " set show matching parenthesis

if &t_Co >= 256 || has("gui_running")
    colorscheme wal
endif

if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif

set conceallevel=2

set foldenable          " enable folding
set foldlevelstart=0   " open most folds by default
set foldnestmax=10      " 10 nested fold max
highlight EndOfBuffer guifg=bg

let g:goyo_width = '90%'
let g:goyo_height = '90%'

" }}}


" █▓▒░ Settings {{{

if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

set paste               " Paste from a windows or from vim

set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

set list

set showcmd

" }}}


" █▓▒░ The rest {{{

let g:airline#extensions#ale#enabled = 1

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

let g:vim_markdown_frontmatter = 1

let g:airline_powerline_fonts = 1

au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

let g:lexical#thesaurus_key = '<leader>t'
let g:lexical#spell_key = '<leader>s'

" }}}
