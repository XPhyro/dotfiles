" TODO: gj/gk for non-visual moving. This can likely be achieved with : commands.

se nocompatible

filetype plugin on
filetype indent on

"colorscheme crayon
"colorscheme deus
colorscheme deus
"colorscheme ego
"colorscheme falcon
"colorscheme jiks
"colorscheme mojave

"se viminfo='10,\"100,:20,%,n~/.viminfo "mark,line-for-register,command-history,save-and-restore-buffer-list,where-to-save-viminfo-viles

syntax on
se nu "number
se rnu "relativenumber
se sc "showcmd

se background=dark
se t_Co=256
hi Comment ctermfg=grey
"hi Normal ctermfg=white ctermbg=black
hi Normal guibg=NONE ctermbg=NONE
se title
se wildmenu
se ruler

filetype plugin indent on
se smartindent
"show existing tab with 4 spaces width
se tabstop=4
"when indenting with '>', use 4 spaces width
se shiftwidth=4
"number of spaces in tab when editing
se softtabstop=4
"insert spaces in place of tabs
se expandtab
se smarttab

"se tw=80
se tw=0

se ai "autoindent
se showmatch
se foldenable
se foldmethod=marker

se so=2134 "scrolloff
se cul

se bs=indent,eol,start "backspace

se is "incsearch
se hls "highlightsearch
se ic "ignorecase
se inf "infercase
se scs "smartcase
se gd "gdefault

se display+=lastline
se encoding=utf-8
se fileencoding=utf-8
se wrap
se nolist
se linebreak

se ul=10000

se spelllang=en_gb
setlocal spellfile=~/.vim/spell/en.utf-8.add
au BufNewFile,BufRead *.tex setlocal spellfile+=~/code/vim/names.utf-8.add
au BufNewFile,BufRead *.tex setlocal spellfile+=~/code/vim/tex.utf-8.add

se ar "autoread

se history=10000
se backup
se bdir=~/.cache/vim "backupdir
se dir=~/.cache/vim
se wb "writebackup

fun! s:SplashScreen()
    enew!

    setlocal
        \ bufhidden=wipe
        \ buftype=nofile
        \ nobuflisted
        \ nocursorcolumn
        \ nocursorline
        \ nolist
        \ nonumber
        \ noswapfile
        \ norelativenumber

    exec ":r ~/.vim/splash-screen"
    exec ":norm ggdd0"
    exec ":echo"

    setlocal
        \ nomodifiable
        \ nomodified

    nnoremap <buffer><silent> e :enew<CR>
    nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> I :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> O :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> a :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> A :enew <bar> startinsert<CR>
endfun

function ConfigureTabBehaviour()
    " Determines whether to use spaces or tabs on the current buffer.
    if getfsize(bufname("%")) > 256000
        " File is very large, just use the default.
        return
    endif

    let numTabs=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^\\t"'))
    let numSpaces=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^ "'))

    if numTabs > numSpaces
        setlocal noexpandtab
    endif
endfunction

fun! StripTrailingWhitespace()
    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s\+$//e
endfun

fun! ToggleStripTrailingWhitespace()
    if exists('b:noStripWhitespace')
        unlet b:noStripWhitespace
    else
        let b:noStripWhitespace=1
    endif
endfun

fun! s:WriteOnInsertLeave()
    if exists('b:noWriteOnInsert')
        return
    endif
    w
endfun

fun! ToggleWriteOnInsertLeave()
    if exists('b:noWriteOnInsert')
        unlet b:noWriteOnInsert
    else
        let b:noWriteOnInsert=1
    endif
    if exists('g:auto_save')
        if g:auto_save == 1
            let g:auto_save=0
        else
            let g:auto_save=1
        endif
    endif
endfun

fun! s:NextTextObject(motion)
    echo
    let c = nr2char(getchar())
    exe "normal! f".c."v".a:motion.c
endfun

fun! IsCurrentFileNew()
    return empty(glob(@%))
endfun

fun! ToggleYCMAutoComplete()
    if !exists('g:ycm_auto_trigger')
        return
    endif

    if g:ycm_auto_trigger
        let g:ycm_auto_trigger=0
    else
        let g:ycm_auto_trigger=1
    endif
endfun

fun! s:TempToggleWriteOnInsertLeaveBefore()
    if exists('b:noWriteOnInsert')
        let b:willNotChangeWriteOnInsert=1
    else
        let b:noWriteOnInsert=1
    endif
endfun

fun! s:TempToggleWriteOnInsertLeaveAfter()
    if exists('b:willNotChangeWriteOnInsert')
        unlet b:willNotChangeWriteOnInsert
    else
        unlet b:noWriteOnInsert
    endif
endfun

fun! Multiple_cursors_before()
    call s:TempToggleWriteOnInsertLeaveBefore()
endfun

