" Gotta be first
set nocompatible

filetype off
filetype on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'bling/vim-airline'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'

" ----- go vim -----------------------------------------------
Plugin 'fatih/vim-go'

" ----- man pages, tmux -----------------------------------------------
Plugin 'benmills/vimux'
Plugin 'edkolev/tmuxline.vim'

" ----- Syntax plugins ------------------------------------------------
Plugin 'tpope/vim-markdown'
Plugin 'slim-template/vim-slim'
Plugin 'elzr/vim-json'
Plugin 'kchmck/vim-coffee-script'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'Valloric/YouCompleteMe'

" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

"Plugin 'HTML-AutoCloseTag''
"Plugin 'godlygeek/tabular'
"Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'bronson/vim-trailing-whitespace'

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

call vundle#end()

filetype plugin on
filetype indent on
au BufNewFile,BufRead *.coffee set filetype=coffee
let coffee_linter = 'usr/local/bin/coffeelint'

" --- General settings ---
set backspace=indent,eol,start
set relativenumber
set number
set nolinebreak
set showcmd
set showmatch
set incsearch
set hlsearch
set nofoldenable
set dir=/tmp
set syntax=whitespace
autocmd BufNewFile,BufRead *.slim set ft=slim

" --- filetype plugin on ---
set ignorecase
set smartcase
set hidden

set laststatus=2

set tw=0
set history=10000
set expandtab
syntax on 
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent
set grepprg=ack
let g:ackprg = 'ag --nogroup --nocolor --column'
set vb 

" ----- Mapping Settings ----------------------------------------------
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
set backupdir=/tmp
set gfn=Monaco:h16
set mouse=a
let mapleader=","

map ,ff :CtrlPClearCache<CR>
map ,nt :NERDTreeToggle<CR>
map ,p :set paste!<CR>
map ,q :q<CR>
map ,t :CtrlP .<CR>
map ,w :w<CR>
map ,x :x<CR>
map ,v :VimuxPromptCommand<CR>
map ,, :w<CR>:VimuxRunLastCommand<CR>
map ,/ :VimuxRunLastCommand<CR>

" ----- UltiSnip Settings ---------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
" nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0 

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
" autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Tmux ------------------------------
let g:tmux_navigator_no_mappings = 0 

nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
let g:tmuxline_powerline_separators = 0

" ----- Disable the F1 ---------------------------
map <F1> <Esc>
imap <F1> <Esc>

let g:airline#extensions#tabline#left_sep = 'XXXXXXX'
let g:airline#extensions#tabline#left_alt_sep = 'XXXXXXX'
let g:airline#extensions#tabline#right_sep = 'XXXXXXX'
let g:airline#extensions#tabline#right_alt_sep = 'XXXXXXX'
