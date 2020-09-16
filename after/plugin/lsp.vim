if has('nvim') && has('nvim-0.5.0')

" diagnotics {{{
    let g:diagnostic_insert_delay = 1
    let g:diagnostic_enable_virtual_text = 0

    augroup show-line-diagnostics
        autocmd!
        autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()
    augroup end
" }}}

    function! LspEnable()
lua <<EOF
    require'nvim_lsp'.gopls.setup{on_attach=require'diagnostic'.on_attach}
    require'nvim_lsp'.tsserver.setup{on_attach=require'diagnostic'.on_attach}
    require'nvim_lsp'.intelephense.setup{on_attach=require'diagnostic'.on_attach}
    require'nvim_lsp'.pyls.setup{on_attach=require'diagnostic'.on_attach}
    require'nvim_lsp'.html.setup{on_attach=require'diagnostic'.on_attach}
    require'nvim_lsp'.cssls.setup{on_attach=require'diagnostic'.on_attach}
    require'nvim_lsp'.jsonls.setup{on_attach=require'diagnostic'.on_attach}
    require'nvim_lsp'.sumneko_lua.setup{on_attach=require'diagnostic'.on_attach}
    require'nvim_lsp'.rls.setup{on_attach=require'diagnostic'.on_attach}
    require'nvim_lsp'.metals.setup{on_attach=require'diagnostic'.on_attach}
    require'nvim_lsp'.ccls.setup{on_attach=require'diagnostic'.on_attach}
    require'nvim_lsp'.kotlin_language_server.setup{on_attach=require'diagnostic'.on_attach}
    require'nvim_lsp'.sourcekit.setup{on_attach=require'diagnostic'.on_attach}
    require'nvim_lsp'.ocamlls.setup{on_attach=require'diagnostic'.on_attach}
    require'nvim_lsp'.dartls.setup{on_attach=require'diagnostic'.on_attach}
    require'nvim_lsp'.terraformls.setup{on_attach=require'diagnostic'.on_attach}
    -- require'nvim_lsp'.vimls.setup{on_attach=require'diagnostic'.on_attach}
EOF

        if bufname("%") != ""
            execute 'edit!'
        endif
    endfunction

    function! LspDisable()
        lua vim.lsp.stop_client(vim.lsp.get_active_clients())

        if bufname("%") != ""
            execute 'edit!'
        endif
    endfunction

    command! LspEnable :call LspEnable()
    command! LspDisable :call LspDisable()

    call LspEnable()

    " autocmd Filetype * setlocal omnifunc=v:lua.vim.lsp.omnifunc

    nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
    nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
    nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap <leader>rn    <cmd>lua vim.lsp.buf.rename()<CR>
    nnoremap <leader>ac    <cmd>lua vim.lsp.buf.code_action()<CR>
    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g :PrevDiagnostic<CR>
    nmap <silent> ]g :NextDiagnostic<CR>
else
    if !executable('npm') || !exists("g:coc_enabled")
        finish
    endif

    " https://github.com/neoclide/coc.nvim#example-vim-configuration

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
    if exists('*complete_info')
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
endif
