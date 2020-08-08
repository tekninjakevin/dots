"#################################################################
"#┌─────────────────────────────────────────────────────────────┐#
"#│ ______        __      __  __                                │#
"#│/\__  _\      /\ \    /\ \/\ \  __            __             │#
"#│\/_/\ \/    __\ \ \/'\\ \ `\\ \/\_\    ___   /\_\     __     │#
"#│   \ \ \  /'__`\ \ , < \ \ , ` \/\ \ /' _ `\ \/\ \  /'__`\   │#
"#│    \ \ \/\  __/\ \ \\`\\ \ \`\ \ \ \/\ \/\ \ \ \ \/\ \L\.\_ │#
"#│     \ \_\ \____\\ \_\ \_\ \_\ \_\ \_\ \_\ \_\_\ \ \ \__/.\_\│#
"#│      \/_/\/____/ \/_/\/_/\/_/\/_/\/_/\/_/\/_/\ \_\ \/__/\/_/│#
"#│                                             \ \____/        │#
"#│                                              \/___/         │#
"#└─────────────────────────────────────────────────────────────┘#
"#################################################################
"#           .-.   .-.,-.        .,-..-. .-.,-. _______          #
"#            \ \ / / |(||\    /| |(||  \| ||(||__   __|         #
"#             \ V /  (_)|(\  / | (_)|   | |(_)  )| |            #
"#              ) /   | |(_)\/  | | || |\  || | (_) |            #
"#             (_)    | || \  / | | || | |)|| |   | |            #
"#                    `-'| |\/| | `-'/(  (_)`-'   `-'            #
"#                       '-'  '-'   (__)                         #
"# Author - TekNinja-Kevin Tangereen Spidermankevin78@gmail.com  #
"# Last Update Oct 13th 2019                                 #
"# License - © 2018- http://www.wtfpl.net/                       #
"#################################################################
"==============Plugins============================================{{{
"Plugin=AutoSave
"Plugin=Acp 			Auto Complete Popup
"Plugin=Airline			Status line plug in
"Plugin=Auto-Pairs		Atomantacly Pare brackets and tags
"Plugin=BufExplore		Exlpore Buffers
"Plugon=Deoplete		Completions for NeoVim
"Plugin=Calendar		Calander
"Plugin=Cecutil
"Plugin=Closetag		<close></tag>
"Plugin=CtrlP			A finding tool
"Plugin=Grammarous
"Plugin=Gundo
"Plugin=gzip			Read text files in gzip files
"Plugin=Matchparen 		shows matching ""
"Plugin=mru			Must Recently used
"Plugin=Preview			Preview Markup files
"Plugin=notes			Markdown style notes
"Plugin=Syntastics		Syntax Syntax Checking
"Plugin=omnicomplete		Syntacs Completions
"Plugin-Wintagexplore		Tag Explore
"Plugin=Nerdtree		Side pane file manger
"=================================================================}}}
"==============General ==========================================={{{
    set shell=$SHELL        " use current shell for shell commands
"---Tab Settings
    set smartindent
    set tabstop=8
    set shiftwidth=4
    set noexpandtab
"---Numbering
    set number
    set numberwidth=5
"---Just like a word processor
    set listchars=tab:>>,trail:.,extends:>,eol:¬,nbsp:_
    set list
"---Settings for Completions
    set omnifunc=syntanxcomplete
    set completeopt= "menu,longest,Preview"
    set complete = ".,w,b,k,kspell,t"
"---oragomi
  set foldenable                    " Turn Folding on
  set foldmethod=marker
"---Search Settings
  set smartcase
  set hlsearch
"-- keep search matches in the middle of the window.
  nnoremap n nzzzv
  nnoremap N Nzzzv
"---Other Settings
  set showmatch                     "Show Matching Brackets
  set history=2500                  "Long Hisoory"
  set clipboard+=unnamedplus        "Use X's ClipBoard"
  set wildmenu                      "command-line Completions our enhanced
  set showcmd                       "Show last command used"
  set noswapfile                    "We Don't need no sticking swap"
  set backspace=indent,eol,start    "use my fave keys"
  set laststatus=2                  "Status line Always on "
  set confirm                       "I need be shure"
  set noshowmode                    "Airline handles dis Shit"
  set magic                         "Use Magic "
  set autoread                      "read its"
