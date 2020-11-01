" augroup check-prettier-version
    " autocmd!

    " autocmd FileType javascript, html, typescript, css, less, scss, json, graphql, markdown, vue, yaml
        " \ if exists('g:loaded_prettier') && prettier#PrettierCli('--version') < '2.0' |
        " \   let g:prettier#config#arrow_parens = 'avoid' |
        " \ endif
" augroup end