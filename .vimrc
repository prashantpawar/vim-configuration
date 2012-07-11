set nocompatible               " be iMproved
filetype off                   " required!
set guifont=Inconsolata\ for\ Powerline:h14

set t_Co=256
syn on
cd /Users/pacific/Sites/mixify-social

set encoding=utf-8
set modelines=0
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set nonumber
set norelativenumber
set laststatus=2
set history=1000
set undofile
set undoreload=10000
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set shell=/bin/bash
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿,vert:│
set autowrite
set autoread
set shiftround
set title
set linebreak
set colorcolumn=+1
set backupdir=/tmp
set directory=/tmp

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

let g:Powerline_symbols = 'fancy'

" Better Completion
set completeopt=longest,menuone,preview

" Save when losing focus
au FocusLost * :silent! wall

" Wildmenu completion

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.orig                           " Merge resolution files

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

"persistent-undo Options
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" System clipboard interaction
" From https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
noremap <leader>y "*y
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>

" Fuck you, help key.
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" Stop it, hash key.
inoremap # X<BS>#

" Kill window
nnoremap K :q<cr>

" Unfuck my screen
nnoremap <F3> :syntax sync fromstart<cr>:redraw!<cr>

"{{{
" Renegade's mappings
map <F6> :tabnew<CR>
map <F5> :CommandT<CR>
map <Leader>5 :CommandT<CR>
let g:LustyJugglerSuppressRubyWarning=1
" }}}

"Remapping jj to escape
inoremap jj <Esc>

"Typos
command! -bang Q q<bang>
command! -bang W w<bang>

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

"Mapping Leader key to comma
let mapleader = ","
let maplocalleader = "\\"

" Clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Change case
inoremap <C-u> <esc>gUiwea

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Make backspace work sanely in visual mode
vnoremap <bs> x

" Marks and Quotes
noremap ' `
noremap æ '
noremap ` <C-^>

" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
nnoremap vv ^vg_

" Keep the cursor in place while joining limes
nnoremap J mzJ`z

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc><right>mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" HTML tag closing
inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<cr>a

" Less chording
" nnoremap ; :

"gSession settings
let g:autoload_session = 1

"phpfolding options
" Don't use the PHP syntax folding
setlocal foldmethod=manual
" Turn on PHP fast folds
"EnableFastPHPFolds

augroup SetPhpFolds
autocmd BufReadPost *
            \ if &filetype == "php" |
            \ setlocal foldlevel=1 |
            \ endif
augroup end

" <vimux settings>
" Run the current file with rspec
map <Leader>rb :call RunVimTmuxCommand("clear; rspec " . bufname("%"))<CR>

" Prompt for a command to run
map <Leader>rp :PromptVimTmuxCommand<CR>

" Run last command executed by RunVimTmuxCommand
map <Leader>rl :RunLastVimTmuxCommand<CR>

" Inspect runner pane
map <Leader>ri :InspectVimTmuxRunner<CR>

" Close all other tmux panes in current window
map <Leader>rx :CloseVimTmuxPanes<CR>

" Interrupt any command running in the runner pane
map <Leader>rs :InterruptVimTmuxRunner<CR>
" </vimux settings>

set omnifunc=csscomplete#CompleteCSS

set number
" set relativenumber

"Code Folding
augroup ft_html
    au!

    au BufNewFile,BufRead *.html setlocal filetype=htmldjango
    au FileType html,phtml,htmldjango setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType html,phtml,htmldjango nnoremap <buffer> <localleader>f Vatzf

    " Use <localleader>t to fold the current templatetag.
    au FileType html,phtml,htmldjango nmap <buffer> <localleader>t viikojozf

    " Smarter pasting
    au FileType html,phtml,htmldjango nnoremap <buffer> p :<C-U>YRPaste 'p'<CR>v`]=`]
    au FileType html,phtml,htmldjango nnoremap <buffer> P :<C-U>YRPaste 'P'<CR>v`]=`]
    au FileType html,phtml,htmldjango nnoremap <buffer> π :<C-U>YRPaste 'p'<CR>
    au FileType html,phtml,htmldjango nnoremap <buffer> ∏ :<C-U>YRPaste 'P'<CR>

    " Indent tag
    au FileType html,phtml,htmldjango nnoremap <buffer> <localleader>= Vat=

    " Django tags
    au FileType phtml,htmldjango inoremap <buffer> <c-t> {%<space><space>%}<left><left><left>

    " Django variables
    au FileType phtml,htmldjango inoremap <buffer> <c-f> {{<space><space>}}<left><left><left>
