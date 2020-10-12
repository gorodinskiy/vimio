filetype plugin indent on     " required!

" this deletes  symbols(mostly at the end of the lines)
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" timeout after leader key
" see https://stackoverflow.com/a/26657284/676756
set timeout
set ttimeout
set timeoutlen=300
set ttimeoutlen=50

"cursor
set guicursor=n-v-c:hor15-Cursor-blinkon1000-blinkoff1000
set guicursor+=i:ver5-Cursor-blinkon1000-blinkoff1000

" to keep cursor in the center of the screen (almost identical to 'zz')
" set scrolloff=50

" Don’t add empty newlines at the end of files
" this has to go before expandtab
set binary
set noeol

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the filename in the window titlebar
set title

"Show the (partial) command as it’s being typed
set showcmd

" hate modelines
set modelines=0
set nomodeline

set ruler
" this lowers the perf a lot
set cursorline
set lazyredraw

" backups
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files
"set backupdir=$HOME/tmp

" line numbers
set number

set showtabline=1
set wrap                " line breaking (http://vimcasts.org/episodes/soft-wrapping-text/)

" if version >= 703
"   set colorcolumn=80 " 80 column end
" disable colorcolumn
set cc=

set textwidth=80
set formatoptions-=o    " dont continue comments when pushing o/O
set linebreak           " line breaking without breaking word

" https://vim.fandom.com/wiki/Increasing_or_decreasing_numbers
set nrformats+=alpha

" http://www.allaboutvim.ru/2012/03/blog-post.html
set path=.,,**

" don't show pair quote
" let loaded_matchparen=1
set noshowmatch " don't show pair <> в HTML

" status line
set laststatus=2

" set paste
set nopaste

" Make vim more useful
set nocompatible

if !has("nvim")
    " Allow cursor keys in insert mode
    set esckeys
else
    " https://neovim.io/doc/user/options.html#'inccommand'
    set inccommand=nosplit
end

set splitbelow
set splitright

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" backspace
set backspace=indent,eol,start

" Don’t show the intro message when starting vim
" set shortmess=I

" in case if you don't open a file
" cd $HOME
cd %:p:h

set history=1000 " store lots of :cmdline history
set fillchars=""

" https://github.com/neoclide/coc.nvim#example-vim-configuration
" if hidden is not set, TextEdit might fail.
set hidden

" Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
if v:version >= 705
    set signcolumn=yes
endif

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif
