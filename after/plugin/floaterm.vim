" nnoremap <silent> <leader>~ :FloatermNew --height=0.4 --width=0.98 --wintype=floating --position=bottom --autoclose=2<CR>
let g:floaterm_open_command = 'tabe'

if !exists('g:loaded_slime')
    nnoremap <C-c><C-c> :FloatermSend<CR>
    vnoremap <C-c><C-c> :FloatermSend<CR>
endif

nnoremap   <silent>   <F7>    :FloatermNew --height=0.4 --width=0.98 --wintype=floating --position=bottom --autoclose=2<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew --height=0.4 --width=0.98 --wintype=floating --position=bottom --autoclose=2<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>