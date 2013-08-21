"Use vim settings instead of vi
set nocompatible

" Pathogen ~/.vim/bundles
" Keep this near top so plugins are loaded before vimrc
call pathogen#infect()
" force filetype refresh
filetype off
filetype plugin indent on

" Syntax highlighting
syntax on
set t_Co=256
colorscheme molokai

" JSON syntax from javascript
autocmd BufNewFile,BufRead *.json setlocal ft=javascript

" Markdown uses spellcheck
autocmd BufNewFile,BufRead *.markdown,*.md setlocal spell spelllang=en_us

" Show hidden characters
set list
set listchars=tab:→\ ,trail:·

" Tabs are 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" Remember more commands
set history=1024

" Always show statusline
set laststatus=2

" Backspace works properly
set backspace=2
set backspace=indent,eol,start

" Show cursor line
set cursorline

" Search
set incsearch
set wrapscan
set hlsearch

" Make searches case-sensitive if they contain upper-case characters
set ignorecase
set smartcase

set wildignore+=node_modules      " npm
set wildignore+=_site             " Jekyll

" Plugin Specific Settings
let g:jekyll_post_filetype = 'markdown'
let g:jekyll_post_extension = '.md'

" Leader Mappings
let mapleader = ','
" Reload
nmap <leader>rv :source ~/.vimrc<CR>
" Paste from X11 clipboard
nmap <leader>pp :r !xclip -o<CR> 
" Format JSON
nmap <leader>fj :%!python -m json.tool<CR>
" Jekyll Bindings
nmap <leader>jb :Jbuild<CR>
nmap <leader>jn :JTpost!<CR>


" Tab navigation
nmap <C-h> :tabprev<CR>
nmap <C-j> :tabfirst<CR>
nmap <C-k> :tablast<CR>
nmap <C-l> :tabnext<CR>
nmap <C-S-h> :tabprev<CR>
nmap <C-S-j> :tabfirst<CR>
nmap <C-S-k> :tablast<CR>
nmap <C-S-l> :tabnext<CR>
" Enter will disable search highlighting
nnoremap <CR>  :nohlsearch<CR>

" I type these WAAayy too often..
command! W :w
command! Q :q
command! Wq :wq
command! WQ :wq

