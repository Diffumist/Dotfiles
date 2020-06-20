""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PlugList                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" Specify a directory for plugins
" - For Neovim: 'D:\Editor\Neovim\share\nvim\plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
 
" Make sure you use single quotes

"美化
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
"theme color
Plug 'tomasr/molokai' | Plug 'altercation/solarized'
 
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
 
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
 
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"JS的插件
"Plug 'isRuslan/vim-es6' | Plug 'mxw/vim-jsx'

"Syntastic
Plug 'scrooloose/syntastic'
 
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
 
"comments-auto
Plug 'scrooloose/nerdcommenter'
 
" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
 
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
 
" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 
" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin' 
 
"Fuzzy file, buffer, mru, tag, etc finder.
Plug 'kien/ctrlp.vim'
 
"multiple selections
"Plug 'terryma/vim-multiple-cursors'
 
"Highlights trailing whitespace
Plug 'bronson/vim-trailing-whitespace'
 
"emmet quick-html
Plug 'mattn/emmet-vim'
 
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              plugin settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
"set my leader
"let mapleader=";"
let mapleader="\<Space>"

set nocompatible
 
" Initialize plugin system
filetype plugin indent on
 
"加强版状态栏
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

"NerdTree ####
let NERDTreeQuitOnOpen = 0
let NERDChristmasTree=1
map <leader>f :NERDTreeToggle<CR>
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 设置 NERDTree 子窗口宽度
let NERDTreeWinSize=25
"let g:NERDTreeWinSize = 32
 
"ctrlp ####
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'
 
"ultisnip ####
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
 
"nerdcommenter ####
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
 
"vim-easy-align ####
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
 
"vim-jsx ####
let g:jsx_ext_required = 0

"syntastic


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               common setting                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
set background=dark
set t_Co=256
colorscheme molokai

set number
"Show related row numbers
set relativenumber 

set autoindent
set smartindent
set showmatch
set ignorecase
 
set cursorline
 
set incsearch
 
set display+=lastline
 
set guifont=Inconsolata:h15:cANSI
 
set tabstop=4
set shiftwidth=4
set expandtab
 
set nobackup
set noswapfile
set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
" set clipboard+=unnamed
 
set clipboard=unnamed
 
set winaltkeys=no
 
set undofile " keep an undo file (undo changes after closing)
 
set ruler  " show the cursor position all the time
 
set showcmd " display incomplete commands
 
set cmdheight=1 " 1 screen lines to use for the command-line
 
set showfulltag " show tag with function protype.
 
set guioptions+=b " present the bottom scrollbar when the longest visible line exceed the window
 
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
 
set encoding=utf-8
 
set tenc=utf-8

syntax on 

syntax enable
 
set autoread
 
set hlsearch


 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               keyboard-binding                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"默认文件夹
cd D:\Code\VimCode

vmap <c-c> "+y
map <c-v> "+p 

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
 
 
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "                                   others                                   "
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
 " Put these in an autocmd group, so that we can delete them easily.
  
 augroup vimrcEx
  autocmd!
 
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
 
  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell
 
  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
 
  " Disable wrap on some languages
  autocmd BufRead,BufNewFile *.slim setlocal textwidth=0
  autocmd BufRead,BufNewFile *.erb setlocal textwidth=0
  autocmd BufRead,BufNewFile *.html setlocal textwidth=0
 
  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell
 
  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
 
  " Autocomplete ids and classes in CSS
  autocmd FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-255
  " Add the '-' as a keyword in erb files
  autocmd FileType eruby set iskeyword=@,48-57,_,192-255,$,-
 
  " Auto reload VIM when settings changed
  autocmd BufWritePost .vimrc so $MYVIMRC
  autocmd BufWritePost *.vim so $MYVIMRC
  autocmd BufWritePost vimrc.symlink so $MYVIMRC
 
  " Make those debugger statements painfully obvious
  au BufEnter *.rb syn match error contained "\<binding.pry\>"
  au BufEnter *.rb syn match error contained "\<debugger\>"
  au BufEnter *.js syn match error contained "\<debugger\>"
  au BufEnter *.coffee syn match error contained "\<debugger\>"
augroup END
 
  
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "                                   run                                   "
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc