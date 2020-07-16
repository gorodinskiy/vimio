let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let netrw_browse_split = 4
let g:netrw_winsize = 27

" show file in netrw
" command! ExploreFind execute 'Explore' expand("%:p:h")
" | normal n

autocmd FileType netrw setl bufhidden=delete
