call pathogen#infect()            " pathogen.vim

set title                         " Set the terminal's title

set visualbell                    " No beeping

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=/tmp                " Keep swap files in /tmp location

set nocompatible
set encoding=utf-8
set showcmd                       " display incomplete commands
set number                        " line numbers
filetype plugin indent on         " load file type plugins + indentation
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

"" Use tab for auto completion
function! SuperTab()
  if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
    return "\<Tab>"
  else
    return "\<C-n>"
  endif
endfunction
imap <Tab> <C-R>=SuperTab()<CR>

"" Set the Ctags's tag file search order
set tags=./tags;

"" Use Ack instead of grep
set grepprg=ack

