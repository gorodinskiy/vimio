if has("win32") || has("win32s") || has('win64')
    " delete ^M symbol when opening file
    augroup replace_m_symbol
        autocmd!
        autocmd BufRead * silent! :%s/\r\+$//
        autocmd BufRead * silent! :0
    augroup end
    language messages en

    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
endif
