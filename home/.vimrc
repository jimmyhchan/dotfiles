" .vimrc
" Author: Steve Losh <steve@stevelosh.com>
" Source: http://bitbucket.org/sjl/dotfiles/src/tip/vim/
"
" This file changes a lot.  I'll try to document pieces of it whenever I have
" a few minutes to kill.

" Preamble -------------------------------------------------------------------- {{{

"vundle 
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'delimitMate.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-unimpaired'



"  language specific
Bundle 'jimmyhchan/dustjs.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'juvenn/mustache.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'skammer/vim-css-color'

" syntastic
Bundle 'gillesruppert/jshint.vim'

"  snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
Bundle "garbas/vim-snipmate"

"  colorscheme
" Bundle "tomasr/molokai"
" colorscheme molokai
Bundle "Wombat"
colorscheme wombat
" Bundle "jellybeans.vim"
" colorscheme jellybeans
" Bundle "Zenburn"
" colorscheme zenburn

filetype plugin indent on

" }}}
" Basic options --------------------------------------------------------------- {{{

set encoding=utf-8
set modelines=0
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
"set nonumber
"set norelativenumber
set laststatus=2
set history=1000
if has('gui_macvim')
  set undofile "7.3 macvim
  set undoreload=10000
end
set cpoptions+=J
set list
set listchars=tab:▸\ ,eol:¬
set shell=/bin/bash
set lazyredraw
set wildignore+=*.pyc,.hg,.git
set matchtime=3
set showbreak=↪

" Save when losing focus
" au FocusLost * :wa

" Tabs, spaces, wrapping {{{

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
"set textwidth=85
set formatoptions=qrn1
"set colorcolumn=+1

" }}}
" Status line {{{

" set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

" }}}
" Backups {{{

if has('gui_macvim')
  set undodir=~/.vim/tmp/undo//     " undo files
end
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups

" }}}
" Leader {{{

"let mapleader = ","
"let maplocalleader = "\\"

" }}}
" Color scheme {{{

syntax on
set background=dark

" }}}

" }}}
" Useful abbreviations -------------------------------------------------------- {{{

" iabbrev ldis ಠ_ಠ
" iabbrev sl/ http://stevelosh.com/
" iabbrev bb/ http://bitbucket.org/
" iabbrev bbs/ http://bitbucket.org/sjl/
" iabbrev sl@ steve@stevelosh.com

" }}}
" Searching and movement ------------------------------------------------------ {{{

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase

set incsearch
set showmatch
set hlsearch

" this is too confusing
" set gdefault

set virtualedit+=block

"map <leader><space> :noh<cr>

runtime macros/matchit.vim
map <tab> %

nnoremap Y y$
nnoremap D d$

" Keep search matches in the middle of the window.
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

