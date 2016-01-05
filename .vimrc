" .vimrc
" Author: Steve Losh <steve@stevelosh.com> & Prashant Singh Pawar <prashantpawar@gmail.com>
" Source: http://github.com/prashantpawar/vim-configuration
"
" This file changes a lot.  I'll try to document pieces of it whenever I have
" a few minutes to kill.

" Preamble ---------------------------------------------------------------- {{{
filetype off
filetype plugin indent on
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

    " let Vundle manage Vundle
    " required!
    Bundle 'gmarik/vundle'

    " My Bundles here:
    "Holylight, changes background color based on macbook contrast settings
    " Bundle "Dinduks/vim-holylight"
    " let g:holylight_threshold = 1000000
    Bundle "YankRing.vim"
    Bundle "http://github.com/thinca/vim-quickrun.git"
    Bundle "http://github.com/thinca/vim-poslist.git"
    Bundle "jQuery"
    " Utility
    Bundle "repeat.vim"
    Bundle "surround.vim"
    " Bundle "AutoComplPop"
    Bundle "file-line"
    Bundle "Align"
    Bundle "matchit.zip"
    Bundle "wincent/Command-T"

    Bundle "NathanNeff/grails-vim"

    "<snipMate>
    Bundle "MarcWeber/vim-addon-mw-utils"
    Bundle "tomtom/tlib_vim"
    Bundle "honza/snipmate-snippets"

    Bundle "garbas/vim-snipmate"
    "</snipMate>

    Bundle "mklabs/grunt.vim"

    Bundle "benmills/vimux"

    Bundle "mhinz/vim-startify"

    " Colorschemes {{{
    "Solarized
    Bundle "altercation/vim-colors-solarized"

    "Color Themes
    Bundle "jnurmine/Zenburn"
    " }}}

    
    "CtrlP
    " Bundle "kien/ctrlp.vim"

    "Switch.vim
    Bundle "AndrewRadev/switch.vim.git"

    " Ack
    Bundle "ack.vim"
    noremap <LocalLeader># "ayiw:Ack <C-r>a<CR>
    vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>

    "NERD Commentator
    Bundle "scrooloose/nerdcommenter"

    "vim global session
    Bundle "http://github.com/c9s/gsession.vim"

    " "auto complete plugin
    " Bundle "https://github.com/Shougo/neocomplcache.git"
    " " Disable AutoComplPop.
    " let g:acp_enableAtStartup = 0
    " let g:neocomplcache_enable_auto_select = 1
    " let g:neocomplcache_enable_at_startup = 1

    "Syntastic
    Bundle "scrooloose/syntastic"
    autocmd FileType php set errorformat=%-GNo\ syntax\ errors\ detected\ in%.%#,PHP\ Parse\ error:\ %#syntax\ %trror\,\ %m\ in\ %f\ on\ line\ %l,PHP\ Fatal\ %trror:\ %m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %.%#,%-G\s%#,Parse\ error:\ %#syntax\ %trror\,\ %m\ in\ %f\ on\ line\ %l,Fatal\ %trror:\ %m\ in\ %f\ on\ line\ %l
    autocmd FileType phtml set errorformat=%-GNo\ syntax\ errors\ detected\ in%.%#,PHP\ Parse\ error:\ %#syntax\ %trror\,\ %m\ in\ %f\ on\ line\ %l,PHP\ Fatal\ %trror:\ %m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %.%#,%-G\s%#,Parse\ error:\ %#syntax\ %trror\,\ %m\ in\ %f\ on\ line\ %l,Fatal\ %trror:\ %m\ in\ %f\ on\ line\ %l

    "Tagbar
    Bundle "Tagbar"

    "JSLint
    Bundle "hallettj/jslint.vim"

    "Dash
    Bundle 'rizzatti/funcoo.vim'
    Bundle 'rizzatti/dash.vim'

    "PHPFold
    "Bundle "phpfolding.vim"

    "HTML5 Syntax highlighting
    Bundle "othree/html5.vim"

    "AfterColors
    Bundle "AfterColors.vim"

    "Vimproc (Dependency for Unite.vim)
    Bundle "Shougo/vimproc.vim"

    "Unite.vim
    Bundle "Shougo/unite.vim"

    "Unite-Ack
    Bundle "t9md/vim-unite-ack"

    "Vitality.vim
    Bundle "sjl/vitality.vim"

    "CtrlP
    " Bundle "kien/ctrlp.vim"
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

    "Powerline local themes
    Bundle "zhaocai/linepower.vim"

    "Vim Coffescript support
    Bundle "kchmck/vim-coffee-script"
    au BufRead,BufNewFile *.coffee     set filetype=coffee

    "Fountain.io
    Bundle "fountain.vim"
    au BufRead,BufNewFile *.fountain     set filetype=fountain

    "django
    Bundle "django.vim"

    "Soft Indents
    Bundle "nathanaelkane/vim-indent-guides.git"
    let g:indent_guides_auto_colors = 0
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

    " Signify, shows changed lines from git using the sign column
    Bundle 'mhinz/vim-signify'

    " original repos on github
    Bundle 'tpope/vim-fugitive'
    Bundle 'https://github.com/sjbach/lusty.git'
    Bundle 'Lokaltog/vim-easymotion'

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