fun! Multiple_cursors_after()
    call s:TempToggleWriteOnInsertLeaveAfter()
endfun

fun! IsFileEmpty()
    if IsCurrentFileNew()
        return 1
    endif
    let lines = readfile(@%)
    let matched_index = match(lines, '')  " find the first entry with a non-space
    return matched_index == -1              " if no match was found -1 was returned
endfun

function! LF()
    let temp = tempname()
    exec 'silent !lf -selection-path=' . shellescape(temp)
    if !filereadable(temp)
        redraw!
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        return
    endif
    exec 'edit ' . fnameescape(names[0])
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar LF call LF()

augroup configgroup
    au!
    "fix zsh caret
    au VimEnter       *                   silent exec "!echo -ne '\e[1 q'"
    au FileType       ruby                setlocal commentstring=#\ %s
    au FileType       python              setlocal commentstring=#\ %s
    au FileType       tex                 setlocal noautoindent
    au BufNewFile     *                   let b:noWriteOnInsert=1 "if IsCurrentFileNew() | let b:noWriteOnInsert=1
    au BufNewFile     *.sh                call s:TempToggleWriteOnInsertLeaveBefore() | exe 'normal' "i#!/usr/bin/env sh\<CR>\<CR>\<ESC>" | call s:TempToggleWriteOnInsertLeaveAfter()
    "for some reason   vim does not detect shebangs unless this is here
    au BufEnter       *                   exe ':filetype detect'
    au BufEnter       *                   if expand('%:p:h') == "/home/xphyro/code/sh/sh/src" && expand('%:e') == "" | se ft=sh
    au BufEnter       *                   if &ft == 'sh' && IsFileEmpty() | call s:TempToggleWriteOnInsertLeaveBefore() | exe 'normal' "i#!/usr/bin/env sh\<CR>\<CR>\<ESC>" | call s:TempToggleWriteOnInsertLeaveAfter()
    au BufEnter       *.vimrc             let b:noStripWhitespace=1
    au BufEnter       *.log               let b:noWriteOnInsert=1
    au BufEnter       *.tex               call ToggleYCMAutoComplete()
    au BufEnter       Makefile,marks      set expandtab!
    au BufReadPost    *                   call ConfigureTabBehaviour()
    "if the user saved a new file, activate auto-save
    au BufWritePre    *                   if IsCurrentFileNew() | call ToggleWriteOnInsertLeave()
    au BufWritePre    *.py                silent! exe ":Black"
    au BufWritePre    *                   call StripTrailingWhitespace()
augroup END

augroup actiongroup
    "au InsertLeave    *                   call s:WriteOnInsertLeave()
    au FileWritePost  sxhkdrc             silent! exe "!setxkb; restart-sxhkd"
    au FileWritePost  *                   if getcwd() == "/home/xphyro/code/sh/sh/src" | silent! exe "!sudo make install"
    au BufWritePost   .Xresources         silent! exe "!xrdb -load ~/.Xresources"
    au FileWritePost  locations,files     silent! exe "!setfl; genrc"
augroup END

let mapleader=","

"mute search highlighting and detect filetype (appends to the normal action of clearing+redrawing screen)
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR>:<C-u>filetype detect<CR><C-l>
"open or close folds
nnoremap <space> za
"move vertically by visual line if no count given and record the movement if it is more than 5 lines
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
"highlight last insterted text
nnoremap gV `[v`]
"toggle gundo
nnoremap <Leader>ut :UndotreeToggle<CR>
nnoremap <Leader>ue :earlier 
nnoremap <Leader>ul :later 
"edit vimrc
nnoremap <Leader>evr :vsp $MYVIMRC<CR>
"source vimrc
nnoremap <Leader>svr :source $MYVIMRC<CR>
"open ack.vim
nnoremap <Leader>a :Ack 
nnoremap <Leader>b :Black<CR>
"toggle between relative and absolute number
nnoremap <Leader>n :se rnu!<CR>
"copy, paste to actual clips
nnoremap <Leader>y "+y
nnoremap <Leader>d "+y`[v`]d
nnoremap <Leader>p "+p
nnoremap <Leader>op o<Esc>"+p
nnoremap <Leader>Op O<Esc>"+p
nnoremap <Leader>Y "*y
nnoremap <Leader>D "*y`[v`]d
nnoremap <Leader>P "*p
nnoremap <Leader>oP o<Esc>"+p
nnoremap <Leader>OP O<Esc>"+p
vnoremap <Leader>y "+y
vnoremap <Leader>y "+y`[v`]d
vnoremap <Leader>Y "*y
vnoremap <Leader>Y "*y`[v`]d
"execute wc on the file
nnoremap <Leader>wc :w !wc<CR>
""window navigations
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
"line transportation
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
"inoremap <C-j> <Esc>:m .+1<CR>==gi
"inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
"navigation
nnoremap J <C-d>
nnoremap K <C-u>
nnoremap <C-s> hs
nnoremap Z dd
"unmap ZZ
nnoremap Y y$
nnoremap yp yyp
nnoremap yP yyP
nnoremap <Leader>dg ddggP``
nnoremap <Leader>yg YggP``
nnoremap <Leader>dG ddGp``
nnoremap <Leader>yG YGp``
vnoremap <Leader>dg dggP``
vnoremap <Leader>yg yggP``
vnoremap <Leader>dG dGp``
vnoremap <Leader>yG yGp``
"nnoremap <C-o> kO<CR>
" TODO: Change the keys of the following two maps, then uncomment them.
"nnoremap <C-o> O<CR><Esc>O
"nnoremap <C-i> O<Esc>O
nnoremap <C-p> o<Esc>O
"delete in line everything except selected
vnoremap <C-d> dO<Esc>pjddk
"insert new line in normal mode
nnoremap <CR> o<ESC>
nnoremap <BS> O<ESC>
"set instructions
nnoremap <Leader>lr :se lazyredraw!<CR>
nnoremap <Leader>sp :se spell!<CR>
nnoremap <Leader>cl :se cursorline!<CR>
nnoremap <Leader>cs :colorscheme DarkDefault<CR>:colorscheme 
"ycm
nnoremap <Leader>cm :call ToggleYCMAutoComplete()<CR>
nnoremap <Leader>cmf :YcmCompleter FixIt<CR>
"format json file
nnoremap <Leader>fjs :%!python -m json.tool<CR>
"toggle behaviours
nnoremap <Leader>ts :call ToggleStripTrailingWhitespace()<CR>
nnoremap <Leader>tw :call ToggleWriteOnInsertLeave()<CR>
nnoremap <Leader>tb :ToggleBool<CR>

nnoremap ; :
vnoremap ; :

nnoremap Q :<CR>
nnoremap QQ :q<CR>
nnoremap QW :wq<CR>
nnoremap QE :w<CR>
nnoremap QF :q!<CR>
nnoremap <Leader>qe :w !sudo tee > /dev/null %<CR>
cmap w!! w !sudo tee > /dev/null %

nnoremap <Leader>n :n<CR>
"nnoremap <Leader>p :p<CR>
nnoremap <Leader>wn :wn<CR>
nnoremap <Leader>wp :wp<CR>

"vnoremap <Leader>s( <ESC><ESC>`<i(<ESC>`>3la)<ESC>`<3lv`>3l
"vnoremap <Leader>s) <ESC><ESC>`<i(<ESC>`>3la)<ESC>`<3lv`>3l
"vnoremap <Leader>s[ <ESC><ESC>`<i[<ESC>`>3la]<ESC>`<3lv`>3l
"vnoremap <Leader>s] <ESC><ESC>`<i[<ESC>`>3la]<ESC>`<3lv`>3l
"vnoremap <Leader>s{ <ESC><ESC>`<i{<ESC>`>3la}<ESC>`<3lv`>3l
"vnoremap <Leader>s} <ESC><ESC>`<i{<ESC>`>3la}<ESC>`<3lv`>3l
"vnoremap <Leader>s" <ESC><ESC>`<i"<ESC>`>3la"<ESC>`<3lv`>3l
"vnoremap <Leader>s' <ESC><ESC>`<i'<ESC>`>3la'<ESC>`<3lv`>3l

vnoremap <Leader>s( <ESC><ESC>`<i(<ESC>`>3la)<ESC>
vnoremap <Leader>s) <ESC><ESC>`<i(<ESC>`>3la)<ESC>
vnoremap <Leader>s[ <ESC><ESC>`<i[<ESC>`>3la]<ESC>
vnoremap <Leader>s] <ESC><ESC>`<i[<ESC>`>3la]<ESC>
vnoremap <Leader>s{ <ESC><ESC>`<i{<ESC>`>3la}<ESC>
vnoremap <Leader>s} <ESC><ESC>`<i{<ESC>`>3la}<ESC>
vnoremap <Leader>s" <ESC><ESC>`<i"<ESC>`>3la"<ESC>
vnoremap <Leader>s' <ESC><ESC>`<i'<ESC>`>3la'<ESC>

nnoremap <Leader>su( viW<ESC><ESC>`<i(<ESC>`>3la)<ESC>
nnoremap <Leader>su) viW<ESC><ESC>`<i(<ESC>`>3la)<ESC>
nnoremap <Leader>su[ viW<ESC><ESC>`<i[<ESC>`>3la]<ESC>
nnoremap <Leader>su] viW<ESC><ESC>`<i[<ESC>`>3la]<ESC>
nnoremap <Leader>su{ viW<ESC><ESC>`<i{<ESC>`>3la}<ESC>
nnoremap <Leader>su} viW<ESC><ESC>`<i{<ESC>`>3la}<ESC>
nnoremap <Leader>su" viW<ESC><ESC>`<i"<ESC>`>3la"<ESC>
nnoremap <Leader>su' viW<ESC><ESC>`<i'<ESC>`>3la'<ESC>