" L is easier to type, and I never use the default behavior.
noremap L $

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" Open a Quickfix window for the last search
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Error navigation {{{
"
"             Location List     QuickFix Window
"            (e.g. Syntastic)     (e.g. Ack)
"            ----------------------------------
" Next      |     M-k               M-Down     |
" Previous  |     M-l                M-Up      |
"            ----------------------------------
"
nnoremap ˚ :lnext<cr>zvzz
nnoremap ¬ :lprevious<cr>zvzz
inoremap ˚ <esc>:lnext<cr>zvzz
inoremap ¬ <esc>:lprevious<cr>zvzz
nnoremap <m-Down> :cnext<cr>zvzz
nnoremap <m-Up> :cprevious<cr>zvzz
" }}}

" Directional Keys {{{

" Why stretch?
"noremap h ;
"noremap j h
"noremap k gj
"noremap l gk
"noremap ; l

" Easy buffer navigation
" Note: For this section to make any sense you need to remap Ctrl-; to Ctrl-g at
"       the KEYBOARD level.  The reason is that for some reason the OS X doesn't
"       recognize the Ctrl+; combination as something special, so it just passes it
"       to Vim as a semicolon.
"
"       Yeah, it's dumb.
noremap <C-j>  <C-w>h
noremap <C-k>  <C-w>j
noremap <C-l>  <C-w>k
noremap <C-g>  <C-w>l
noremap <leader>g <C-w>v<C-w>l

" }}}

" }}}
" Folding --------------------------------------------------------------------- {{{

set foldlevelstart=20

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO


" }}}
" Destroy infuriating keys ---------------------------------------------------- {{{

" Fuck you, help key.
if has('gui_macvim')
  set fuoptions=maxvert,maxhorz
end
noremap <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" Fuck you too, manual key.
nnoremap K <nop>

" Stop it, hash key.
inoremap # X<BS>#

" }}}
" Various filetype-specific stuff --------------------------------------------- {{{

" Cram {{{

au BufNewFile,BufRead *.t set filetype=cram

let cram_fold=1
autocmd Syntax cram setlocal foldlevel=1

" }}}
" Clojure {{{

au FileType clojure call TurnOnClojureFolding()

" Eval toplevel form, even when you're on the opening paren.
au FileType clojure nmap <localleader>ee 0;\et

" }}}
" C {{{

au FileType c setlocal foldmethod=syntax

" }}}
" HTML and HTMLDjango {{{

"au BufNewFile,BufRead *.html setlocal filetype=htmldjango
au BufNewFile,BufRead *.html setlocal foldmethod=manual

" Use <localleader>f to fold the current tag.
au BufNewFile,BufRead *.html nnoremap <buffer> <localleader>f Vatzf

" Use Shift-Return to turn this:
"     <tag>|</tag>
"
" into this:
"     <tag>
"         |
"     </tag>
au BufNewFile,BufRead *.html inoremap <buffer> <s-cr> <cr><esc>kA<cr>
au BufNewFile,BufRead *.html nnoremap <buffer> <s-cr> vit<esc>a<cr><esc>vito<esc>i<cr><esc>

" Sparkup mappings:
"
" <c-e><space> to expand sparkup normally:
"     <p>|</p>
"
" <c-e><return> to force an expanded sparkup.
"     <p>
"         |
"     </p>
au BufNewFile,BufRead *.html imap <buffer> <c-s><cr> <c-s><s-cr>
au BufNewFile,BufRead *.html imap <buffer> <c-s><space> <c-s>.<bs>

" Django tags
"au FileType jinja,htmldjango inoremap <buffer> <c-t> {%<space><space>%}<left><left><left>

" Django variables
"au FileType jinja,htmldjango inoremap <buffer> <c-f> {{<space><space>}}<left><left><left>

" }}}
" CSS, SCSS, and LessCSS {{{

au BufNewFile,BufRead *.less setlocal filetype=less
au BufNewFile,BufRead *.scss setlocal filetype=scss

au BufNewFile,BufRead *.css  setlocal foldmethod=marker
au BufNewFile,BufRead *.scss  setlocal foldmethod=marker
au BufNewFile,BufRead *.less setlocal foldmethod=marker

au BufNewFile,BufRead *.scss  setlocal foldmarker={,}
au BufNewFile,BufRead *.css  setlocal foldmarker={,}
au BufNewFile,BufRead *.less setlocal foldmarker={,}

" Use cc to change lines without borking the indentation.
au BufNewFile,BufRead *.scss  nnoremap <buffer> cc ddko
au BufNewFile,BufRead *.css  nnoremap <buffer> cc ddko
au BufNewFile,BufRead *.less nnoremap <buffer> cc ddko

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
"
au BufNewFile,BufRead *.scss  nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
au BufNewFile,BufRead *.css  nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
au BufNewFile,BufRead *.less nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
" positioned inside of them AND the following code doesn't get unfolded.
au BufNewFile,BufRead *.scss  inoremap <buffer> {<cr> {}<left><cr>.<cr><esc>kA<bs><space><space><space><space>
au BufNewFile,BufRead *.css  inoremap <buffer> {<cr> {}<left><cr>.<cr><esc>kA<bs><space><space><space><space>
au BufNewFile,BufRead *.less inoremap <buffer> {<cr> {}<left><cr>.<cr><esc>kA<bs><space><space><space><space>

" }}}
" Javascript {{{

au FileType javascript setlocal foldmethod=marker
au FileType javascript setlocal foldmarker={,}

" }}}
" Confluence {{{

au BufRead,BufNewFile *.confluencewiki setlocal filetype=confluencewiki

" Wiki pages should be soft-wrapped.
au FileType confluencewiki setlocal wrap linebreak nolist

" }}}
" Fish {{{

au BufNewFile,BufRead *.fish setlocal filetype=fish

" }}}
" Markdown {{{

au BufNewFile,BufRead *.m*down setlocal filetype=markdown

" Use <localleader>1/2/3 to add headings.
au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
au Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>

" }}}
" Vim {{{

au FileType vim setlocal foldmethod=marker
au FileType help setlocal textwidth=78

" }}}
" Python {{{

au Filetype python noremap  <localleader>rr :RopeRename<CR>
au Filetype python vnoremap <localleader>rm :RopeExtractMethod<CR>
au Filetype python noremap  <localleader>ri :RopeOrganizeImports<CR>

" }}}
" Django {{{

au BufNewFile,BufRead urls.py      setlocal nowrap
au BufNewFile,BufRead urls.py      normal! zR
au BufNewFile,BufRead settings.py  normal! zR
au BufNewFile,BufRead dashboard.py normal! zR

" }}}
" Nginx {{{

au BufRead,BufNewFile /etc/nginx/conf/*                      set ft=nginx
au BufRead,BufNewFile /etc/nginx/sites-available/*           set ft=nginx
au BufRead,BufNewFile /usr/local/etc/nginx/sites-available/* set ft=nginx

" }}}
" Pentadactyl {{{

au BufNewFile,BufRead .pentadactylrc set filetype=pentadactyl

" }}}

" }}}
" Convenience mappings -------------------------------------------------------- {{{

" Clean whitespace
map <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Ack
map <leader>a :Ack 

" Yankring
nnoremap <silent> <F6> :YRShow<cr>

" Formatting, TextMate-style
nnoremap <leader>q gqip

" Easier linewise reselection
nnoremap <leader>v V`]

" HTML tag closing
inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<cr>a

" Faster Esc
" inoremap jk <ESC>

" Marks and Quotes
noremap ' `
noremap æ '
noremap ` <C-^>

" Scratch
nmap <leader><tab> :Sscratch<cr><C-W>x<C-j>:resize 15<cr>

" Better Completion
set completeopt=longest,menuone
inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-p> pumvisible() ? '<C-n>'  : '<C-n><C-r>=pumvisible() ? "\<lt>up>" : ""<CR>'
inoremap <expr> <C-n> pumvisible() ? '<C-n>'  : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Make selecting inside an HTML tag less dumb
nnoremap Vit vitVkoj
nnoremap Vat vatV

" Rainbows!
nmap <leader>R :RainbowParenthesesToggle<CR>

" Edit vim stuff
nnoremap <leader>ev <C-w>s<C-w>j<C-w>L:e $MYVIMRC<cr>
nnoremap <leader>es <C-w>s<C-w>j<C-w>L:e ~/.vim/snippets/<cr>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Easy filetype switching
nnoremap _hd :set ft=htmldjango<CR>
nnoremap _jt :set ft=htmljinja<CR>
nnoremap _cw :set ft=confluencewiki<CR>
nnoremap _pd :set ft=python.django<CR>
nnoremap _d  :set ft=diff<CR>
nnoremap _a  :AnsiEsc<CR>

" Toggle paste
"set pastetoggle=<F8>

" I can't type
cmap W w
cmap Wa wa
cmap WA wa
cmap Wq wq

" }}}
" Plugin settings ------------------------------------------------------------- {{{

" NERD Tree {{{

map <F2> :NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o']

" }}}
" HTML5 {{{

let g:event_handler_attributes_complete = 0
let g:rdfa_attributes_complete = 0
let g:microdata_attributes_complete = 0
let g:atia_attributes_complete = 0

" }}}
" Rope {{{

let ropevim_enable_shortcuts = 0
let ropevim_guess_project = 1
let ropevim_global_prefix = '<C-c>p'

"source $HOME/.vim/sadness/sadness.vim

" }}}
" Gundo {{{

nnoremap <F5> :GundoToggle<CR>
let g:gundo_debug = 1
let g:gundo_preview_bottom = 1

" }}}
" VimClojure {{{

let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = $HOME . "/.vim/bundle/vimclojure/bin/ng"
let vimclojure#SplitPos = "right"

" }}}
" Syntastic {{{

let g:syntastic_enable_signs=1
let g:syntastic_disabled_filetypes = ['html', 'python']

" }}}
" Command-T {{{

let g:CommandTMaxHeight = 20

" }}}
" LISP (built-in) {{{

let g:lisp_rainbow = 1

" }}}
" Easymotion {{{

let g:EasyMotion_do_mapping = 0

nnoremap <silent> <Leader>f      :call EasyMotionF(0, 0)<CR>
vnoremap <silent> <Leader>f :<C-U>call EasyMotionF(1, 0)<CR>

nnoremap <silent> <Leader>F      :call EasyMotionF(0, 1)<CR>
vnoremap <silent> <Leader>F :<C-U>call EasyMotionF(1, 1)<CR>

" }}}
" Sparkup {{{

let g:sparkupExecuteMapping = '<c-s>'
let g:sparkupNextMapping = '<c-q>'

"}}}


" }}}
" Synstack -------------------------------------------------------------------- {{{

" Show the stack of syntax hilighting classes affecting whatever is under the
" cursor.
function! SynStack() " {{{
  if !exists("*synstack")
    return
  endif

  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc " }}}

nmap <M-S> :call SynStack()<CR>

" }}}
" Text objects ---------------------------------------------------------------- {{{

" Shortcut for [] {{{

onoremap id i[
onoremap ad a[
vnoremap id i[
vnoremap ad a[

" }}}
" Next () {{{
vnoremap <silent> inb :<C-U>normal! f(vib<cr>
onoremap <silent> inb :<C-U>normal! f(vib<cr>
vnoremap <silent> anb :<C-U>normal! f(vab<cr>
onoremap <silent> anb :<C-U>normal! f(vab<cr>
vnoremap <silent> in( :<C-U>normal! f(vi(<cr>
onoremap <silent> in( :<C-U>normal! f(vi(<cr>
vnoremap <silent> an( :<C-U>normal! f(va(<cr>
onoremap <silent> an( :<C-U>normal! f(va(<cr>
" }}}
" Next {} {{{
vnoremap <silent> inB :<C-U>normal! f{viB<cr>
onoremap <silent> inB :<C-U>normal! f{viB<cr>
vnoremap <silent> anB :<C-U>normal! f{vaB<cr>
onoremap <silent> anB :<C-U>normal! f{vaB<cr>
vnoremap <silent> in{ :<C-U>normal! f{vi{<cr>
onoremap <silent> in{ :<C-U>normal! f{vi{<cr>
vnoremap <silent> an{ :<C-U>normal! f{va{<cr>
onoremap <silent> an{ :<C-U>normal! f{va{<cr>
" }}}
" Next [] {{{
vnoremap <silent> ind :<C-U>normal! f[vi[<cr>
onoremap <silent> ind :<C-U>normal! f[vi[<cr>
vnoremap <silent> and :<C-U>normal! f[va[<cr>
onoremap <silent> and :<C-U>normal! f[va[<cr>
vnoremap <silent> in[ :<C-U>normal! f[vi[<cr>
onoremap <silent> in[ :<C-U>normal! f[vi[<cr>
vnoremap <silent> an[ :<C-U>normal! f[va[<cr>
onoremap <silent> an[ :<C-U>normal! f[va[<cr>
" }}}
" Next <> {{{
vnoremap <silent> in< :<C-U>normal! f<vi<<cr>
onoremap <silent> in< :<C-U>normal! f<vi<<cr>
vnoremap <silent> an< :<C-U>normal! f<va<<cr>
onoremap <silent> an< :<C-U>normal! f<va<<cr>
" }}}
" Next '' {{{
vnoremap <silent> in' :<C-U>normal! f'vi'<cr>
onoremap <silent> in' :<C-U>normal! f'vi'<cr>
vnoremap <silent> an' :<C-U>normal! f'va'<cr>
onoremap <silent> an' :<C-U>normal! f'va'<cr>
" }}}
" Next "" {{{
vnoremap <silent> in" :<C-U>normal! f"vi"<cr>
onoremap <silent> in" :<C-U>normal! f"vi"<cr>
vnoremap <silent> an" :<C-U>normal! f"va"<cr>
onoremap <silent> an" :<C-U>normal! f"va"<cr>
" }}}

" }}}
" Quickreturn ----------------------------------------------------------------- {{{

inoremap <c-cr> <esc>A<cr>
inoremap <s-cr> <esc>A:<cr>

" }}}
" Error toggles --------------------------------------------------------------- {{{

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
" Open quoted ----------------------------------------------------------------- {{{

nnoremap <silent> ø :OpenQuoted<cr>
command! OpenQuoted call OpenQuoted()

" Open the file in the current (or next) set of quotes.
function! OpenQuoted() " {{{
    let @r = ''

    exe 'normal! vi' . "'" . '"ry'

    if len(@r) == 0
        exe 'normal! i' . '"' . '"ry'
    endif

    if len(@r) == 0
        exe 'normal! "ry'
        let @r = ''
    endif

    exe "silent !open ." . @r
endfunction " }}}

" }}}
" MacVim ---------------------------------------------------------------------- {{{

if has('gui_running')
"    set guifont=Menlo:h12

    " Remove all the UI cruft
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R

    " PeepOpen
    if has("gui_macvim")
        macmenu &File.New\ Tab key=<nop>
        map <leader><leader> <Plug>PeepOpen
    end

    highlight SpellBad term=underline gui=undercurl guisp=Orange

    " Use a line-drawing char for pretty vertical splits.
    set fillchars=vert:│

    " Different cursors for different modes.
    set guicursor=n-c:block-Cursor-blinkon0
    set guicursor+=v:block-vCursor-blinkon0
    set guicursor+=i-ci:ver20-iCursor

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
    imap <D-BS>         <C-u>
endif

" }}}
" Jimmy ---------------------------------------------------------------------- {{{
   " Show line numbers and toggle with something
   set number
   "nnoremap <F2> :set nonumber! <CR>
   
   " tabnew   tabnext tabprev
   "nnoremap <F3> <C-PAGEDOWN>
   "nnoremap <F4> <C-PAGEUP>
   "nnoremap <F7> :tabnew
   nnoremap <S-F4> :bn<CR>
   nnoremap <F7> :tabnew


  "toggle hidden list characters
  nmap <leader>l :set list! <CR>
  "toggle line numbers
  nmap <leader>n :set nu! <CR>
  "toggle wrap
  nmap <leader>w :set wrap! <CR>

" Opens an edit command with the path of the currently edited file filled in
  " Normal mode: <Leader>e
  map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

  " Opens a tab edit command with the path of the currently edited file filled in
  " Normal mode: <Leader>t
  map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
   
   "NerdComments add extra space around comments
   let NERDSpaceDelims=1


    " Convenient command to see the difference between the current buffer and the
    " file it was loaded from, thus the changes you made.
    if !exists(":DiffOrig")
      command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
              \ | wincmd p | diffthis
    endif
       
   "
   " add mustache surrounds
   let g:surround_{char2nr('m')} = "{{\r}}"
   let g:surround_{char2nr('d')} = "{\r}"

   " html matchit  --there's some django stuff that should be removed
   " http://stackoverflow.com/questions/2165582/how-do-i-get-the-vim-matchit-plugin-working-with-coldfusion-and-html
   " if exists("loaded_matchit")
    " let b:match_ignorecase = 1
    " let b:match_skip = 's:Comment'
    " let b:match_words = '<:>,' .
    " \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
    " \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
    " \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>,'  .-
    " \ '{% *if .*%}:{% *else *%}:{% *endif *%},' .-
    " \ '{% *ifequal .*%}:{% *else *%}:{% *endifequal *%},' .-
    " \ '{% *ifnotequal .*%}:{% *else *%}:{% *endifnotequal *%},' .-
    " \ '{% *ifchanged .*%}:{% *else *%}:{% *endifchanged *%},' .-
    " \ '{% *for .*%}:{% *endfor *%},' .-
    " \ '{% *with .*%}:{% *endwith *%},' .
    " \ '{% *comment .*%}:{% *endcomment *%},' .
    " \ '{% *block .*%}:{% *endblock *%},' .
    " \ '{% *filter .*%}:{% *endfilter *%},' .
    " \ '{% *spaceless .*%}:{% *endspaceless *%}'-
   " endif
   " 
   "
   "
   " delimitMate
   let loaded_delimitMate = 1 
   let delimitMate_expand_space = 1 
   let delimitMate_expand_cr = 1
   " tab completion or a real tab
  function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
      return "\<C-N>"
    else
      return "\<Tab>"
  endfunction
  inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

" }}}
" LinkedIn ---------------------------------------------------------------------- {{{
   "NerdComments for JSPs 
   let g:NERDCustomDelimiters = {'jsp': { 'left': '<% /*', 'right': '*/ %>', 'leftAlt': '<%--', 'rightAlt': '--%>' }}

" }}}
" JSP ---------------------------------------------------------------------- {{{
  "au BufNewFile,BufRead *.jsp setlocal filetype=jsp.html
  au BufNewFile,BufRead *.jsp setlocal foldmethod=manual

  " Use <localleader>f to fold the current tag.
  au BufNewFile,BufRead *.jsp nnoremap <buffer> <localleader>f Vatzf

  " Use Shift-Return to turn this:
  "     <tag>|</tag>
  "
  " into this:
  "     <tag>
  "         |
  "     </tag>
  au BufNewFile,BufRead *.jsp inoremap <buffer> <s-cr> <cr><esc>kA<cr>
  au BufNewFile,BufRead *.jsp nnoremap <buffer> <s-cr> vit<esc>a<cr><esc>vito<esc>i<cr><esc>

  " Sparkup mappings:
  "
  " <c-e><space> to expand sparkup normally:
  "     <p>|</p>
  "
  " <c-e><return> to force an expanded sparkup.
  "     <p>
  "         |
  "     </p>
  au BufNewFile,BufRead *.jsp imap <buffer> <c-s><cr> <c-s><s-cr>
  au BufNewFile,BufRead *.jsp imap <buffer> <c-s><space> <c-s>.<bs>


" }}}