" }}}
" Basic options ----------------------------------------------------------- {{{

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
set number
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
set dictionary=/usr/share/dict/words
set spellfile=~/.vim/custom-dictionary.utf-8.add

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800




" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Better Completion
set completeopt=longest,menuone,preview

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

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
" Trailing whitespace {{{
" Save {{{

" augroup its2012justfuckingsavealready
"     au!
"     au InsertLeave * :silent! wa
"     au CursorHold * :silent! wa
"     au CursorHoldI * :silent! wa
" augroup END

" }}}
" Only shown when not in insert mode so I don't go insane.

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
augroup END

" }}}
" Wildmenu completion {{{

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.class                          " Java Class files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib
set wildignore+=node_modules
set wildignore+=bower_components
set wildignore+=coverage

" }}}
" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}
" Tabs, spaces, wrapping {{{

set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=80
set colorcolumn=+1
set formatoptions=qrn1

" }}}
" Backups {{{

set undodir=~/.vim/tmp/undo/     " undo files
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files
set tags=~/.vim/tmp/tags
set backup                        " enable backups
set noswapfile                    " It's 2012, Vim.

" }}}
" Leader {{{

let mapleader = ","
let maplocalleader = "\\"

" }}}
" Window Movement {{{

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

" }}}
" Color scheme {{{

syntax on
" set background=light
set background=dark
" let g:badwolf_html_link_underline = 0
" let g:solarized_contrast = "high"
colors smyck

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

"Shortcut for Switch.vim
nnoremap - :Switch<cr>

" }}}
" Disable Arrow Keys {{{

" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

" }}}

" }}}
" Abbreviations ----------------------------------------------------------- {{{

function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

iabbrev ldis ಠ_ಠ
iabbrev lsad ಥ_ಥ
iabbrev lhap ಥ‿ಥ

iabbrev vrcf `~/.vimrc` file
inoremap <c-l> <c-k>l*

" }}}
" Convenience mappings ---------------------------------------------------- {{{

" Fuck you, help key.
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" Stop it, hash key.
inoremap # X<BS>#

" Kill window
nnoremap K :q<cr>

" Toggle line numbers
nnoremap <leader>n :setlocal number!<cr>

" Front and center
" Use :sus for the rare times I want to actually background Vim.
nnoremap <c-z> zvzz
vnoremap <c-z> <esc>zv`<ztgv

" Unfuck my screen
nnoremap <F3> :syntax sync fromstart<cr>:redraw!<cr>

" Tabs
nnoremap <leader>( :tabprev<cr>
nnoremap <leader>) :tabnext<cr>

" System clipboard interaction.  Mostly from:
" https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
noremap <leader>y "*y
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>
vnoremap <leader>y "*ygv

" I constantly hit "u" in visual mode when I mean to "y". Use "gu" for those rare occasions.
" From https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
vnoremap u <nop>
vnoremap gu u

" For some reason ctags refuses to ignore Python variables, so I'll just hack
" the tags file with sed and strip them out myself.
"
" Sigh.
nnoremap <leader><cr> :silent !/usr/local/bin/ctags -R . && sed -i .bak -E -e '/^[^	]+	[^	]+.py	.+v$/d' tags<cr>:redraw!<cr>

" Highlight Group(s)
nnoremap <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Send visual selection to gist.github.com as a private, filetyped Gist
" Requires the gist command line too (brew install gist)
" vnoremap <leader>G :w !gist -p -t %:e \| pbcopy<cr>
" vnoremap <leader>UG :w !gist -p \| pbcopy<cr>

" Send visual selection to paste.stevelosh.com
vnoremap <c-p> :w !curl -sF 'sprunge=<-' 'http://paste.stevelosh.com' \| tr -d '\n ' \| pbcopy && open `pbpaste`<cr>

" Insert the directory of the current buffer in command line mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" Change case
inoremap <C-u> <esc>mzgUiw`za

" Panic Button
nnoremap <f9> mzggg?G`z

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Diffoff
nnoremap <leader>D :diffoff!<cr>

" Formatting, TextMate-style
nnoremap Q gqip
vnoremap Q gq

" Reformat line.
" I never use l as a macro register anyway.
nnoremap ql ^vg_gq

" Easier linewise reselection
nnoremap <leader>V V`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" HTML tag closing
inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<cr>a

" Cmdheight switching
nnoremap <leader>1 :set cmdheight=1<cr>
nnoremap <leader>2 :set cmdheight=2<cr>

" Source
vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" Back find-repeat
" TODO: Why does this not work?
nnoremap … dd

