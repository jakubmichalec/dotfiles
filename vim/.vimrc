""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ln -s ~/dotfiles/vim/.vimrc ~/.vimrc

" load plugins from vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

" utilities
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'ryanoasis/vim-devicons' " icons

" Ruby and ROR
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'

call vundle#end()
filetype plugin indent on

set nocompatible  " Use Vim settings, rather then Vi settings
set autoread " detect when a file is changed
set visualbell
set noerrorbells

let mapleader = ',' " set a map leader for more key combos

set history=1000 " change history to 1000
set textwidth=100

" Tab control
set noexpandtab " insert tabs rather than spaces for
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2 " the visible width of tabs
set softtabstop=2 " edit as if the tabs are 2 characters wide
set shiftwidth=2 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

if has('mouse')
    set mouse=a
    set ttymouse=xterm2
endif

set clipboard=unnamed

set ttyfast " faster redrawing

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

syntax on " switch syntax highlighting on

set encoding=utf8
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
colorscheme railscast


set number
set autoindent " automatically set indent of new line
set smartindent

set laststatus=2 " show the satus line all the time

" Remove backup and swapfiles
set nobackup
set nowritebackup
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" disable arrows to change my behaviour
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk

map <leader>ev :e! ~/.vimrc<cr> " edit ~/.vimrc

nmap \q :nohlsearch<CR> " Clear the highlight search

nmap <leader>. <c-^> " switch between current and last buffer

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

" don't need shift for :
nnoremap ; :
vnoremap ; :

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nmap <leader>, :w<CR> " save

nmap <leader>. <c-^> " switch between current and last buffer

" Buffers
nnoremap <leader>bn :bn<CR> " Next buffer
nnoremap <leader>bp :bp<CR> " Previous buffer
nnoremap <leader>bq :bp <BAR> bd #<CR> " Close the current buffer and move to the previous one


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Settings and Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set nerdtree window size, map ++ to open NERDtree panel
map ++ :NERDTreeToggle<CR>
let NERDTreeWinSize=50

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_enable_highlighting=0

" ctrlp conf
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>