"  set autowrite
  set backup                        "keep a back up"
  set mps+=<:>                      "more exoctic"  i
  set cursorline
"--autosave Settings Save ever time i exit insert
  let g:auto_save = 1
    set mouse=a
"================================================================}}}
"==============Key Bindings======================================{{{

map <leader>su :w !sudo tee % <CR><CR>
"--- Reload Vimrc
    noremap <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

map <leader>unix :set fileformat=unix<CR>
map <leader>dos :set fileformat=dos<CR>

"---fuck you vim lol
    command! Q q " Bind :Q to :q
    command! Qall qall
    command! W w
    command! E e

"---Home
    nmap <Home> gg
    nmap <End> $
    imap <Home> ^
    imap <end> $
"-----------------------------------------------"
"---Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Close all the buffers
map <leader>ba :bufdo bd<cr>
"---Move to previus and next tab
    map <leader>l :tabn<cr>
    map <leader>h :tabp<cr>
"-----------------------------------------------""
"---Clean trailing whitespace
    nnoremap <leader>W mz:%s/\s\+$//<cr>:let @/=''<cr>`z
"---copy or paste from X11 clipboard
    vmap <leader>xyy :!xclip -f -sel clip<CR>
    map <leader>xpp mz:-1r !xclip -o -sel clip<CR>`z
"---No need to press shift
    nmap ; :
"---Vintage Computer Style way of Exiting insert mode.
    imap <C-c> <esc>
"---Better y to Get to the end or start of line
    nmap H ^
    nmap L $
    vmap H ^
    vmap L $

"--- Ctrl-E to jump to end of line in Insert Mode
    inoremap <c-e> <c-o>$
"--- Ctrl-A to jump to start of line in Insert Mode
    inoremap <c-a> <c-o>^
"---Use logial lines in normanl mode
    nnoremap j gj
    nnoremap k gk
"---Create new tab
    map <C-t> :tabnew<cr>
"---Move around windows with out hitting c-w first
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-h> <C-w>h
    nnoremap <C-l> <C-w>l
"---Buffer selection
    nnoremap <leader>n :bn<CR>
    nnoremap <leader>p :bp<CR>
"---fix Spelling Errors in normal mode
    nnoremap <leader>sp :call FixLastSpellingError()<cr>
"---Nerd tree
    map <leader>nn :NERDTree<CR>
"---buffer list
    map <leader>b :BufExplore<CR>
"---FZF
    map <leader>f :fzf<CR>
"---spelling
    map <leader>s :setlocal spell! spelllang=en_us
"---file list
    nmap <leader>e :Explore<CR>
"----most Recent Documents
    nmap <leader>m :MRU<CR>
"---Words rocessor Mode
    nmap <leader>wp :WP<cr>
"---Load the current buffer in  Serf
    nmap ,c :!open -a serf file://"$1"<cr>
"---refocus folds; close any other fold except the one that you are one
    nnoremap ,z zMzvzz
"---Yank entire buffer with gy
    nnoremap gy :0,$ y<cr>
"---Select entire buffer
    nnoremap vy ggVG
"---Create newlines without entering insert mode
    nnoremap go o<Esc>k
    nnoremap gO O<Esc>j
"---Navigating with guides
    inoremap <Space><Tab> <Esc>/<Enter>"_c4l
    vnoremap <Space><Tab> <Esc>/<Enter>"_c4l
    map <Space><Tab> <Esc>/<Enter>"_c4l
    map <leader>c :!compiler <c-r>%<CR>
    "Change case
    vmap <C-u> <esc>mzgUiw`za
"---Split Vertical
	nmap <leader>v <C-w>v
	nmap <leader>H <c-w>s