" Marks and Quotes
noremap ' `
noremap æ '
noremap ` <C-^>

" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
nnoremap vv ^vg_

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" I suck at typing.
nnoremap <localleader>= ==
vnoremap - =

" Open new tab
map <F6> :tabnew<CR>

"Remapping jk/kj to escape
inoremap jk <Esc>
inoremap kj <Esc>

" Toggle paste
set pastetoggle=<F6>

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>

" Has to be an autocommand because repeat.vim eats the mapping otherwise :(
au VimEnter * :nnoremap U <c-r>

" Drag Lines {{{

" <m-j> and <m-k> to drag lines in any mode
noremap ∆ :m+<CR>
noremap ˚ :m-2<CR>
inoremap ∆ <Esc>:m+<CR>
inoremap ˚ <Esc>:m-2<CR>
vnoremap ∆ :m'>+<CR>gv
vnoremap ˚ :m-2<CR>gv

" }}}
" Easy filetype switching {{{

nnoremap _md :set ft=markdown<CR>
nnoremap _hd :set ft=htmldjango<CR>
nnoremap _jt :set ft=htmljinja<CR>
nnoremap _js :set ft=javascript<CR>
nnoremap _cw :set ft=confluencewiki<CR>
nnoremap _pd :set ft=python.django<CR>
nnoremap _d  :set ft=diff<CR>

" }}}
" Insert Mode Completion {{{

inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>

" }}}

" }}}
" Quick editing ----------------------------------------------------------- {{{

nnoremap <leader>ev :e $MYVIMRC<cr>

" }}}
" Searching and movement -------------------------------------------------- {{{

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

set scrolloff=3
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

runtime macros/matchit.vim
map <tab> %

" Made D behave
nnoremap D d$

" Don't move on *
nnoremap * *<c-o>

" Use c-\ to do c-] but open it in a new split.
nnoremap <c-\> <c-w>v<c-]>zvzz

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" gi already moves to "last place you exited insert mode", so we'll map gI to
" something similar: move to last change
nnoremap gI `.

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
" Highlight word {{{

nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>

" }}}
" Visual Mode */# from Scrooloose {{{

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" }}}
" List navigation {{{

nnoremap <left>  :cprev<cr>zvzz
nnoremap <right> :cnext<cr>zvzz
nnoremap <up>    :lprev<cr>zvzz
nnoremap <down>  :lnext<cr>zvzz

" }}}

" }}}
" Folding ----------------------------------------------------------------- {{{

set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" "Refocus" folds
nnoremap ,z zMzvzz

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
" Filetype-specific ------------------------------------------------------- {{{

" C {{{

augroup ft_c
    au!
    au FileType c setlocal foldmethod=syntax
augroup END

" }}}
" Clojure {{{

" function! SlimvToggleRepl()
"     if bufname('%') ==# 'SLIMV.REPL'
"         let origin = b:pop_back_to
"         q
"         execute "" . origin . "wincmd w"
"     else
"         let origin = winnr()
"         vertical botright split
"         e SLIMV.REPL
"         let b:pop_back_to = origin
"     endif
" endfunction

let g:slimv_leader = '\'
let g:slimv_keybindings = 2

augroup ft_clojure
    au!

    au BufNewFile,BufRead riemann.config set filetype=clojure
    au FileType clojure silent! call TurnOnClojureFolding()
    au FileType clojure compiler clojure
    au FileType clojure setlocal report=100000

    au BufWinEnter            SLIMV.REPL setlocal nolist
    au BufNewFile,BufReadPost SLIMV.REPL setlocal nowrap foldlevel=99
    au BufNewFile,BufReadPost SLIMV.REPL nnoremap <buffer> A GA
    au BufNewFile,BufReadPost SLIMV.REPL nnoremap <buffer> <localleader>R :emenu REPL.<Tab>

    " Fix the eval mappings.
    au FileType clojure nnoremap <buffer> <localleader>ef :<c-u>call SlimvEvalExp()<cr>
    au FileType clojure nnoremap <buffer> <localleader>ee :<c-u>call SlimvEvalDefun()<cr>

    " And the inspect mapping.
    au FileType clojure nmap <buffer> \i \di

    " And REPL-toggling mapping.
    " au FileType clojure nnoremap <buffer> \rr :call SlimvToggleRepl()<cr>

    " Indent top-level form.
    au FileType clojure nmap <buffer> <localleader>= mz99[(v%='z
augroup END

" }}}
" Gradle {{{

augroup ft_gradle
    au!
    au BufNewFile,BufRead *.gradle set filetype=groovy
augroup END

" }}}
" Clojurescript {{{

augroup ft_clojurescript
    au!

    au BufNewFile,BufRead *.cljs set filetype=clojurescript
    au FileType clojurescript call TurnOnClojureFolding()

    " Indent top-level form.
    au FileType clojurescript nmap <buffer> <localleader>= v((((((((((((=%
augroup END

" }}}
" Confluence {{{

augroup ft_c
    au!

    au BufRead,BufNewFile *.confluencewiki setlocal filetype=confluencewiki

    " Wiki pages should be soft-wrapped.
    au FileType confluencewiki setlocal wrap linebreak nolist
augroup END

" }}}
" Cram {{{

let cram_fold=1

augroup ft_cram
    au!

    au BufNewFile,BufRead *.t set filetype=cram
    au Syntax cram setlocal foldlevel=1
augroup END

" }}}
" CSS and LessCSS {{{

augroup ft_css
    au!

    au BufNewFile,BufRead *.less setlocal filetype=css

    au Filetype less,css setlocal foldmethod=marker
    au Filetype less,css setlocal foldmarker={,}
    au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype less,css setlocal iskeyword+=-

    " Use <leader>S to sort properties.  Turns this:
    "
    "     p {
    "         width: 200px;
    "         height: 100px;
    "         background: red;
    "
    "         ...
    "     }
    "
    " into this:

    "     p {
    "         background: red;
    "         height: 100px;
    "         width: 200px;
    "
    "         ...
    "     }
    au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" }}}
" Django {{{

augroup ft_django
    au!

    au BufNewFile,BufRead urls.py           setlocal nowrap
    au BufNewFile,BufRead urls.py           normal! zR
    au BufNewFile,BufRead dashboard.py      normal! zR
    au BufNewFile,BufRead local_settings.py normal! zR

    au BufNewFile,BufRead admin.py     setlocal filetype=python.django
    au BufNewFile,BufRead urls.py      setlocal filetype=python.django
    au BufNewFile,BufRead models.py    setlocal filetype=python.django
    au BufNewFile,BufRead views.py     setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal foldmethod=marker
    au BufNewFile,BufRead forms.py     setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal foldmethod=marker
augroup END

" }}}
" Firefox {{{

augroup ft_firefox
    au!
    au BufRead,BufNewFile ~/Library/Caches/*.html setlocal buftype=nofile
augroup END

" }}}
" Fish {{{

augroup ft_fish
    au!

    au BufNewFile,BufRead *.fish setlocal filetype=fish

    au FileType fish setlocal foldmethod=marker foldmarker={{{,}}}
augroup END

" }}}
" Haskell {{{

augroup ft_haskell
    au!
    au BufEnter *.hs compiler ghc
augroup END

" }}}
" HTML and HTMLDjango {{{

"let g:html_indent_tags = ['p', 'li']
let g:html_indent_tags = 'html\|p\|li\|time'

augroup ft_html
    au!

    au BufNewFile,BufRead *.html setlocal filetype=html
    au BufNewFile,BufRead *.phtml setlocal filetype=html

    au FileType html,jinja,htmldjango setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>f Vatzf

    " Use <localleader>t to fold the current templatetag.
    au FileType html,jinja,htmldjango nmap <buffer> <localleader>t viikojozf

    " Smarter pasting
    au FileType html,jinja,htmldjango nnoremap <buffer> p :<C-U>YRPaste 'p'<CR>v`]=`]
    au FileType html,jinja,htmldjango nnoremap <buffer> P :<C-U>YRPaste 'P'<CR>v`]=`]
    au FileType html,jinja,htmldjango nnoremap <buffer> π :<C-U>YRPaste 'p'<CR>
    au FileType html,jinja,htmldjango nnoremap <buffer> ∏ :<C-U>YRPaste 'P'<CR>

    " Indent tag
    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>= Vat=

    " Django tags
    au FileType jinja,htmldjango inoremap <buffer> <c-t> {%<space><space>%}<left><left><left>

    " Django variables
    au FileType jinja,htmldjango inoremap <buffer> <c-f> {{<space><space>}}<left><left><left>
augroup END

" }}}
" Java {{{

augroup ft_java
    au!

    au FileType java setlocal foldmethod=marker
    au FileType java setlocal foldmarker={,}
augroup END

" }}}
" Javascript {{{

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>

    let b:switch_definitions = 
                \ [
                \   [ 'true', 'false' ]
                \ ]
augroup END

" }}}
" Lisp {{{

augroup ft_lisp
    au!
    au FileType lisp call TurnOnLispFolding()
augroup END

" }}}
" Mail {{{

augroup ft_mail
    au!

    au Filetype mail setlocal spell
augroup END

" }}}
" Markdown {{{

augroup ft_markdown
    au!

    au BufNewFile,BufRead *.m*down setlocal filetype=markdown

    " Use <localleader>1/2/3 to add headings.
    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
    au Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>
augroup END

" }}}
" Mercurial {{{

augroup ft_mercurial
    au!

    au BufNewFile,BufRead *hg-editor-*.txt setlocal filetype=hgcommit
augroup END

" }}}
" Mutt {{{

augroup ft_muttrc
    au!

    au BufRead,BufNewFile *.muttrc set ft=muttrc

    au FileType muttrc setlocal foldmethod=marker foldmarker={{{,}}}
augroup END

" }}}
" Nginx {{{

augroup ft_nginx
    au!

    au BufRead,BufNewFile /etc/nginx/conf/*                      set ft=nginx
    au BufRead,BufNewFile /etc/nginx/sites-available/*           set ft=nginx
    au BufRead,BufNewFile /usr/local/etc/nginx/sites-available/* set ft=nginx
    au BufRead,BufNewFile vhost.nginx                            set ft=nginx

    au FileType nginx setlocal foldmethod=marker foldmarker={,}
augroup END

" }}}
" OrgMode {{{

augroup ft_org
    au!

    au Filetype org nmap <buffer> Q vahjgq
    au Filetype org setlocal nolist
augroup END

" }}}
" Pentadactyl {{{

augroup ft_pentadactyl
    au!
    au BufNewFile,BufRead .pentadactylrc set filetype=pentadactyl
    au BufNewFile,BufRead ~/Library/Caches/TemporaryItems/pentadactyl-*.tmp set nolist wrap linebreak columns=100 colorcolumn=0
augroup END

" }}}
" PHP {{{

augroup ft_php
    au!
    let b:switch_definitions = 
                \ [
                \   [ 'public', 'private', 'protected']
                \ ]
augroup END

" }}}
" Puppet {{{

augroup ft_puppet
    au!

    au Filetype puppet setlocal foldmethod=marker
    au Filetype puppet setlocal foldmarker={,}
augroup END

" }}}
" Python {{{

augroup ft_python
    au!

    " au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType python setlocal define=^\s*\\(def\\\\|class\\)
    " au FileType python compiler nose
    au FileType man nnoremap <buffer> <cr> :q<cr>

    " Jesus tapdancing Christ, built-in Python syntax, you couldn't let me
    " override this in a normal way, could you?
    au FileType python if exists("python_space_error_highlight") | unlet python_space_error_highlight | endif

    " Jesus, Python.  Five characters of punctuation for a damn string?
    au FileType python inoremap <buffer> <c-g> _(u'')<left><left>

    au FileType python inoremap <buffer> <c-b> """"""<left><left><left>
augroup END

" }}}
" QuickFix {{{

augroup ft_quickfix
    au!
    au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap tw=0
augroup END

" }}}
" ReStructuredText {{{

augroup ft_rest
    au!

    au Filetype rst nnoremap <buffer> <localleader>1 yypVr=
    au Filetype rst nnoremap <buffer> <localleader>2 yypVr-
    au Filetype rst nnoremap <buffer> <localleader>3 yypVr~
    au Filetype rst nnoremap <buffer> <localleader>4 yypVr`
augroup END

" }}}
" Riemann Config Files {{{

augroup ft_riemann
    au!

    au BufNewFile,BufRead riemann.config set filetype=clojure
    au BufNewFile,BufRead riemann.config nnoremap <buffer> <localleader>= mzgg=G`z
augroup END

" }}}
" Ruby {{{

augroup ft_ruby
    au!
    au Filetype ruby setlocal foldmethod=syntax
augroup END

" }}}
" Vagrant {{{

augroup ft_vagrant
    au!
    au BufRead,BufNewFile Vagrantfile set ft=ruby
augroup END

" }}}
" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}

" }}}
" Plugin settings --------------------------------------------------------- {{{

" EnableFastPHPFolds {{{

    " Don't use the PHP syntax folding
    "setlocal foldmethod=manual
    " Turn on PHP fast folds
    "EnableFastPHPFolds
    "augroup SetPhpFolds
    "autocmd BufReadPost *
                "\ if &filetype == "php" |
                "\ setlocal foldlevel=1 |
                "\ endif
    "augroup end

" }}}

" Ack {{{

nnoremap <leader>a :Ack!<space>

" }}}
" Autoclose {{{

nmap <Leader>x <Plug>ToggleAutoCloseMappings

" }}}
" Clam {{{

nnoremap ! :Clam<space>
vnoremap ! :ClamVisual<space>
let g:clam_autoreturn = 1
let g:clam_debug = 1

" }}}
" Commentary {{{

"nmap <leader>c <Plug>CommentaryLine
"xmap <leader>c <Plug>Commentary

augroup plugin_commentary
    au!
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    au FileType clojurescript setlocal commentstring=;\ %s
    au FileType puppet setlocal commentstring=#\ %s
    au FileType fish setlocal commentstring=#\ %s
augroup END

" }}}
" CoffeeScript {{{
" vim-coffee-script

nnoremap <leader>cs :CoffeeWatch<CR>
nnoremap <leader>cv :CoffeeWatch vertical<CR>

" }}}
" Easymotion {{{

let g:EasyMotion_do_mapping = 0

nnoremap <silent> <Leader>f      :call EasyMotion#F(0, 0)<CR>
onoremap <silent> <Leader>f      :call EasyMotion#F(0, 0)<CR>
vnoremap <silent> <Leader>f :<C-U>call EasyMotion#F(1, 0)<CR>

nnoremap <silent> <Leader>F      :call EasyMotion#F(0, 1)<CR>
onoremap <silent> <Leader>F      :call EasyMotion#F(0, 1)<CR>
vnoremap <silent> <Leader>F :<C-U>call EasyMotion#F(1, 1)<CR>

onoremap <silent> <Leader>t      :call EasyMotion#T(0, 0)<CR>
onoremap <silent> <Leader>T      :call EasyMotion#T(0, 1)<CR>

" }}}
" Fugitive {{{

nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

" "Hub"
nnoremap <leader>H :Gbrowse<cr>
vnoremap <leader>H :Gbrowse<cr>

" }}}
" CommandT {{{

map <F5> :CommandT<CR>
map <Leader>p :CommandT<CR>
let g:CommandTWildIgnore=&wildignore . ",**/bower_components/*,coverage/*,**/node_modules/*"

" }}}
" Grails {{{
let g:GrailsMapPrefix='<leader>a'
" }}}
" Gundo {{{

let g:gundo_debug = 1
let g:gundo_preview_bottom = 1
let g:gundo_tree_statusline = "Gundo"
let g:gundo_preview_statusline = "Gundo Preview"

" }}}
" Haskellmode {{{

let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
let g:ghc = "/usr/local/bin/ghc"

" }}}
" HTML5 {{{

"let g:event_handler_attributes_complete = 0
"let g:rdfa_attributes_complete = 0
"let g:microdata_attributes_complete = 0
"let g:atia_attributes_complete = 0

" }}}
" Jslint {{{
let g:JSLintHighlightErrorLine = 0
" }}}
" Linediff {{{

vnoremap <leader>l :Linediff<cr>
nnoremap <leader>L :LinediffReset<cr>

" }}}
" Lisp (built-in) {{{

let g:lisp_rainbow = 1

" }}}
" Makegreen {{{

nnoremap \| :call MakeGreen('')<cr>

" }}}
" NERD Tree {{{

noremap  <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>

augroup ps_nerdtree
    au!

    au Filetype nerdtree setlocal nolist
    " au Filetype nerdtree nnoremap <buffer> K :q<cr>
augroup END

let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
                    \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
                    \ '.*\.o$', 'db.db', 'tags.bak']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeMapJumpFirstChild = 'gK'

" }}}
" NERD Commentator {{{

" }}}
" OrgMode {{{

let g:org_plugins = ['ShowHide', '|', 'Navigator', 'EditStructure', '|', 'Todo', 'Date', 'Misc']

let g:org_todo_keywords = ['TODO', '|', 'DONE']

let g:org_debug = 1

" }}}
" Powerline {{{

let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_enabled = 1
" let g:Powerline_colorscheme = 'badwolf'

" }}}
" Python-Mode {{{

let g:pymode_doc = 1
let g:pymode_doc_key = '<localleader>ds'
let g:pydoc = 'pydoc'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 0
let g:pymode_syntax_builtin_objs = 1
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_space_errors = 0
let g:pymode_run = 0
let g:pymode_lint = 0
let g:pymode_breakpoint = 0
let g:pymode_utils_whitespaces = 0
let g:pymode_virtualenv = 0
let g:pymode_folding = 0

let g:pymode_options_indent = 0
let g:pymode_options_fold = 0
let g:pymode_options_other = 0

let g:pymode_rope = 1
let g:pymode_rope_global_prefix = "<localleader>R"
let g:pymode_rope_local_prefix = "<localleader>r"
let g:pymode_rope_auto_project = 1
let g:pymode_rope_enable_autoimport = 0
let g:pymode_rope_autoimport_generate = 1
let g:pymode_rope_autoimport_underlineds = 0
let g:pymode_rope_codeassist_maxfixes = 10
let g:pymode_rope_sorted_completions = 1
let g:pymode_rope_extended_complete = 1
let g:pymode_rope_autoimport_modules = ["os", "shutil", "datetime"]
let g:pymode_rope_confirm_saving = 1
let g:pymode_rope_vim_completion = 1
let g:pymode_rope_guess_project = 1
let g:pymode_rope_goto_def_newwin = 0
let g:pymode_rope_always_show_complete_menu = 0

" }}}
" Scratch {{{

command! ScratchToggle call ScratchToggle()

function! ScratchToggle()
    if exists("w:is_scratch_window")
        unlet w:is_scratch_window
        exec "q"
    else
        exec "normal! :Sscratch\<cr>\<C-W>J:resize 13\<cr>"
        let w:is_scratch_window = 1
    endif
endfunction

nnoremap <silent> <leader><tab> :ScratchToggle<cr>

" }}}
" Signify {{{
let g:signify_mapping_next_hunk = '<leader>gj'
let g:signify_mapping_prev_hunk = '<leader>gk'
let g:signify_mapping_toggle_highlight = '<leader>gh'

let g:signify_sign_add               = '+'
let g:signify_sign_change            = '!'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'

let g:signify_sign_overwrite = 1

let g:signify_update_on_bufenter = 1

let g:signify_line_highlight = 0
" }}}
" SLIMV {{{

let g:slimv_repl_name = 'SLIMV.REPL'
let g:slimv_repl_split = 4
" let g:slimv_repl_syntax = 0
let g:slimv_repl_wrap = 0

let g:paredit_mode = 0

" Use a swank command that works, and doesn't require new app windows.
let g:slimv_swank_clojure = '!dtach -n /tmp/dtach-swank.sock -r winch lein swank'

" }}}}
" Supertab {{{

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabLongestHighlight = 1
let g:SuperTabCrMapping = 1

"}}}
" Syntastic {{{

let g:syntastic_enable_signs = 0
let g:syntastic_check_on_open = 1
let g:syntastic_disabled_filetypes = ['html', 'rst']
let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
let g:syntastic_jsl_conf = '$HOME/.vim/jsl.conf'

" }}}
" Splice {{{

" let g:splice_leader = "-"

let g:splice_initial_mode = "grid"

let g:splice_initial_layout_grid = 0
let g:splice_initial_layout_loupe = 0
let g:splice_initial_layout_compare = 0
let g:splice_initial_layout_path = 0

let g:splice_initial_diff_grid = 1
let g:splice_initial_diff_loupe = 0
let g:splice_initial_diff_compare = 1
let g:splice_initial_diff_path = 0

let g:splice_initial_scrollbind_grid = 0
let g:splice_initial_scrollbind_loupe = 0
let g:splice_initial_scrollbind_compare = 0
let g:splice_initial_scrollbind_path = 0

let g:splice_wrap = "nowrap"

" }}}
" tslime {{{

let g:tslime_ensure_trailing_newlines = 1
let g:tslime_normal_mapping = '<localleader>t'
let g:tslime_visual_mapping = '<localleader>t'
let g:tslime_vars_mapping = '<localleader>T'

" }}}
" TagBar {{{

map <Leader>3 :TagbarToggle<CR>
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/local/bin/jsctags'
\ }

" }}}
" Unite {{{
let g:unite_data_directory='~/.vim/tmp/unite'
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=5000
let g:unite_prompt='» '

" To track long mru history.
let g:unite_source_file_mru_long_limit = 3000
let g:unite_source_directory_mru_long_limit = 3000

" Like ctrlp.vim settings.
let g:unite_enable_start_insert = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'

" For ack.
if executable('ack-grep')
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
    let g:unite_source_grep_recursive_opt = ''
endif

" Default Unite filter/matcher/sorter overrides {{{
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])
" call unite#set_profile('files', 'smartcase', 1)
" call unite#custom#source('line,outline','matchers','matcher_fuzzy')
" call unite#custom#source('buffer,file,file_mru,file_rec/async', 'sorters', 'sorter_rank')
call unite#custom#source('file_rec/async', 'ignore_pattern', '\%(^\|/\)\.$\|\~$\|\.\%(o\|exe\|dll\|bak\|DS_Store\|zwc\|pyc\|sw[po]\|class\)$'.
            \'\|\%(^\|/\)\%(\.hg\|coverage\|node_modules\|\.git\|\.bzr\|\.svn\|tags\%(-.*\)\?\)\%($\|/\)')
" }}}

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    " Overwrite settings.

    nmap <buffer> <ESC>      <Plug>(unite_exit)
    nmap <buffer> K      <Plug>(unite_exit)
    imap <buffer> jj      <Plug>(unite_insert_leave)
    "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

    imap <buffer><expr> j unite#smart_map('j', '')
    imap <buffer> <TAB>   <Plug>(unite_select_next_line)
    imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
    imap <buffer> '     <Plug>(unite_quick_match_default_action)
    nmap <buffer> '     <Plug>(unite_quick_match_default_action)
    imap <buffer><expr> x
                \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
    nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
    nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
    nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    nnoremap <silent><buffer><expr> l
                \ unite#smart_map('l', unite#do_action('default'))

    let unite = unite#get_current_unite()
    if unite.buffer_name =~# '^search'
        nnoremap <silent><buffer><expr> r     unite#do_action('replace')
    else
        nnoremap <silent><buffer><expr> r     unite#do_action('rename')
    endif

    nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
    nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
                \ empty(unite#mappings#get_current_filters()) ?
                \ ['sorter_reverse'] : [])

    " Runs "split" action by <C-s>.
    imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction"}}}

" Replace CtrlP
" nnoremap <leader>p :<C-u>Unite file_rec/async:!<cr>

" MRU Files
nnoremap <leader>m :<C-u>Unite file_mru:!<cr>

" Replace Grep
" nnoremap <leader>/ :Unite grep:.<cr>
nnoremap <leader>/ :Unite ack:directory:.<CR>

" Enable searching Yank History
nnoremap <leader>y :Unite history/yank<cr>

" Buffer switching like LustyJuggler
" nnoremap <leader>s :Unite -quick-match buffer<cr>
" }}}
" VimClojure {{{

let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1
let vimclojure#WantNailgun = 0

" }}}
" YankRing {{{

let g:yankring_history_dir = '~/.vim/tmp/' " backups
function! YRRunAfterMaps()
    nnoremap Y :<C-U>YRYankCount 'y$'<CR>
    omap <expr> L YRMapsExpression("", "$")
    omap <expr> H YRMapsExpression("", "^")
endfunction

" }}}

" }}}
" Text objects ------------------------------------------------------------ {{{

" Shortcut for [] {{{

onoremap ir i[
onoremap ar a[
vnoremap ir i[
vnoremap ar a[

" }}}
" Next and Last {{{

" Motion for "next/last object". For example, "din(" would go to the next "()"
" pair and delete its contents.

onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "r"
      let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction

" }}}
" Numbers {{{

" Motion for numbers.  Great for CSS.  Lets you do things like this:
"
" margin-top: 200px; -> daN -> margin-top: px;
"              ^                          ^
" TODO: Handle floats.

onoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
xnoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
onoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
onoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>

function! s:NumberTextObject(whole)
    normal! v

    while getline('.')[col('.')] =~# '\v[0-9]'
        normal! l
    endwhile

    if a:whole
        normal! o

        while col('.') > 1 && getline('.')[col('.') - 2] =~# '\v[0-9]'
            normal! h
        endwhile
    endif
endfunction

" }}}

" }}}
" Mini-plugins ------------------------------------------------------------ {{{
" Stuff that should probably be broken out into plugins, but hasn't proved to be
" worth the time to do so just yet.

" Synstack {{{

" Show the stack of syntax hilighting classes affecting whatever is under the
" cursor.
function! SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc

nnoremap <F7> :call SynStack()<CR>

" }}}
" Diffwhite Toggle {{{

set diffopt-=iwhite
let g:diffwhitespaceon = 1
function! ToggleDiffWhitespace()
    if g:diffwhitespaceon
        set diffopt-=iwhite
        let g:diffwhitespaceon = 0
    else
        set diffopt+=iwhite
        let g:diffwhitespaceon = 1
    endif
    diffupdate
endfunc

nnoremap <leader>dw :call ToggleDiffWhitespace()<CR>

" }}}
" Error Toggles {{{

command! ErrorsToggle call ErrorsToggle()
function! ErrorsToggle() " {{{
  if exists("w:is_error_window")
    unlet w:is_error_window
    exec "q"
  else
    exec "Errors"
    lopen
    let w:is_error_window = 1
  endif
endfunction " }}}

command! -bang -nargs=? QFixToggle call QFixToggle(<bang>0)
function! QFixToggle(forced) " {{{
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction " }}}

nmap <silent> <f3> :ErrorsToggle<cr>
nmap <silent> <f4> :QFixToggle<cr>

" }}}
" Fake Paredit {{{

" TODO: Make this stuff not suck.
nnoremap <leader>> xEp
nnoremap <leader>< xgEp

" }}}
" Ack motions {{{

" Motions to Ack for things.  Works with pretty much everything, including:
"
"   w, W, e, E, b, B, t*, f*, i*, a*, and custom text objects
"
" Awesome.
"
" Note: If the text covered by a motion contains a newline it won't work.  Ack
" searches line-by-line.

nnoremap <silent> <leader>A :set opfunc=<SID>AckMotion<CR>g@
xnoremap <silent> <leader>A :<C-U>call <SID>AckMotion(visualmode())<CR>

nnoremap <bs> :Ack! '\b<c-r><c-w>\b'<cr>
xnoremap <silent> <bs> :<C-U>call <SID>AckMotion(visualmode())<CR>

function! s:CopyMotionForType(type)
    if a:type ==# 'v'
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'char'
        silent execute "normal! `[v`]y"
    endif
endfunction

function! s:AckMotion(type) abort
    let reg_save = @@

    call s:CopyMotionForType(a:type)

    execute "normal! :Ack! --literal " . shellescape(@@) . "\<cr>"

    let @@ = reg_save
endfunction

" }}}
" Indent Guides {{{

let g:indentguides_state = 1
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}
hi def IndentGuides guibg=#303030
nnoremap <leader>I :call IndentGuides()<cr>

" }}}
" Block Colors {{{

let g:blockcolor_state = 0
function! BlockColor() " {{{
    if g:blockcolor_state
        let g:blockcolor_state = 0
        call matchdelete(77881)
        call matchdelete(77882)
        call matchdelete(77883)
        call matchdelete(77884)
        call matchdelete(77885)
    else
        let g:blockcolor_state = 1
        call matchadd("BlockColor1", '^ \{4}.*', 1, 77881)
        call matchadd("BlockColor2", '^ \{8}.*', 2, 77882)
        call matchadd("BlockColor3", '^ \{12}.*', 3, 77883)
        call matchadd("BlockColor4", '^ \{16}.*', 4, 77884)
        call matchadd("BlockColor5", '^ \{20}.*', 5, 77885)
    endif
endfunction " }}}
" Default highlights {{{
hi def BlockColor1 guibg=#222222
hi def BlockColor2 guibg=#2a2a2a
hi def BlockColor3 guibg=#353535
hi def BlockColor4 guibg=#3d3d3d
hi def BlockColor5 guibg=#444444
" }}}
nnoremap <leader>B :call BlockColor()<cr>

" }}}

" }}}
" Environments (GUI/Console) ---------------------------------------------- {{{

if has('gui_running')
    " GUI Vim

    set guifont=PragmataPro:h12

    " Remove all the UI cruft
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R

    highlight SpellBad term=underline gui=undercurl guisp=Orange

    " Different cursors for different modes.
    set guicursor=n-c:block-Cursor-blinkon0
    set guicursor+=v:block-vCursor-blinkon0
    "set guicursor+=i-ci:ver20-iCursor

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

    " Mouse support
    set mouse=a
endif

" }}}
