"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible "enable VIM improvements
set modelines=5  " interpret 5 lines at bottom for modelines
set modeline     " enable vim modelines usage

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Window/Tab related                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinSize = 60

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Swap and Backup related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" prevent vim from creating swap and backup files
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, ab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab     "convert tabs to spaces
set shiftwidth=4  "length for indentation
set tabstop=4     "length for tabs
set smarttab      "enable smart indetation
"set fdm=indent    "set indentation mode
set autoindent    "enable auto indentation

set textwidth=120

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color/display related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark "what it say, duh!
color solarized     "choose color scheme
set hls!            "highlight search hits
syntax enable       "enable syntax highlighting
set showmatch       "show matching braces/brackets/parens
" set number        "display line numbers
set relativenumber
set cul             "highlight current line
set lbr             "break long lines at word boundaries
set laststatus=2    "always show the status bar even if there's only one window

set cursorline
set cursorcolumn

set scrolloff=8     " keep more context when scrolling off the end of a buffer

set list                    " show invisible characters
set listchars=tab:›\        " set tabulator character
set listchars+=trail:⋅      " set trailing whitespace character
"set listchars+=eol:¬       " set end-of-line character
set showbreak=↪             " the character to put to show a line has been wrapped

set colorcolumn=80
highlight ColorColumn ctermbg=123 guibg=gray10 "colors for the colorcolumns

set showcmd                 " show command characters
set showmode                " show the current (paste) mode on the open buffer

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%f       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wildmenu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu                " enable menu at the bottom
set wildmode=longest:full,full " wildcard matches show a list, matching the longest first, try list:longest
set wildignore+=.git,.hg,.svn " ignore version control repos
set wildignore+=*.pyc       " ignore Python compiled files
set wildignore+=*.rbc       " ignore Rubinius compiled files
set wildignore+=*.swp       " ignore vim backups

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase  "make search case insensitive
set incsearch   "enable incremental search (search while typing)
set smartcase   "preserve case when replacing

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on     "show filetype
filetype plugin on
filetype indent on
set hidden      "allow switching buffers without saving files, keeps unsaved changes for later

au BufNewFile,BufRead *.md set filetype=markdown "use md files as markdown

autocmd FileType vim
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2

autocmd FileType markdown
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2 |
  \ setlocal colorcolumn= "No line limits in markdown

autocmd FileType jade
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2

autocmd FileType ruby
  \ setlocal expandtab |
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2 |
  \ setlocal softtabstop=2

autocmd FileType yaml
  \ setlocal expandtab |
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2 |
  \ setlocal softtabstop=2

autocmd FileType makefile
  \ setlocal noexpandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startup stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * if !argc() | NERDTree | endif "show NERDTree when no args are given

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings / Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command Fb FufBuffer
command Ff FufFile
command Fc FufCoverageFile
command Fl FufLine

command CsvAlign Tabularize /;/r1

let mapleader = ","
noremap <Leader>f :FufFile <Enter>
noremap <Leader>b :FufBuffer <Enter>
noremap <Leader>n :NERDTreeToggle <Enter>
noremap <Leader>h :nohl <Enter>
nnoremap <leader>stw :%s/\s\+$//<cr>:let @/=''<CR> " strip all trailing whitespace in the current file
noremap <Leader>u :GundoToggle <Enter>

vmap < <gv
vmap > >gv
