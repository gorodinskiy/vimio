syntax on

set background=light

if exists('$TMUX')
    " Colors in tmux
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let supportsTrueColor = $COLORTERM == "truecolor" || $COLORTERM == "24bit"
if has("termguicolors") && supportsTrueColor
    set termguicolors
endif

set t_Co=256
let g:molokai_original = 1
let g:solarized_termcolors=256

" set colorscheme
" if you have base16 installed take that colorscheme
try
    if filereadable(expand("~/.vimrc_background"))
        let base16colorspace=256

        source ~/.vimrc_background

        if ! exists('g:airline_theme')
            let g:airline_theme='base16'
        endif

        " https://github.com/chriskempson/base16-vim/pull/210#issuecomment-609629586
        if exists('g:base16_gui0E')
            highlight CursorLineNr cterm=none gui=none
            exec "hi Statement guifg=#" . g:base16_gui0E
            exec "hi Statement ctermfg=" . g:base16_cterm0E
        endif
    else
        let g:github_colors_soft = 1
        let g:lightline = { 'colorscheme': 'github' }
        colorscheme github
        let g:airline_theme='github'

        " https://github.com/cormacrelf/vim-colors-github/pull/5
        hi! link SignColumn LineNr
    endif
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry
