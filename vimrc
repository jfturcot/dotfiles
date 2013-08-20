set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"
Bundle "pydave/AsyncCommand"
Bundle "Valloric/YouCompleteMe"
Bundle "mileszs/ack.vim"
Bundle "kien/ctrlp.vim"
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/syntastic"
Bundle "kchmck/vim-coffee-script"
Bundle "altercation/vim-colors-solarized"
Bundle "tpope/vim-commentary"
Bundle "tpope/vim-cucumber"
Bundle "tpope/vim-fugitive"
Bundle "airblade/vim-gitgutter"
Bundle "nono/vim-handlebars"
Bundle "groenewege/vim-less"
Bundle "tpope/vim-markdown"
Bundle "mnick/vim-pomodoro"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-rvm"
Bundle "ingydotnet/yaml-vim"
Bundle "godlygeek/tabular"
Bundle "gregsexton/Vomodoro"
Bundle "thoughtbot/vim-rspec"
Bundle 'jgdavey/tslime.vim'
Bundle 'bling/vim-airline'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'

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

" Rspec in another tmux pane
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

