nnoremap <Esc>A <up>
nnoremap <Esc>B <down>
nnoremap <Esc>C <right>
nnoremap <Esc>D <left>
inoremap <Esc>A <up>
inoremap <Esc>B <down>
inoremap <Esc>C <right>
inoremap <Esc>D <left>

"symbols in editing mode
imap <Leader>>> »
imap <Leader><< «
imap <Leader>-- —
imap <Leader>- –
imap <Leader>' ’

" remap cyrrilic symbols
"set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]

map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '

map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .

map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }

map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "

map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >


" select all
nnoremap <Leader>a gg0vGG$
vnoremap <Leader>a gg0vGG$
nnoremap <M-a> gg0vGG$
vnoremap <M-a> gg0vGG$

" < >
vnoremap < <gv
vnoremap > >gv

" paste and select
xnoremap p pgvy
xnoremap P Pgvy

"save
" https://stackoverflow.com/a/3448551/676756
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Don't skip wrap lines
noremap j gj
noremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
"inoremap <Down> <Esc>gja
"inoremap <Up> <Esc>gka

" n и N
" results of search always in center
noremap n :set hlsearch<cr>nzz
noremap N :set hlsearch<cr>Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
"autocmd CursorMoved * set nohlsearch
autocmd cursorhold * set nohlsearch
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?

" ,s
nnoremap <leader>s :%s//<left>
vnoremap <leader>s :s//<left>

" find selected text
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

" ,w
noremap <Leader>w <C-w>w

" an empty split relative to current
nmap <Leader><left>  :leftabove  vnew<CR>
nmap <Leader><right> :rightbelow vnew<CR>
nmap <Leader><up>    :leftabove  new<CR>
nmap <Leader><down>  :rightbelow new<CR>

" moving between splits
noremap <C-Left> <C-W>h
noremap <C-Down> <C-W>j
noremap <C-Up> <C-W>k
noremap <C-Right> <C-W>l

" prev buffer
nmap <Leader>bp :bp!<cr>
vmap <Leader>bp <Esc>:bp!<cr>
imap <Leader>bp <Esc>:bp!<cr>

" next buffer
nmap <Leader>bn :bn!<cr>
vmap <Leader>bn <Esc>:bn!<cr>
imap <Leader>bn <Esc>:bn!<cr>

" prev tab
nmap <Leader>tp :tabprevious<cr>
vmap <Leader>tp <Esc>:tabprevious<cr>
imap <Leader>tp <Esc>:tabprevious<cr>

" next tab
nmap <Leader>tn :tabnext<cr>
vmap <Leader>tn <Esc>:tabnext<cr>
imap <Leader>tn <Esc>:tabnext<cr>

" ,u Change case to uppercase
nnoremap <Leader>u gUiw
inoremap <Leader>u <esc>gUiwea

" everything
:cabbrev t tabedit!

" this is a weird one
" :cabbrev bd :ene!<CR>:bw #<CR>

:cabbrev qa qa!
:cabbrev q q!

:cabbrev E e

:cabbrev ц w
":cabbrev у NERDTreeClose<CR>:e!
:cabbrev й q!
:cabbrev й!! q!
:cabbrev цй wq

:cabbrev Ц w
":cabbrev У NERDTreeClose<CR>:e!
:cabbrev Й q!

:cabbrev W w
:cabbrev Wq wq
:cabbrev WQ wq
:cabbrev wQ wq
":cabbrev E NERDTreeClose<CR>:e!
:cabbrev Q q!
:cabbrev q!! q!
:cabbrev qa!! qa!
:cabbrev qA qa!
:cabbrev Qa qa!
:cabbrev QA qa!

"buffers
nnoremap <silent> <Leader>bd :ene!<CR>:bw #<CR>
vnoremap <silent> <Leader>bd :ene!<CR>:bw #<CR>
nnoremap <silent> <Leader>qa :qa<CR>
vnoremap <silent> <Leader>qa :qa<CR>
nnoremap <silent> <Leader>q :q<CR>
vnoremap <silent> <Leader>q :q<CR>

nnoremap <F4> :GundoToggle<CR>
nmap <F5> :TagbarToggle<CR>

" open ~/Documents/notes/index.md
nnoremap <Leader>ww :e ~/Documents/Notes/index.md<cr>
if !exists(":Todo")
    command Todo :vsp ~/Documents/Notes/todo.md
endif
