"
" Most of the config items here are from SPF13's vimrc. See:
" https://github.com/spf13/spf13-vim/
"


execute pathogen#infect()

let mapleader='\'

filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set virtualedit=onemore     " Allow for cursor beyond last character
set history=1000            " Store a ton of history (default is 20)
set hidden                  " Allow buffer switching without saving
set spell                   " Enable spell check
set backup                  " Backups are nice ...
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set nobackup                " No ~ files.
set nowritebackup           " No ~ files.
set foldmethod=syntax       " Fold based on syntax
set foldlevel=99            " So that all folds are opened at startup.
set wrap


" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Restore cursor to file position in previous editing session
function! ResCur()
    if line("'\"") <= line("$")
        silent! normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END


" Strip trailing whitespace on save. https://unix.stackexchange.com/a/75438/20629
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


"
"
"  Vim User Interface
"
"
set background=dark
set ruler                       " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd                     " Show partial commands in status line and
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set cursorline                  " Highlight current line
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set colorcolumn=80              " Vertical line as column 80
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
hi clear SpellBad
hi SpellBad cterm=underline
set termguicolors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
hi Normal guibg=NONE ctermbg=NONE
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE

"
" Status Line
"
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
" set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"
"
"  Formatting
"
"
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current


"
"
" Key Mappings
"
"


" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Right> <C-W>l
map <C-Left> <C-W>h


"
"
" Plugins Config
"
"

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {'mode':'passive'}
nnoremap <C-p>S :SyntasticCheck<CR> :SyntasticToggleMode<CR>


"
" Source local vim file.
"
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
