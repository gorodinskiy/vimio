"disable annoying bell and epileptic flash
set noerrorbells visualbell t_vb=
if has('autocmd')
    augroup no_visual_bell
        autocmd!
        autocmd GUIEnter * set visualbell t_vb=
    augroup end
endif
