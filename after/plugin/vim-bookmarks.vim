" taken from https://github.com/MattesGroeger/vim-bookmarks/issues/38#issuecomment-84413066
let g:bookmark_no_default_key_mappings = 1

function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mn :BookmarkNext<CR>
    nmap mp :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear<CR>
    nmap mx :BookmarkClearAll<CR>
endfunction

function! BookmarkUnmapKeys()
    unmap mm
    unmap mi
    unmap mn
    unmap mp
    unmap ma
    unmap mc
    unmap mx
endfunction

augroup handle_nerd_tree_keys_with_bookmark
    autocmd!
    autocmd BufEnter * :call BookmarkMapKeys()
    autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
augroup end

" to disable bookmark keys in CtrlP
let g:ctrlp_buffer_func = {
    \ 'enter': 'BookmarkUnmapKeys',
    \ 'exit': 'BookmarkMapKeys'
    \ }