set nocompatible               " be iMproved
filetype off                   " required!
set guifont=Inconsolata:h16
set backupdir=/tmp
set directory=/tmp
colorscheme "Tomorrow-Night"
set background=dark
set autoindent
set hlsearch
set incsearch
set smartcase

cd /Users/pacific/Sites/mixify-social
map <F1> <Esc>
imap <F1> <Esc>
map <F4> :FufBuffer<CR>
map <F3> :tabnew<CR>
map <F7> :TlistToggle<CR>
map <F5> :FufFile **\<CR>
map <Leader>5 :FufFile **\<CR>
map <F6> :LustyJuggler<CR>

"Remapping jk to escape
inoremap jk <Esc>

" For mac users (using the 'apple' key)
map <D-S-]> gt
map ge gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>

"Disabling Arrow Keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

"Mapping Leader key to comma
let mapleader = ","

"gSession settings
let g:autoload_session = 1

"Folding Settings"
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

augroup SetPhpFolds
autocmd BufReadPost *
            \ if &filetype == "php" |
            \ setlocal foldcolumn=1 |
            \ setlocal foldlevel=99 |
            \ endif
augroup end

"phpfolding options
" Don't use the PHP syntax folding 
setlocal foldmethod=manual 
" Turn on PHP fast folds 
EnableFastPHPFolds 

set omnifunc=csscomplete#CompleteCSS

"set number
set relativenumber

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" associate *.foo with php filetype
autocmd BufRead,BufNewFile *.less setfiletype css

"Display register in statusline
set statusline=%<%f\ %h%m%r\ %y%=%{v:register}\ %-14.(%l,%c%V%)\ %P

"<Imported Config>"
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set autoread 
" Modeline
set modeline
set modelines=5 " default numbers of lines to read for modeline instructions
set backspace=indent,eol,start	" more powerful backspacing

set tabstop=4    " Set the default tabstop
set softtabstop=4
set shiftwidth=4 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.
set novisualbell  " No blinking
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
set vb t_vb= " disable any beeps or flashes on error
set ruler  " Show ruler
set showcmd " Display an incomplete command in the lower right corner of the Vim window
set shortmess=atI " Shortens messages

set splitbelow
set splitright
"</Imported Config>"

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Bundle 'gmarik/vundle'

    " My Bundles here:
    Bundle "YankRing.vim"
    Bundle "http://github.com/thinca/vim-quickrun.git"
    Bundle "http://github.com/thinca/vim-poslist.git"
    Bundle "jQuery"
    " Utility
    Bundle "repeat.vim"
    Bundle "surround.vim"
    " Bundle "SuperTab"
    Bundle "AutoComplPop"
    Bundle "file-line"
    Bundle "Align"
    " Ack
    Bundle "ack.vim"
    noremap <LocalLeader># "ayiw:Ack <C-r>a<CR>
    vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>
    " tComment
    Bundle "tComment"
    nnoremap // :TComment<CR>
    vnoremap // :TComment<CR>

    " Command-T
    Bundle "wincent/Command-T"
    let g:CommandTMatchWindowAtTop=1 " show window at top

    "/2072/PHP-Indenting-for-VIm"
    Bundle "https://github.com/2072/PHP-Indenting-for-VIm.git"
    let PHP_removeCRwhenUnix = 1 

    "vim global session
    Bundle "http://github.com/c9s/gsession.vim"

    "auto complete plugin
    Bundle "https://github.com/Shougo/neocomplcache.git"

    "Color Themes
    Bundle "jnurmine/Zenburn"

    "Syntastic
    Bundle "scrooloose/syntastic"
    autocmd FileType php set errorformat=%-GNo\ syntax\ errors\ detected\ in%.%#,PHP\ Parse\ error:\ %#syntax\ %trror\,\ %m\ in\ %f\ on\ line\ %l,PHP\ Fatal\ %trror:\ %m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %.%#,%-G\s%#,Parse\ error:\ %#syntax\ %trror\,\ %m\ in\ %f\ on\ line\ %l,Fatal\ %trror:\ %m\ in\ %f\ on\ line\ %l
    autocmd FileType phtml set errorformat=%-GNo\ syntax\ errors\ detected\ in%.%#,PHP\ Parse\ error:\ %#syntax\ %trror\,\ %m\ in\ %f\ on\ line\ %l,PHP\ Fatal\ %trror:\ %m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %.%#,%-G\s%#,Parse\ error:\ %#syntax\ %trror\,\ %m\ in\ %f\ on\ line\ %l,Fatal\ %trror:\ %m\ in\ %f\ on\ line\ %l
    
    "Tagbar
    Bundle "Tagbar"
    nmap <F6> :TagbarToggle<CR>

    "JSLint
    Bundle "hallettj/jslint.vim"

    "PHPFold
    Bundle "phpfolding.vim"

    "JumpToCSS
    Bundle "ptrin/JumpToCSS"
    nnoremap ,jc :JumpToCSS<CR>

    "CSS-Color
    Bundle "skammer/vim-css-color"
    
    "
    " original repos on github
    Bundle 'tpope/vim-fugitive'
    Bundle 'https://github.com/sjbach/lusty.git'
    Bundle 'Lokaltog/vim-easymotion'
    " Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    Bundle 'mattn/zencoding-vim'
    let g:user_zen_expandabbr_key = '<c-e>' 
    let g:use_zen_complete_tag = 1

    " vim-scripts repos
    Bundle 'L9'
    Bundle 'FuzzyFinder'
    " ...

    filetype plugin indent on     " required! 
    "
    " Brief help
    " :BundleList          - list configured bundles
    " :BundleInstall(!)    - install(update) bundles
    " :BundleSearch(!) foo - search(or refresh cache first) for foo
    " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
    "
    " see :h vundle for more details or wiki for FAQ
    " NOTE: comments after Bundle command are not allowed..