augroup END

"Javascript
augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END


" Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END

" }}}
" cpoptions+=J, dammit {{{

" Something occasionally removes this.  If I manage to find it I'm going to
" comment out the line and replace all its characters with 'FUCK'.
augroup twospace
    au!
    au BufRead * :set cpoptions+=J
augroup END

" }}}
"

" }}}
" Abbreviations ----------------------------------------------------------- {{{

function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')"
endfunction

call MakeSpacelessIabbrev('mx/',  'http://www.mixify.com/')
call MakeSpacelessIabbrev('pl/',  'padding-left: ')
call MakeSpacelessIabbrev('pr/',  'padding-right: ')
call MakeSpacelessIabbrev('pt/',  'padding-top: ')
call MakeSpacelessIabbrev('pb/',  'padding-bottom: ')

call MakeSpacelessIabbrev('ml/',  'margin-left: ')
call MakeSpacelessIabbrev('mr/',  'margin-right: ')
call MakeSpacelessIabbrev('mt/',  'margin-top: ')
call MakeSpacelessIabbrev('mb/',  'margin-bottom: ')

inoremap <c-l> <c-k>l*

" }}}

" Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" }}}

" associate *.foo with php filetype
autocmd BufRead,BufNewFile *.less setfiletype css
autocmd BufRead,BufNewFile *.ehtml setfiletype html

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
" au BufWritePost .vimrc so ~/.vimrc

" Searching and movement -------------------------------------------------- {{{

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

set scrolloff=3
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

noremap <leader><space> :noh<cr>:call clearmatches()<cr>

runtime macros/matchit.vim
map <tab> %

" Made D behave
nnoremap D d$

" Don't move on *
nnoremap * *<c-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
nnoremap <silent> <leader>/ :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" Fix linewise visual selection of various text objects
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

" Toggle "keep current line in the center of the screen" mode
nnoremap <leader>C :let &scrolloff=999-&scrolloff<cr>

" Folding ----------------------------------------------------------------- {{{

set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}

" Directional Keys {{{

" It's 2012.
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Easy buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <leader>v <C-w>v
noremap <leader>s <C-w>s
" }}}

" background shortcut mapping
"map <F2> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Environments (GUI/Console) ---------------------------------------------- {{{
if has('gui_running')
    " GUI Vim

    set background=light
    colorscheme solarized


    " Remove all the UI cruft
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R

    highlight SpellBad term=underline gui=undercurl guisp=Orange

    " Different cursors for different modes.
    highlight iCursor guifg=white guibg=brown
    set guicursor=n-c:block-Cursor-blinkon0
    set guicursor+=v:block-vCursor-blinkon0
    set guicursor+=i-ci:ver20-iCursor

    if has("gui_macvim")
        " Full screen means FULL screen
        set fuoptions=maxvert,maxhorz

        " Use the normal HIG movements, except for M-Up/Down
        let macvim_skip_cmd_opt_movement = 1
        no   <D-Left>       <Home>
        no!  <D-Left>       <Home>
        no   <M-Left>       <C-Left>
        no!  <M-Left>       <C-Left>

        no   <D-Right>      <End>
        no!  <D-Right>      <End>
        no   <M-Right>      <C-Right>
        no!  <M-Right>      <C-Right>

        no   <D-Up>         <C-Home>
        ino  <D-Up>         <C-Home>
        imap <M-Up>         <C-o>{

        no   <D-Down>       <C-End>
        ino  <D-Down>       <C-End>
        imap <M-Down>       <C-o>}

        imap <M-BS>         <C-w>
        inoremap <D-BS>     <esc>my0c`y
    else
        " Non-MacVim GUI, like Gvim
    end
else
    " Console Vim
    " For me, this means iTerm2, possibly through tmux
    set background=dark
    colorscheme wombat256

    " Mouse support
    set mouse=a
endif

" }}}

" Quick editing {{{

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>es :vsplit ~/.vim/snippets/<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>
nnoremap <leader>ec :vsplit application/configs/application.ini<cr>

" }}}

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
    Bundle "AutoComplPop"
    Bundle "file-line"
    Bundle "Align"
    Bundle "snipMate"
    Bundle "matchit.zip"

    Bundle "benmills/vimux"

    " Ack
    Bundle "ack.vim"
    noremap <LocalLeader># "ayiw:Ack <C-r>a<CR>
    vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>
    " tComment
    Bundle "tComment"
    nnoremap // :TComment<CR>
    vnoremap // :TComment<CR>

    "/2072/PHP-Indenting-for-VIm"
    Bundle "https://github.com/2072/PHP-Indenting-for-VIm.git"
    let PHP_removeCRwhenUnix = 1

    "vim global session
    Bundle "http://github.com/c9s/gsession.vim"

    "auto complete plugin
    Bundle "https://github.com/Shougo/neocomplcache.git"
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_auto_select = 1
    let g:neocomplcache_enable_at_startup = 1

    "Color Themes
    Bundle "jnurmine/Zenburn"

    "Syntastic
    Bundle "scrooloose/syntastic"
    autocmd FileType php set errorformat=%-GNo\ syntax\ errors\ detected\ in%.%#,PHP\ Parse\ error:\ %#syntax\ %trror\,\ %m\ in\ %f\ on\ line\ %l,PHP\ Fatal\ %trror:\ %m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %.%#,%-G\s%#,Parse\ error:\ %#syntax\ %trror\,\ %m\ in\ %f\ on\ line\ %l,Fatal\ %trror:\ %m\ in\ %f\ on\ line\ %l
    autocmd FileType phtml set errorformat=%-GNo\ syntax\ errors\ detected\ in%.%#,PHP\ Parse\ error:\ %#syntax\ %trror\,\ %m\ in\ %f\ on\ line\ %l,PHP\ Fatal\ %trror:\ %m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %.%#,%-G\s%#,Parse\ error:\ %#syntax\ %trror\,\ %m\ in\ %f\ on\ line\ %l,Fatal\ %trror:\ %m\ in\ %f\ on\ line\ %l

    "Tagbar
    Bundle "Tagbar"

    "JSLint
    Bundle "hallettj/jslint.vim"

    "PHPFold
    Bundle "phpfolding.vim"

    "Indent Guide
    Bundle "nathanaelkane/vim-indent-guides"
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

    "AfterColors
    Bundle "AfterColors.vim"

    "Command-T
    Bundle "wincent/Command-T"

    "Vitality.vim
    Bundle "sjl/vitality.vim"

    "CtrlP
    Bundle "kien/ctrlp.vim"
    "matcher
    Bundle "burke/matcher"
    "matcher settings
    let g:path_to_matcher = "/usr/local/bin/matcher"

    let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.svn/', 'cd %s && git ls-files'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

    function! g:GoodMatch(items, str, limit, mmode, ispath, crfile, regex)
    " the Command-T matcher doesn't do regex. Return now if that was requested.
    if a:regex == 1
        let [lines, id] = [[], 0]
        for item in a:items
        let id += 1
        try | if !( a:ispath && item == a:crfile ) && (match(item, a:str) >= 0)
            cal add(lines, item)
        en | cat | brea | endt
        endfo
        return lines
    end

    " a:mmode is currently ignored. In the future, we should probably do
    " something about that. the matcher behaves like "full-line".
    let cmd = g:path_to_matcher . " --limit " . a:limit . " --manifest " . ctrlp#utils#cachefile() . " "
    if ! g:ctrlp_dotfiles
        let cmd = cmd . "--no-dotfiles "
    endif
    let cmd = cmd . a:str
    return split(system(cmd))

    endfunction
    let g:ctrlp_match_func = { 'match': 'g:GoodMatch' }
    "matcher settings end

    "Powerline
    Bundle "Lokaltog/vim-powerline"

    "Vim Coffescript support
    Bundle "kchmck/vim-coffee-script"

    "Fountain.io
    Bundle "fountain.vim"
    au BufRead,BufNewFile *.fountain     set filetype=fountain

    "
    " original repos on github
    Bundle 'tpope/vim-fugitive'
    Bundle 'https://github.com/sjbach/lusty.git'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'mattn/zencoding-vim'
    let g:user_zen_expandabbr_key = '<c-e>'
    let g:use_zen_complete_tag = 1

    " vim-scripts repos
    Bundle 'L9'
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