"----Undo tree"
    "nmap <leader>g :GundoToggle<CR>

    " easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
    vnoremap < <gv  " better indentation
    vnoremap > >gv  " better indentation

" Quit window on <leader>q
    nnoremap <leader>q :q<CR>

    " hide matches on <leader>space
    nnoremap <leader><space> :nohlsearch<cr>

" Text alignment
nnoremap <Leader>Al :left<CR>
nnoremap <Leader>Ac :center<CR>
nnoremap <Leader>Ar :right<CR>
vnoremap <Leader>Al :left<CR>
vnoremap <Leader>Ac :center<CR>
vnoremap <Leader>Ar :right<CR>
"------Fuction Keys Mapping-----"
" help Key
 	map <F1> :help

" Show/Hide Marker Charcters:
inoremap <silent> <F2> :set invlist<CR>
" toggle number lines
inoremap <F3> :set nonumber! nonumber?<CR>
" toggle search highlights
    inoremap <F4> :set hlsearch! hlsearch?<CR>
    nmap <F5> :WP
    inoremap <F6> :setlocal spell! spelllang=en_us,es<CR>
" fold close
map <F7> :w<CR>
map <F8> :AuoSaveToggle<CR>
map <F9> :Calendar<CR>
map <F10> :Note<CR>

"================================================================}}}
"i=============Vim Paths========================================={{{
set backup                              " Make Backup
set backupdir=$HOME/.vim_backup	  " but not when they clog .
set directory=$HOME/.vimswap           "  Same for swap files
set undofile                            " Make undofile
set undodir=~/.vim_undo              " undofile location
"================================================================}}}
"==============Themes and colorschemers=========================={{{
"-Settings-------------------------------------------------
  filetype indent plugin on
  syntax on
  set hlsearch
"---Theme
  colorscheme Galactic_surf      "First Choice
"colorscheme delek
"colorscheme archery
"colorscheme delek
"------------------------------------------------
"---Tweaks Need to move to theme once I fork NeonBrainFuck into TotalyFucked
"---I Gots to have my Tarans parent Background
  hi Search cterm=NONE ctermfg=NONE ctermbg=blue
  hi IncSearch cterm=NONE ctermfg=NONE ctermbg=blue
  hi Normal ctermbg=NONE
  hi nonText ctermbg=NONE
  hi CursorLine cterm=NONE ctermfg=NONE ctermbg=black
"---Line number bar with Blue background white text
  highlight LineNr term=none cterm=none ctermfg=White ctermbg=DarkBlue
  highlight CursorLineNr ctermbg=White ctermfg=DarkBlue
"---Colorscheme for folds
  hi Folded cterm=bold ctermfg=black ctermbg=Blue
  hi FoldColumn cterm=bold ctermfg=DarkBlue ctermbg=none
"-----------------StatusBar &  TabBar Tweeks
"---Theme
let g:airline_theme='soda'
"---Powerline gliphs
  let g:airline_powerline_fonts = 1
"---Show PASTE if in paste mode
  let g:airline_detect_paste=1
"---Show airline for tabs too
  let g:airline#extensions#tabline#enabled = 1
"---enable/disable displiaying buffers with a single tab. (c) >
  let g:airline#extensions#tabline#show_buffers = 0
"---defines the name of a formatter for how buffer names are displayed. (c) >
  let g:airline#extensions#tabline#formatter = 'default'
"---enable/disable displaying tab number in tabs mode. >
  let g:airline#extensions#tabline#show_tab_nr = 0

"==============================================================}}}
"==============Presistand Undo================================={{{
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
set undolevels=1000                     " How many undos
set undoreload=10000                    " number of lines to save for undo
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry
"=============================================================}}}
"==============Fuctions======================================={{{
"Vim Word processing mode
func! WordProcessorMode()
	setlocal textwidth=80
	setlocal smartindent
	setlocal spell spelllang=en
	setlocal noexpandtab
g:grammarous#use_vim_spelllang`. Default 0, to enable
endfu

com! WP call WordProcessorMode()

