" colors
syntax on
set t_Co=256
colorscheme jellybeans

" settings
set nocompatible                " don't hack around for vi compatiblity
set mouse=a                     " because i'm lame
set nu                          " line numbers
set backup                      " do backups
set backupdir=~/.vimbackup      " put backups in one place
set directory=~/.vimtmp         " put tmp files in one place
set dir=~/.vimtmp               " for backup swaps
set noswapfile                  " wait wat
set hidden                      " hide buffers, rather than closing them
set ruler                       " show the cursor position all the time
set laststatus=2                " always show statusbar
set modelines=0                 " don't allow modelines
set smartindent                 " let vim indent for you
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indent on autoindenting
set tabstop=2                   " two-space tabs
set shiftwidth=2                " two-space tabs
set expandtab                   " use spaces for tabs
set incsearch                   " show search matches while you type
set ignorecase                  " ignore case when searching
set smartcase                   " ignore search case if all lowercase
set hlsearch                    " highlight search terms
set gdefault                    " default to global replace
" set virtualedit=all             " free cursor mode
set wrap!                       " no wordwrap
set backspace=eol,start,indent  " allow backspace to delete linebreaks
set scrolloff=10                " have 3 lines of offset (or buffer) when scrolling
set sidescroll=10               " 3 line buffer horizontally as well
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete first full match
set pastetoggle=<F2>            " toggle paste indentation w/ F2
set clipboard+=unnamed          " share clipboard
set more                        " page on extended output
set ttyfast                     " smoother redraws
set lazyredraw                  " do not redraw while executing macros
set showcmd                     " show command /eing typed
set tags=~/.tags                " grab tags directory, all the way up to root
set title                       " set the title

" load all the things (vundle)
filetype off

"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#rc()

"Bundle 'gmarik/vundle'
" Bundle 'Valloric/YouCompleteMe'
" Bundle 'tpope/vim-haml'
"Bundle 'tpope/vim-rails'
"Bundle 'tpope/vim-fugitive'
"Bundle 'sukima/xmledit'
" Bundle 'pangloss/vim-javascript'
" Bundle 'scrooloose/nerdcommenter'
" Bundle 'scrooloose/nerdtree'
" Bundle 'Lokaltog/vim-powerline'
" Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'kien/ctrlp.vim'
" Bundle 'ervandew/supertab'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'slim-template/vim-slim'

syntax enable
filetype plugin indent on

" file type detection
if has('autocmd')
  au filetype php set tabstop=4                 " four spaces for PHP tabs
  au filetype php set shiftwidth=4              " four spaces for PHP tabs
  au filetype ruby set list                     " list chars in ruby
  au filetype ruby set listchars=tab:>-,trail:- " list trailing spaces + all tabs
  au filetype ruby set list                     " list chars in js
  au filetype js set listchars=tab:>-,trail:-   " list trailing spaces + all tabs

  au BufNewFile,BufRead *.erb set filetype=html
  au BufNewFile,BufRead *.tpl set filetype=ruby
  au BufRead,BufNewFile *.todo setfiletype todo
  au BufRead,BufNewFile Rakefile,Capfile,Gemfile,.autotest,.irbrc,*.treetop,*.tt set ft=ruby syntax=ruby
endif

" faster split resizing (+,-)
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" sudo write ,W
noremap <leader>W :w !sudo tee %<CR>

" bad habits
cmap w!! %!sudo tee > /dev/null %

" custom binds I use
let mapleader = ","
nnoremap <leader>dW pldW
nnoremap <leader>dw pldw
nnoremap <leader><space> :noh<CR>
nnoremap <leader>u gUgU
nnoremap <leader>l gugu
inoremap jj <Esc>
inoremap jk <Esc>
nnoremap ; :
nnoremap <C-d> :q<CR>
noremap Y $
noremap T ^
nmap <leader>w :set wrap!<CR>
nmap <leader>k :set list!<CR>
nmap =j :%!python -c "import json, sys, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), indent=2)"<CR>
inoremap <C-tab> <Esc><<i

" move between files
map <C-K> <Esc>:next<CR>
map <C-J> <Esc>:prev<CR>
map <C-H> <Esc>:first<CR>
map <C-L> <Esc>:last<CR>

" strip trailing whitespace (,ss)
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>
autocmd FileType * autocmd BufWritePre <buffer> :call StripWhitespace()
autocmd BufWritePost *.coffee silent make!

" newline on shift/enter
map <S-Enter> O<Esc>j
map <CR> o<Esc>k

" move a line of text w/ F3/F4
nnoremap <F3> :m+<CR>==
nnoremap <F4> :m-2<CR>==
inoremap <F3> <Esc>:m+<CR>==gi
inoremap <F4> <Esc>:m-2<CR>==gi
vnoremap <F3> :m'>+<CR>gv=gv
vnoremap <F4> :m-2<CR>gv=gv

" tabs
map <F1> :tabprev<CR>
map <F2> :tabnext<CR>

" highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" when vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" search
set ic
set smartcase
set hlsearch

" move between panes
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l
map <Leader>h <C-w>h

" nerdtree
nmap <silent> <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0

" powerline
"let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme='default'

" nerdcommenter
let NERDSpaceDelims=1
let NERDCompactSexyComs=1

" rainbows
nnoremap <leader>rp :RainbowParenthesesToggle<CR>

" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" jump to last cursor position when opening a file.
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if &filetype !~ 'commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
     exe "normal g`\""
    endif
  end
endfunction

" ctrl p for cnuapp
"set wildignore+=*/.git/* " This line breaks fugitive.vim
set wildignore+=*.pyc,*/*.scssc
set wildignore+=*/cookbooks/*,*/db_global/*,*/doc/*,*/enf_app/*,*/enf_log/*,*/lsws-3.3.14/*
set wildignore+=*static/CACHE/css/*
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg

let g:ctrlp_max_files =0
let g:ctrlp_max_depth =1000
let g:ctrlp_max_height = 50
let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 0

let g:CommandTMaxFiles=50000
let g:ctrlp_open_multiple_files = 't'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \}

" set colorcolumn=80
" highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
" match OverLength /\%>80v.\+/
