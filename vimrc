set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'ingydotnet/yaml-vim'
Plugin 'godlygeek/tabular'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dockyard/vim-easydir'
Plugin 'rizzatti/dash.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'JarrodCTaylor/vim-js2coffee'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'mhartington/vim-angular2-snippets'

filetype plugin indent on     " required!

set title                         " Set the terminal's title

set visualbell                    " No beeping

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=/tmp                " Keep swap files in /tmp location

set laststatus=2                  " Always show the statusline

set encoding=utf-8
set showcmd                       " display incomplete commands
set number                        " line numbers
set hidden                        " Switch buffer without saving

set splitbelow                    " Split horizontal opens below
set splitright                    " Split vertical opens on the right

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

syntax enable
set background=dark
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

let g:airline_theme='solarized'

"" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2 shiftwidth=2        " a tab is two spaces
set expandtab                     " use spaces, not tabs
set backspace=indent,eol,start    " backspace through everything in insert mode

"" Searching
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain at least one capital letter

"" Show/Hide Invisibles
nmap <leader>l :set list!<cr>
set listchars=tab:▸\ ,eol:¬       " TextMate's symbols for tabstops and EOLs

"" Show/Hide NERDTree
nmap <leader>e :NERDTreeToggle<cr>

"" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

"" resize horzontal split window
nmap <C-k> <C-W>-<C-W>-
nmap <C-j> <C-W>+<C-W>+
"" resize vertical split window
nmap <C-h> <C-W>><C-W>>
nmap <C-l> <C-W><<C-W><

"" Visual wrap column
if exists('+colorcolumn')         " vim 7.3                       
  set colorcolumn=80
  highlight ColorColumn guibg=#586e75 ctermbg=239
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"" Use arrow key to change buffer
:noremap <left> :bp<cr>
:noremap <right> :bn<cr>

"" Set the Ctags's tag file search order
set tags=./tags;

"" Use Ack instead of grep
set grepprg=ack

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Typescript
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