function! FixLastSpellingError()
  normal! mm[s1z=`m
endfunction

" Ranger File Browser in Vim
" http://www.everythingcli.org/use-ranger-as-a-file-explorer-in-vim/
function RangerExplorer()
    exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
    if filereadable('/tmp/vim_ranger_current_file')
        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
        call system('rm /tmp/vim_ranger_current_file')
    endif
    redraw!
endfun
map <Leader>x :call RangerExplorer()<CR>

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

        map <Leader>f :call AutoFormat()<cr>

        let g:autoformat_on_save_default = 0

        if !exists('g:autoformat_on_save')
            let g:autoformat_on_save = g:autoformat_on_save_default
        endif

        autocmd! BufWritePre * if g:autoformat_on_save | call AutoFormat() | endif
" [c]lear [w]hitespace
function! ClearWhitespace()
    let winview = winsaveview()
    let _s=@/
    execute 'keepjumps %s/\s\+$//e'
    let @/=_s
    nohl
    update
    call winrestview(winview)
endfunction
nnoremap <Leader>cw :call ClearWhitespace()<CR>
"================================================================}}}
"==============Synastics Seting=================================={{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = "X"
let g:syntastic_style_error_symbol = ">"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_warning_symbol = ">"
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_compiler_options = " -std=c++11"
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_coffeescript_checkers = ["coffeelint"]
let g:syntastic_markdown_checkers = ['mdl']
let g:syntastic_css_checkers = ["csslint", "prettycss"]
let g:syntastic_python_checkers = ["flake8", "python"]
"let g:syntastic_html_checkers = ['html_tidy']
let g:livepreview_previewer = 'evince'
let g:html_indent_inctags = "html,body,head,tbody"
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" Syntastics
let g:systastic_python_cherkers = ['python','py3kwam']

" Javascript
let g:syntastic_javascript_checkers = ['jshint']


"================================================================}}}
"==============Abreviations======================================{{{
" Time
"
	    iab _datetime <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
  iab _time <C-R>=strftime("%H:%M")<CR>
  iab _date <C-R>=strftime("%d %b %Y")<CR>
" Personal
  iab _name Kevin Dale Tangreen
  iab _mail1 Spidermankevin78@gmail.com
  iab _mail2 kevinross@linuxmail.org
  iab _maillink <a href="spidermankevin7@gmail.com>spidermankevin7@gmail.com</a>
" Heads
  iab _ct #================================================================{{{<CR><CR>#================================================================}}}<esc>ki
  iab _cc // <CR>//----------------------------------------------------------------------------<ESC>ki
" HOME
  iab _h ~/
  iab _dos /usr/bin/dosbox
  iab _wine /usr/local/bin/wine
  iab _null  >/dev/null 2>&1 &
  iab _table <table>
  iab _cells <tr><tb><tb></tr>
"=================================================================}}}

"==============AutoCommands======================================={{{
"set all filetypes textwidth to
  autocmd FileType text setlocal textwidth=80
" larger MRU window height
let MRU_Window_Height = 20

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
" reopen file where you left off
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
"---Make calcurse notes markdown compatible:
    autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
    autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown
"---omnifunc settings for deffernt file types
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType c setlocal omnifunc=ccomplete#Complete
"---Python
    let python_highlight_all = 1
    au FileType python syn keyword pythonDecorator True None False self
"---JavaScript
    au FileType javascript call JavaScriptFold()
    au FileType javascript setl fen
    au FileType javascript setl nocindent
"---X11-Basic
    autocmd BufNewFile,BufRead *.bas set ft Basic
    autocmd BufNewFile,BufRead *.BAS set ft Basic
    autocmd BufNewFile,BufRead *.bas set syntax Basic
    autocmd FileType basic  set foldmethod=indent


"---other
  au BufNewFile,BufRead *.jinja set syntax=htmljinja
  au BufNewFile,BufRead *.mako set ft=mako

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e
" Save file as sudo on files that require root permission
"================================================================}}}
"==============Plugin Settings============================================{{{
"
" Open NERDTree when no files are specified (eg. `vim`)
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Show hidden files in NERDTree
let NERDTreeShowHidden=1
let nerdchristmastree=1
let g:NERDTreeMinimalUI = 1
let g:nerdtreewinsize = 25
let g:NERDTreeDirArrowExpandable = '▷'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeAutoCenter=1
let g:NERDTreeIndicatorMapCustom = {
        \ "modified"  : "✹",
        \ "staged"    : "✚",
        \ "untracked" : "✭",
        \ "renamed"   : "➜",
        \ "unmerged"  : "═",
        \ "deleted"   : "✖",
        \ "dirty"     : "✗",
        \ "clean"     : "✔︎",
        \ 'ignored'   : '☒',
        \ "unknown"   : "?"
        \ }
" Startify
let g:startify_custom_header = [
    \ ' ___   ___   ______   __   __   ______       __   __   ________  ___ __ __	',
    \ '/___/\/__/\ /_____/\ /_/\ /_/\ /_____/\     /_/\ /_/\ /_______/\/__//_//_/\	',
    \ '\::.\ \\ \ \\::::_\/_\:\ \\ \ \\::::_\/_    \:\ \\ \ \\__.::._\/\::\| \| \ \	',
    \ ' \:: \/_) \ \\:\/___/\\:\ \\ \ \\:\/___/\    \:\ \\ \ \  \::\ \  \:.      \ \	',
    \ '  \:. __  ( ( \::___\/_\:\_/.:\ \\_::._\:\    \:\_/.:\ \ _\::\ \__\:.\-/\  \ \	',
    \ '   \: \ )  \ \ \:\____/\\ ..::/ /  /____\:\    \ ..::/ //__\::\__/\\. \  \  \ \	',
    \ '    \__\/\__\/  \_____\/ \___/_(   \_____\/     \___/_( \________\/ \__\/ \__\/	',
    \ ]
let g:startify_session_dir = '~/.vim/session'
let g:startify_lists=[
	    \ {	'type': 'bookmarks',	'header': ['	Bookmarks']	},
	    \ {	'type': 'commands',	'header': ['	Commands']	},
	    \ {	'type': 'files',	'header': ['	Recent Files']	},
	    \ {	'type': 'sessions',	'header': ['	Sessions']	},
	    \ ]
let g:startify_commands = [ 'VimwikiIndex', 'VimDaryIndex', 'Notes', 'MRU', 'NERDTree', 'Explore' ]
let g:startify_bookmarks = ['~/.zshrc', '~/.aliasrc', '~/.scripts/', '~/Notes/', '~/.i3/config', '~/.config/nvim/init.vim', '~/.remind','~/.config/ranger/rc.conf']
""""""""""""
"Airline   "
""""""""""""
"main settings
let g:airline_powerline_fonts = 1
let g:airline_symbols = {}
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols_branch = ''
let g:airline_powerline_fonts = 1
let g:airline_symbols.crypt = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.modified = ' '

let g:airline#extensions#unicode#enabled = 1

"""""""""""""
"Devicons   "
"""""""""""""
let g:webdevicons_enable = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_denite = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_vimfiler = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''
"=========================================================================}}}
"==============CtrlP Settings=============================================={{{
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-p>'
map <leader>j :CtrlP
map <c-b> :CtrlPBuffer<cr>
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
"==========================================================================}}}
"=============File Type Settings====================================={{{
"=====Vim Notes====
let g:notes_directories = ['~/Notes', '~/Dropbox/Shared Notes']
"=====Mark Down====
let g:vim_markdown_fenced_languages=['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'rb=ruby']
"=====Html settings====
let html_number_lines = 1
let html_ignore_folding = 1
let html_use_css = 1
let html_no_pre = 1
let use_xhtml = 0
let xml_use_xhtml = 0
let g:PreviewBrowsers='surf,w3m,firefox'
"=====================================================================}}}
"======================GUI Options============================================{{{{
if exists('g:GuiLoaded')
    colorscheme Tomorrow-Night-Eighties      "First Choice
endif

"}}}}
