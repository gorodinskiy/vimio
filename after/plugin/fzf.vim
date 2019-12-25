nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
nnoremap <silent> <C-p> :Files<CR>
" show buffers
nnoremap <silent> <C-b> :Buffers<CR>
" still testing
nnoremap <silent> <Leader>b :Buffers<CR>

let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'

" https://github.com/junegunn/fzf.vim/issues/121
if executable('ag')
    let $FZF_DEFAULT_COMMAND = 'ag -g ""'
elseif executable('fd')
    let $FZF_DEFAULT_COMMAND='fd --type f --exclude .git'
elseif executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git"'
endif

if has('nvim') && exists("*nvim_open_win")
    let g:fzf_layout = { 'window': 'call FloatingFZF()' }

    function! FloatingFZF()
        let buf = nvim_create_buf(v:false, v:true)
        call setbufvar(buf, '&signcolumn', 'no')

        let height = float2nr(10)
        let width = float2nr(80)
        let horizontal = float2nr((&columns - width) / 2)
        let vertical = 1

        let opts = {
            \ 'relative': 'editor',
            \ 'row': vertical,
            \ 'col': horizontal,
            \ 'width': width,
            \ 'height': height,
            \ 'style': 'minimal'
            \ }

        call nvim_open_win(buf, v:true, opts)
    endfunction
endif