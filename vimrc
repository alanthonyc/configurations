"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Loading Plugins
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Swap and Backup related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup                  " create backups
set undofile                " undo feature (even between exits)
set writebackup             " write backup files
set swapfile                " create .swp files
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo

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
set breakindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color/display related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set background=dark "what it says, duh!
color solarized     "choose color scheme
let &t_Co=256    "tell vim that the terminal support 256 colors
set hls!            "highlight search hits
syntax enable       "enable syntax highlighting
set showmatch       "show matching braces/brackets/parens
" set number        "display line numbers
set relativenumber
set laststatus=2    "always show the status bar even if there's only one window

set cursorline
" set cursorcolumn

set scrolloff=8     " keep more context when scrolling off the end of a buffer

set list                    " show invisible characters
set listchars=tab:›\        " set tabulator character
set listchars+=trail:⋅      " set trailing whitespace character
"set listchars+=eol:¬       " set end-of-line character
set showbreak=↪             " the character to put to show a line has been wrapped

set colorcolumn=80
"highlight ColorColumn ctermbg=123 guibg=gray10 "colors for the colorcolumns

" fix the ugly bright foldcolumns of the slate color scheme
highlight FoldColumn ctermbg=Black ctermfg=Cyan

" fix the Pmenu colors to be more readable
highlight Pmenu ctermfg=LightGray ctermbg=DarkGray
highlight PmenuSel ctermfg=Black ctermbg=magenta

set showcmd                 " show command characters
set showmode                " show the current (paste) mode on the open buffer

set ttyfast                 " may improve scrolling performance

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
" => Folding related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set foldcolumn=5
set foldlevelstart=20

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on     "show filetype
filetype plugin on
filetype indent on
set hidden      "allow switching buffers without saving files, keeps unsaved changes for later

au BufNewFile,BufRead *.md set filetype=markdown "use md files as markdown
au BufNewFile,BufRead *.jinja set filetype=jinja "use jinja files as Jinja2
au BufNewFile,BufRead *.twig set filetype=jinja "use twig files as Jinja2

autocmd FileType vim
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2

autocmd FileType markdown
  \ setlocal shiftwidth=4 |
  \ setlocal tabstop=4 |
  \ setlocal colorcolumn= "No line limits in markdown

autocmd FileType jade
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2

autocmd FileType ruby
  \ setlocal expandtab |
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2 |
  \ setlocal softtabstop=2

autocmd FileType coffee
  \ setlocal expandtab |
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2 |
  \ setlocal softtabstop=2

autocmd FileType yaml
  \ setlocal expandtab |
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2 |
  \ setlocal softtabstop=2

autocmd FileType make
  \ setlocal tabstop=4 |
  \ setlocal noexpandtab

autocmd FileType haskell
  \ setlocal expandtab |
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2 |
  \ setlocal softtabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startup stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * if !argc() | NERDTree | endif "show NERDTree when no args are given

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinSize = 60

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctrl-P Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_clear_cache_on_exit = 0 " do not clear cache on exit
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
let g:ctrlp_show_hidden = 1     " scan for dotfiles and dotdirs
let g:ctrlp_max_files = 50000   " maximum number of files to scan (0 = no limit)
let g:ctrlp_max_depth = 40      " maximum depth of dirtree to recurse into
let g:ctrlp_max_history = 100   " set to '&history' to use vim's history option
let g:ctrlp_follow_symlinks = 0 " do not follow symlinks
let g:ctrlp_lazy_update = 1     " update match-window after a certain time (1=250ms, >1 is interpreted as delay time in milliseconds)
let g:ctrlp_mruf_max = 250      " number of files to remember for MRU mode (most-recently-used)
" let g:ctrlp_custom_ignore = '\v\/(build|cache|modules-built)\/'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_javascript_checkers = ['jshint']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command CsvAlign Tabularize /;/r1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" Nerdtree
"   n     toggle NERDTree
"   lf    lookup current file in NERDTree
noremap <Leader>n :NERDTreeToggle <Enter>
noremap <Leader>lf :NERDTreeFind <Enter>

" Ctrl-P
"   b     search buffers
"   f     search files and buffers
"   go    search for word under cursor or visual selection
noremap <Leader>b :CtrlPBuffer <Enter>
noremap <Leader>f :CtrlPMixed <Enter>
noremap <Leader>go :CtrlPMixed<cr><c-\>w
vnoremap <Leader>go :<c-u>CtrlPMixed<cr><c-\>v

" folding
"   z1    set folding level to 1
"   z2    set folding level to 2
"   za    toggle a fold (vim default)
noremap <Leader>z1 :setlocal foldlevel=1 <Enter>
noremap <Leader>z2 :setlocal foldlevel=2 <Enter>
noremap <Leader>z0 :setlocal foldlevel=1000 <Enter> " open all folds


" Misc
"   h     remove search highlight
"   stw   remove trailing whitespace
"   u     open undo history browser
noremap <Leader>h :nohl <Enter>
nnoremap <leader>stw :%s/\s\+$//<cr>:let @/=''<CR> " strip all trailing whitespace in the current file
noremap <Leader>u :GundoToggle <Enter>
vmap < <gv
vmap > >gv

set backspace=indent,eol,start    " make backspace behave normally

set mouse=a
