set nocompatible              " be iMproved
filetype off                  " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My bundles here:

" UltiSnips for snipets
Plugin 'SirVer/UltiSnips'
"let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsListSnippets="<c-s-tab>"
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" Snippets are separated from the engine
Plugin 'honza/vim-snippets'

" Command T plugin
Plugin 'wincent/Command-T'
"let g:CommandTMatchWindowAtTop = 1
"let g:CommandTMatchWindowReverse = 1

Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = "/home/sik/.vim/ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
"let g:ycm_server_log_level = 'debug'
"let g:ycm_key_list_previous_completion=['<Up>']
"YcmCompleter GoToDefinitionElseDeclaration<CR>

"Bundle 'scrooloose/Syntastic'
"Bundle 'clang-complete'
"Bundle 'highlight_current_line.vim'

"Plugin to visualize tabs
Plugin 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  ctermbg=black
"hi IndentGuidesEven ctermbg=darkgrey

"Plugin to change between .h and .cpp
"Bundle 'a.vim'

Plugin 'LaTeX-Box-Team/LaTeX-Box'
let g:LatexBox_latexmk_options = "-xelatex -pdf -pvc"
" From https://github.com/LaTeX-Box-Team/LaTeX-Box/issues/105
let g:LatexBox_latexmk_async=1 "ho deia l'error del vim...
let g:LatexBox_quickfix=2
let g:LatexBox_latexmk_preview_continuously=1 
"-pdfps -pvc"

"Bundle 'Conque-Shell'

"Close buffer plugin
Plugin 'butane.vim'

"Increment indexes
"Plugin 'increment.vim'

"Search and replace on multiple files
"Bundle 'EasyGrep'
Plugin 'dkprice/vim-easygrep'

""" Editing Stuff -- Vim as generic IDE
" Generic edtion
Plugin 'surround.vim' " To insert '', [], (), {}... surrounding the selection
Plugin 'abolish.vim' " camelCase snake_case search insensitivity (and more)
Plugin 'repeat.vim'
Plugin 'tpope/vim-repeat' " remap . for plugins

" Add closing brakeds and quotes
Plugin 'Raimondi/delimitMate'

" use git from vim
Plugin 'tpope/vim-fugitive'
Plugin 'gitv'
Plugin 'airblade/vim-gitgutter'

" Python Stuff
Plugin 'ivanov/vim-ipython' " conection with ipython
Plugin 'Syntastic'   " PEP-8 style checking
Plugin 'plantuml-syntax' " UML markdown text

" use vim-exchange to swap words, text, etc..
Plugin 'tommcdo/vim-exchange'


" Navigation Stuff
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Tagbar'
nmap <F11> :TagbarToggle<CR>
Plugin 'TaskList.vim'
map <sHFIT><F11> <Plug>TaskList
Plugin 'ZoomWin'
Plugin 'Gundo'
map <Ctrl-U> :GundoToggle<CR>
Plugin 'ack.vim'
nmap <leader>a <Esc>:Ack!
" Bundle 'Powerline'
Plugin 'bling/vim-airline'
"let g:airline_powerline_fonts = 1

" Spreatsheed stuff
Plugin 'Tabular'
Plugin 'dhruvasagar/vim-table-mode'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" My commands
" Set color scheme that I like.
if $TERM == "xterm-256color"
  set t_Co=256
endif

colorscheme default
if has("gui_running")
  "colorscheme vividchalk
  colorscheme zenburn
  "colorscheme blue
  "set background=dark
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
else
  "colorscheme darkblue
  colorscheme zenburn
endif

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
"hi IndentGuidesOdd  guibg=lightgray   ctermbg=3
"hi IndentGuidesEven guibg=darkgray ctermbg=4

" To avoid clang message of not compiling small files
set cmdheight=2

" Show line number 
" relative when normal mode, absolute otherwise
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Highlight current line
set cursorline

" Show Clumn line
set colorcolumn=80

" Show autocomplete list of commands
set wildmenu

" Change leader key to ","
let mapleader = ","


nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

"Buffer navigation
"map <leader>n :bn<cr>
"map <leader>p :bp<cr>
"map <leader>d :bd<cr>
"map <leader>l :ls<cr>

noremap <leader>bd :Bclose<CR>      " Close the buffer.
noremap <leader>bl :ls<CR>          " List buffers.
noremap <leader>bn :bn<CR>          " Next buffer.
noremap <leader>bp :bp<CR>          " Previous buffer.
noremap <leader>bt :b#<CR>          " Toggle to most recently used buffer.
noremap <leader>bx :Bclose!<CR>     " Close the buffer & discard changes.

nnoremap <silent> <Leader>bb :CommandTBuffer<CR>

"Able and disable spellcheck in english
map <F5> :setlocal spell! spelllang=en_gb<CR>

"spaces instead of tab
set expandtab
set tabstop=2
set shiftwidth=2

"moving in warped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
inoremap jk <esc>
inoremap kj <esc>

"set guifont=DejaVu\ Sans\ Mono\ 10
set guifont=Monospace\ 12

"braking hte habit of using the arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" airline configuration
set showcmd "Show what you are tiping in normal mode
set laststatus=2 "workaround for showing airline when no split
set noshowmode "remove the old status bar -- INSERT --

" search highligting toggle
map <F12> :set nohls<CR>:let @s = @/<CR>:let @/ = ""<CR>:set hls<CR>
map <SHIFT><F12> :let @/=@s<CR>

" latex stuff
filetype plugin on
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
