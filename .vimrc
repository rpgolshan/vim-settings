set nocompatible              " be iMproved, required
set fileformat=unix
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Keep Plugin commands between vundle#begin/end.

" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" delimitMate Adds end brackets and stuffs
Plugin 'Raimondi/delimitMate'
" CtrlP https://github.com/ctrlpvim/ctrlp.vim
Plugin 'ctrlpvim/ctrlp.vim'
" nerdtree - directory
Plugin 'scrooloose/nerdtree'
" tagbar
if executable('ctags')
    Bundle 'majutsushi/tagbar'
endif
" solarized colorscheme https://github.com/jwhitley/vim-colors-solarized
" Plugin 'altercation/vim-colors-solarized'
Plugin 'jwhitley/vim-colors-solarized'
" NERD commenter https://github.com/scrooloose/nerdcommenter
Plugin 'scrooloose/nerdcommenter'
" Fugitive - git intergrator https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'

" Asynchronous linter
Plugin 'dense-analysis/ale'


Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" https://github.com/tpope/vim-surround
Plugin 'tpope/vim-surround'

Plugin 'ryanoasis/vim-devicons'
" Plugin 'powerline/fonts'

Plugin 'ycm-core/YouCompleteMe'
"ycm extra conf generator -- :YcmGenerateConfig
Plugin 'rdnetto/YCM-Generator'
" eclim
" INSTALL THIS ON YOUR OWN FOR JAVA AUTOCOMPLETE TO WORK


" Jinja2 syntax support
Plugin 'chase/vim-ansible-yaml'
Plugin 'Glench/Vim-Jinja2-Syntax'

" React jsx support
Plugin 'yuezk/vim-js'
Plugin 'maxmellon/vim-jsx-pretty'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"let g:UltiSnipsUsePythonVersion = 2
 let g:ycm_use_ultisnips_completer = 1

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" use c-j to complete a snip
let g:UltiSnipsExpandTrigger="<c-j>"
" c-e to show all snips
let g:UltiSnipsListSnippets="<c-e>"

let g:ycm_auto_trigger = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" Disable AutoComplPop.
" Use neocomplete.
" let g:neocomplete#enable_at_startup = 1
" Use smartcase.
" let g:neocomplete#enable_smart_case = 1


" some bug going on right now.. use F5 to force Filetype recognition
nnoremap <F5> :doautocmd FileType<CR>

" autocmd FileType python setlocal omnifunc=jedi#completions
" let g:jedi#completions_enabled=0
" let g:jedi#auto_vim_configuration=0
let g:ycm_collect_identifiers_from_tags_files = 1

" let g:ycm_confirm_extra_conf = '/cygdrive/c/Users/robgol01/OneDrive - ARM/Documents/445L/.ycm_extra_conf.py'
" let g:ycm_global_ycm_extra_conf = '/cygdrive/c/Users/robgol01/OneDrive - ARM/Documents/445L/.ycm_extra_conf.py'
" let g:ycm_confirm_extra_conf = '/~/lab-charms/latest/ubenchmark/src/.ycm_extra_conf.py'

" eclim auto complete
let g:EclimCompletionMethod = 'omnifunc'

" jump to tagbar window when opening
let g:tagbar_autofocus = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

let g:jedi#usages_command = ""
let g:NERDDefaultAlign = "left"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Show line numbers
set relativenumber
set number
" Toggle line numbers on and off
map <leader>nn :setlocal number! relativenumber!<cr>

" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>b :TagbarToggle<CR>
" nmap <leader>v :TagbarOpen j<CR>
"nmap <leader>p :TagbarTogglePause<CR>
nnoremap <leader>p :CtrlPTag<cr>

" map <leader>x :SyntasticCheck<cr>
map <leader>x :ALEFix<cr>
map <leader>c :lclose<cr>
map <leader>v :lopen<cr>
map <leader>g :Gstatus<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
"command W w !sudo tee % > /dev/null

" fixing common mistakes
command! W w
command! Q q
command! Wq wq
command! WQ wq

"vimdiff verticle
set diffopt=vertical,filler

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.d,*.crf,*.rst,*.axf,*.lnp,*.lst,*.map,*.iex,*.scvd,*.htm,*.dep,*.tra,*.plg,*.uv*,*.xls
if has("win16") || has("win32")
set wildignore+=.git\*,.hg\*,.svn\*
else
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=1

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
"set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" set background=dark
" colorscheme desert
if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" let g:solarized_contrast="high"
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
let g:solarized_italic=1
let g:solarized_bold=1
let g:solarized_underline=1
colorscheme solarized
endif


set cursorline                  " Highlight current line
" set cursorcolumn                " Highlight current column

let g:ale_linters = {'python': ['pylint', 'mypy']}
let g:ale_fixers = {'python': ['yapf']}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0


" Set extra options when running in GUI mode
if has("gui_running")
set guioptions-=T
set guioptions-=e
set t_Co=256
set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 120 characters
set lbr
set wrap "Wrap lines
set nolist "list disables linebreak
set tw=120
set fo+=t "enable automatic text wrapping
" Set .yaml,.commit file tw to be 80
autocmd BufReadPost,BufNewFile *.yaml,*COMMIT_EDITMSG setlocal tw=72

autocmd FileType c setlocal shiftwidth=8 noexpandtab
autocmd FileType yml,yaml setlocal shiftwidth=2 tabstop=2 ft=ansible
autocmd FileType js setlocal shiftwidth=2 tabstop=2

set ai "Auto indent
set si "Smart indent


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
"map <leader>bd :Bclose<cr>:tabclose<cr>gT
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabmove
map <leader>tn :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
set switchbuf=useopen
set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" disable whitespace checking
let g:airline#extensions#whitespace#enabled = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#parts#filetype#enabled = 0
let g:airline_section_x = ''
let g:airline_skip_empty_sections = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
" autocmd BufWrite *.py :call DeleteTrailingWS()
" autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWritePre * :call DeleteTrailingWS()
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")| exe "normal! g'\"" | endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>z :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

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


let NERDTreeIgnore = ['\.pyc$', '^__pycache__$[[dir]]', '\.crf', '\.d$[[file]]', '\.o$[[file]]', '\.scvd', '\.uv*', '\.dep', '\.axf', '\.lnp', '\.lst', '\.map', '\.iex', '\.egg-info$[[dir]]']

let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_by_filename = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_extensions = ['tag']
" ctrl d(filename/path),f(modes), r(regex)
" autocmd BufWritePre * %s/[^\s]\+\s\+$//e
