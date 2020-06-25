" file types that weren't recognized for some reason
autocmd BufReadPre *.xsl set filetype=xslt
autocmd BufReadPre *.dtd set filetype=xslt
autocmd BufRead,BufNewFile *.vm set ft=html syntax=velocity
autocmd BufRead,BufNewFile *.vt set ft=html syntax=velocity
autocmd BufRead,BufNewFile *.less set filetype=less.css
autocmd BufReadPost *.mheg set syntax=mheg
autocmd BufReadPost *.mhg set syntax=mheg
autocmd BufReadPost *.ex set syntax=elm
autocmd BufReadPost *.exs set syntax=elm
autocmd BufReadPost *.eex set syntax=elm
autocmd BufReadPost *.elm set syntax=elm
autocmd BufRead,BufNewFile .tmux.conf.local set ft=tmux syntax=tmux
autocmd BufRead,BufNewFile .babelrc set ft=json syntax=json
autocmd BufRead,BufNewFile .prettierrc set ft=yaml syntax=yaml
autocmd BufRead,BufNewFile .npmrc set ft=sh syntax=sh
autocmd BufRead,BufNewFile *.env,*.env.* set ft=sh syntax=sh
autocmd BufRead,BufNewFile hosts set ft=sh syntax=sh
autocmd BufRead,BufNewFile .gitconfig.local set ft=gitconfig
" https://scalameta.org/metals/docs/editors/vim.html
autocmd BufRead,BufNewFile *.sbt set filetype=scala
" RFCS questionable decision
" autocmd BufRead,BufNewFile *.todo.md,*.todo set ft=todo | call VimTodoListsInit()

" for coc.vim
autocmd FileType json syntax match Comment +\/\/.\+$+

" for Todo
autocmd bufnewfile todo.md call append(0, '# Todo')
autocmd bufnewfile todo.md call append(1, 'Date: ')
autocmd bufnewfile,bufread,filewritepre todo.md exe "g/Date: */s/Date: *.*/Date: " .strftime("%a %d %b %Y")
autocmd bufnewfile,Bufwritepre,filewritepre todo.md execute "normal Go"
