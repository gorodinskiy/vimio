if has("gui_running")
    " Maximize gvim window.
    set lines=40 columns=160
    set linespace=2
    set numberwidth=3

    if has("unix")
        if has("gui_mac") || has("gui_macvim")
            set guifont=IBM\ Plex\ Mono\ 12
            set linespace=5
            set macmeta
        else
            let os = substitute(system('uname'), "\n", "", "")
            if os == "Linux"
                set guifont=IBM\ Plex\ Mono\ 12
                "set clipboard=unnamedplus
            endif
        endif
    else
        if has("gui_win32") || has("gui_win32s")
            set guifont=Consolas:h11
        endif
    endif

    "hide menu,toolbar,scrollbar
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar

    set guioptions+=LIRrb
    set guioptions-=LIRrb
    set guioptions+=LIRlb
    set guioptions-=LIRlb

    "set cursorline
endif
