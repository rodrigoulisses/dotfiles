set encoding=utf8 " Use utf-8 as default encoding

" Vundle configuration
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" My plugins to install/update with Vundle See http://vimawesome.com/
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
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'janko-m/vim-test'
Plugin 'tpope/vim-dispatch'
Plugin 'radenling/vim-dispatch-neovim'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plugin 'napmn/react-extract.nvim'
Plugin 'posva/vim-vue'
Plugin 'mlaursen/vim-react-snippets'
Plugin 'catppuccin/nvim', { 'as': 'catppuccin' }
Plugin 'github/copilot.vim'
Plugin 'projekt0n/github-nvim-theme'

" End of Vundle configuration
call vundle#end()
filetype plugin indent on

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
" set background=dark
" let g:edge_style = 'neon'
" let g:edge_enable_italic = 1
set autoindent

syntax on
set t_Co=256
set cursorline
" colorscheme onehalfdark
" let g:airline_theme='onehalfdark'
" colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
colorscheme github_dark

" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
" if (has('nvim'))
"   let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
" endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
" if (has('termguicolors'))
"   set termguicolors
" endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set clipboard=unnamedplus

autocmd BufWritePre * %s/\s\+$//e

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g
let test#strategy = "dispatch"
tnoremap <Esc> <C-><C-n>

" Configure linters (ALE and mix format)
" let g:ale_linters = {'ruby': ['standardrb'], 'javascript': ['prettier']}
" let g:ale_fixers = {'ruby': ['standardrb'], 'javascript': ['prettier']}
" let g:ale_fix_on_save = 0
" let g:ale_lint_on_save = 1
" let g:ale_enabled = 1
" let g:mix_format_on_save = 1

au BufRead,BufNewFile *.axlsx setlocal filetype=ruby

" FZF configurations
" Basic fzf file finder
nnoremap <Leader>f :Files<CR>

" Custom fzf commands with actions
" Open file in new tab
command! -bang -nargs=? -complete=dir FilesTab call fzf#vim#files(<q-args>, fzf#vim#with_preview({'sink': 'tabedit'}), <bang>0)

" Open file in horizontal split
command! -bang -nargs=? -complete=dir FilesSplit call fzf#vim#files(<q-args>, fzf#vim#with_preview({'sink': 'split'}), <bang>0)

" Open file in vertical split
command! -bang -nargs=? -complete=dir FilesVSplit call fzf#vim#files(<q-args>, fzf#vim#with_preview({'sink': 'vsplit'}), <bang>0)

" Key mappings for fzf
nnoremap <Leader>ft :FilesTab<CR>
nnoremap <Leader>fs :FilesSplit<CR>
nnoremap <Leader>fv :FilesVSplit<CR>

" Advanced fzf mapping with multiple actions
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }

" Customize fzf layout
let g:fzf_layout = { 'down': '~40%' }

" Hide statusline in fzf
autocmd! FileType fzf set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Additional fzf mappings
" Search in file content (ripgrep)
nnoremap <Leader>rg :Rg<CR>
" Search for word under cursor
nnoremap <Leader>rw :Rg <C-r><C-w><CR>
" Search in open buffers
nnoremap <Leader>b :Buffers<CR>
" Search recent files
nnoremap <Leader>h :History<CR>
" Search lines in current buffer
nnoremap <Leader>l :BLines<CR>
" Search lines in all buffers
nnoremap <Leader>L :Lines<CR>
" Search Git commits
nnoremap <Leader>gc :Commits<CR>
" Search Git commits for current buffer
nnoremap <Leader>gbc :BCommits<CR>
" Search commands
nnoremap <Leader>c :Commands<CR>
" Search help tags
nnoremap <Leader>ht :Helptags<CR>
" Search marks
nnoremap <Leader>m :Marks<CR>

" Copilot configuration for asdf
" Use asdf current nodejs version
let g:copilot_node_command = "/Users/rodrigoulissesesilva/.asdf/installs/nodejs/24.3.0/bin/node"
" Alternative: let g:copilot_node_command = system('asdf which node')
" Ensure copilot uses the correct node version
let g:copilot_assume_mapped = v:true