nnoremap <Leader>sps :split<CR>
nnoremap <Leader>spv :vsplit<CR>

"search for selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

onoremap an :<c-u>call <SID>NextTextObject('a')<CR>
xnoremap an :<c-u>call <SID>NextTextObject('a')<CR>
onoremap in :<c-u>call <SID>NextTextObject('i')<CR>
xnoremap in :<c-u>call <SID>NextTextObject('i')<CR>

vnoremap <F3> :sort<CR>
vnoremap <F4> d:execute 'normal a' . join(sort(split(getreg('"'))), ' ')<CR>
nnoremap <F5> vip:sort<CR>

nnoremap <Leader>lf :LF<CR>

"emacs maps for i and c
inoremap <c-a> <Home>
inoremap <c-e> <End>
inoremap <c-b> <Left>
inoremap <c-f> <Right>
inoremap <c-p> <Up>
inoremap <c-n> <Down>
inoremap <c-d> <Del>
inoremap <c-h> <BS>
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>
cnoremap <c-d> <Del>
cnoremap <c-h> <BS>
"more i maps
inoremap <c-k> <ESC>lDa
inoremap <c-u> <ESC>2BEa
inoremap <c-r> <ESC>Ea
inoremap <c-c> <ESC>~a
inoremap <C-x> <Esc>dBxi
inoremap <C-l> <Esc>ldEa

nnoremap ' `

"wipe registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) |

let g:tq_map_keys=0

call plug#begin()
Plug 'glts/vim-magnum'
" Plug 'vim-scripts/restore_view.vim' " for some reason, this has lots of clashes when in a tex file
Plug 'mbbill/undotree/'
Plug 'mileszs/ack.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
"Plug 'triglav/vim-visual-increment' "use g<c-a> or g<c-x>
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'fisadev/vim-isort'
"Plug 'psf/black', { 'commit': 'ce14fa8b497bae2b50ec48b3bd7022573a59cdb1' }
Plug 'psf/black'
Plug 'tpope/vim-dispatch'
Plug 'terryma/vim-multiple-cursors'
"Plug 'ycm-core/YouCompleteMe', { 'commit': 'f84dd1fb12877490b4b95fded1984a6a82985871' }
Plug 'ycm-core/YouCompleteMe'
Plug 'flazz/vim-colorschemes'
Plug 'wincent/terminus'
Plug 'dylanaraps/wal'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sudar/vim-arduino-snippets'
"Plug 'lervag/vimtex'
"Plug 'KeitaNakamura/tex-conceal.vim'
"Plug 'ervandew/supertab'
"Plug 'sagarrakshe/toggle-bool'
Plug 'XPhyro/toggle-bool'
Plug 'tpope/vim-repeat'
Plug 'glts/vim-radical'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-speeddating'
Plug 'farmergreg/vim-lastplace'
" Plug 'joonty/vim-do'
Plug 'Ron89/thesaurus_query.vim'
Plug '907th/vim-auto-save'
Plug 'airblade/vim-gitgutter'
call plug#end()

"set visual-increment types
se nrformats=alpha,octal,hex

""ycm
let g:ycm_confirm_extra_conf=1
"let g:ycm_key_list_select_completion=['<C-i>']
"let g:ycm_key_list_previous_completion=['<C-h>']
"let g:ycm_key_list_next_completion=['<C-i>']

""ultisnips
"let g:UltiSnipsExpandTrigger='<C-h>'
"let g:UltiSnipsJumpForwardTrigger='<C-j>'
"let g:UltiSnipsJumpBackwardTrigger='<C-k>'
"let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsListSnippets="<c-s-tab>"
let g:UltiSnipsExpandTrigger=";e"
let g:UltiSnipsJumpForwardTrigger=";w"
let g:UltiSnipsJumpBackwardTrigger=";b"

let g:auto_save=1
let g:auto_save_silent=1

"""tex-conceal
""set conceallevel=1
"set conceallevel=0
"let g:tex_conceal='abdmg'
"hi Conceal ctermbg=none

nnoremap <Leader>the :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <Leader>the y:ThesaurusQueryReplace <C-r>"<CR>

if argc() == 0
    au VimEnter                  *               call s:SplashScreen()
endif

augroup overridegroup
    au BufNewFile,BufRead        /tmp/neomutt*   set tw=78 textwidth=0 wrapmargin=0 wrap noai | let b:noWriteOnInsert=1
    au FileWritePre,BufWritePre  /tmp/neomutt*   silent! %s/\($\n\s*\)\+\%$//e
augroup END
