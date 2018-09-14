filetype plugin indent on
set encoding=utf8 " Use utf-8 as default encoding

" Vundler
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#rc()

" My plugins to install/update with vundler See http://vimawesome.com/
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-ruby/vim-ruby'
Plugin 'nsf/gocode', {'rtp': 'nvim/'}
Plugin 'fatih/vim-go'
Plugin 'gmarik/snipmate.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'tpope/vim-surround'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mattn/emmet-vim'
Plugin 'slim-template/vim-slim.git'
Plugin 'junegunn/fzf.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'chemzqm/vim-jsx-improve'
" Plugin 'itmammoth/run-rspec.vim'
Plugin 'janko-m/vim-test'
Plugin 'tpope/vim-dispatch'
Plugin 'radenling/vim-dispatch-neovim'
Plugin 'sts10/vim-pink-moon'

let mapleader = ","

let NERDSpaceDelims = 2
set number

set wrap " Line wrapping on
set ts=2 sts=2 sw=2 expandtab " Use spaces instead tabs. From: http://vimcasts.org/episodes/tabs-and-spaces/

" Disable defaults
set noswapfile " Dont create *.swp* files. Useful to use with dropbox.
set nobackup " Dont create ~ files.
set nowritebackup
set nocursorline " Dont underline all line.
setlocal incsearch " Set search *dinamic*
set hlsearch " No highlight searchs

" Show invisibles
" http://vimcasts.org/episodes/show-invisibles/
set list
set listchars=tab:\|\ ,trail:·,eol:¬

" Status line
" Customize status line
" `:help statusline`
set laststatus=2 " Always show statusline
set statusline=%<%f\ \[%{&ff}\]\ %y\ %h%m%r%=%-14.(%c%V%)\ %l/%L[%P]

" Disable arrow keys
" http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" pay attention when the line has more then 80 characters. Tip by
" @MarceloCajueiro
match Error /\%80v.\+/

"set textwidth=80 " Use gq when in visual mode

syntax on

" From: http://ryanselk.com/2015/05/19/terminals-in-neovim/
tnoremap <C-q> <C-\><C-n>

nmap <Tab> gt
nmap <S-Tab> gT

set mouse-=a

set foldmethod=manual

syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme pink-moon
set guifont=Inconsolata
set autoindent

if has("nvim")
  set termguicolors
endif

set clipboard=unnamed

" nnoremap <leader>r :RunSpec<CR>
" nnoremap <leader>l :RunSpecLine<CR>
" nnoremap <leader>e :RunSpecLastRun<CR>
" nnoremap <leader>cr :RunSpecCloseResult<CR>

autocmd BufWritePre * %s/\s\+$//e


" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g
let test#strategy = "dispatch"
tnoremap <Esc> <C-><C-n>
