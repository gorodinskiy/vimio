" Konstantin Gorodinskiy(mail[at]konstantin.io)

set nocompatible
filetype plugin on

let mapleader = ","

call plug#begin()

" General stuff {{{
    Plug 'mhinz/vim-startify'
    Plug 'MattesGroeger/vim-bookmarks'
    " Plug 'Shougo/vimproc.vim', { 'do': 'make' }
    Plug 'xolox/vim-misc'
    Plug 'jiangmiao/auto-pairs'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'gcmt/taboo.vim'
    Plug 'chaoren/vim-wordmotion'

    Plug 'xolox/vim-easytags', {
            \ 'on': [
                \ 'UpdateTags',
                \ 'HighlightTags'
            \ ] }

    Plug 'vim-scripts/TaskList.vim', { 'on':  'TaskList' }
    Plug 'scrooloose/nerdtree', {
            \ 'on': [
                \ 'NERDTree',
                \ 'NERDTreeCWD',
                \ 'NERDTreeClose',
                \ 'NERDTreeFind',
                \ 'NERDTreeFocus',
                \ 'NERDTreeFromBookmark',
                \ 'NERDTreeMirror',
                \ 'NERDTreeToggle'
            \ ] }

    Plug 'voldikss/vim-floaterm', {
            \ 'on': [
                \ 'FloatermNew',
                \ 'FloatermToggle',
                \ 'FloatermPrev',
                \ 'FloatermNext'
            \ ] }

    Plug 'wellle/context.vim', {
            \ 'on': [
                \ 'ContextActivate',
                \ 'ContextEnable',
                \ 'ContextDisable',
                \ 'ContextToggle',
                \ 'ContextUpdate'
            \ ] }

    Plug 'kkoomen/vim-doge'
    Plug 'mattn/emmet-vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
    Plug 'honza/vim-snippets'
    Plug 'editorconfig/editorconfig-vim'

    " slows things down considerably
    " if has('nvim') && has('nvim-0.3.0') && (has('python') || has('python3'))
    " Plug 'TaDaa/vimade'
    " endif

    Plug 'janko/vim-test', {
            \ 'for': [
                \ 'javascript',
                \ 'typescript',
                \ 'go',
                \ 'c',
                \ 'cpp',
                \ 'rust',
                \ 'scala'],
            \ 'on': [
                \ 'TestNearest',
                \ 'TestFile',
                \ 'TestSuite',
                \ 'TestLast',
                \ 'TestVisit'
            \ ] }

    Plug 'jpalardy/vim-slime'

    Plug 'tpope/vim-surround'
    Plug 'pbrisbin/vim-mkdir'
    Plug 'godlygeek/tabular'
    " Plug 'tyru/open-browser.vim'

    Plug 'mattn/webapi-vim'
    Plug 'mattn/gist-vim', { 'on': ['Gist'] }

    " https://github.com/szw/vim-g/pull/19
    Plug 'gko/vim-g'
    Plug 'airblade/vim-rooter'

    " if has('patch-8.1.2114') || has('nvim-0.4')
    " Plug 'liuchengxu/vim-clap', { 'do': function('clap#helper#build_all') }
    " else

    if isdirectory('/usr/local/opt/fzf')
        Plug '/usr/local/opt/fzf'
    else
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    endif

    Plug 'junegunn/fzf.vim', {
            \ 'on': [
                \ 'Ag',
                \ 'Rg',
                \ 'FZF',
                \ 'Files',
                \ 'GitFiles',
                \ 'Buffers',
                \ 'Commits',
                \ 'BCommits',
                \ 'Tags',
                \ 'BTags',
                \ 'History',
                \ 'Lines',
                \ 'BLines',
                \ 'Marks'
            \ ] }

    Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme', 'wast', 'wat'] }
    " Plug 'dense-analysis/ale', {
            " \ 'for': [
                " \ 'javascript',
                " \ 'typescript',
                " \ 'vue',
                " \ 'css',
                " \ 'scss',
                " \ 'go',
                " \ 'rust',
                " \ 'scala'
            " \ ] }

    Plug 'itchyny/lightline.vim'
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'

    Plug 'sedm0784/vim-you-autocorrect', {
            \ 'on': [
                \ 'EnableAutocorrect',
                \ 'DisableAutocorrect'
            \ ] }

    Plug 'wsdjeg/vim-fetch'
    Plug 'gko/upside-down'
    Plug 'kristijanhusak/vim-carbon-now-sh', { 'on': 'CarbonNowSh' }

    if has('python3')
        Plug 'SirVer/ultisnips'
    endif
" }}}

" Git stuff {{{
    Plug 'tpope/vim-fugitive', {
            \ 'on': [
                \ 'Gcommit',
                \ 'Gstatus',
                \ 'Gblame',
                \ 'Gdiff',
                \ 'Gedit',
                \ 'Gmove',
                \ 'Gdelete',
                \ 'Flog',
                \ 'Flogsplit'
            \ ] }

    Plug 'rbong/vim-flog', {
            \ 'on': [
                \ 'Flog',
                \ 'Flogsplit'
            \ ] }

    Plug 'junegunn/vim-github-dashboard', {
            \ 'on': [
                \ 'GHDashboard',
                \ 'GHActivity'
            \ ] }

    Plug 'ruanyl/vim-gh-line'

    Plug 'airblade/vim-gitgutter'
" }}}

" LSP {{{
    if has('nvim') && has('nvim-0.5.0')
        Plug 'neovim/nvim-lsp'
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'Shougo/deoplete-lsp'
        Plug 'fszymanski/deoplete-emoji'
        let g:deoplete#enable_at_startup = 1
    else
        if executable('npm')
            Plug 'neoclide/coc.nvim', { 'branch': 'release' }
            Plug 'neoclide/coc-java', {'do': 'npm i'}
            Plug 'neoclide/coc-snippets', {'do': 'npm i'}

            let g:UltiSnipsExpandTrigger="<nop>"
        endif
    endif
" }}}

" Colorschemes {{{
    Plug 'rakr/vim-two-firewatch'
    Plug 'sainnhe/edge'
    Plug 'Lokaltog/vim-monotone'
    Plug 'arzg/vim-colors-xcode'
    Plug 'rakr/vim-one'
    Plug 'sainnhe/sonokai'
    Plug 'AlxHnr/clear_colors'
    Plug 'w0ng/vim-hybrid'
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    Plug 'cocopon/iceberg.vim'
    Plug 'fxn/vim-monochrome'
    Plug 'arcticicestudio/nord-vim'
    Plug 'mhartington/oceanic-next'
    Plug 'rhysd/vim-color-spring-night'
    Plug 'dterei/VimCobaltColourScheme'
    Plug 'tpope/vim-vividchalk'
    Plug 'reedes/vim-colors-pencil'
    Plug 'chriskempson/base16-vim'
    Plug 'trapd00r/neverland-vim-theme'
    Plug 'chriskempson/vim-tomorrow-theme'
    Plug 'jpo/vim-railscasts-theme'
    Plug 'altercation/vim-colors-solarized'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'twerth/ir_black'
    Plug 'nanotech/jellybeans.vim'
    Plug 'trevordmiller/nova-vim'
    Plug 'vim-scripts/Wombat'
    Plug 'sjl/badwolf'
    Plug 'zaiste/Atom'
    Plug 'morhetz/gruvbox'
    Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'nightsense/snow'
    Plug 'nightsense/stellarized'
    Plug 'nightsense/cosmic_latte'
    Plug 'cormacrelf/vim-colors-github'
    Plug 'romgrk/github-light.vim'
" }}}

" HTML/HAML {{{
    Plug 'othree/html5.vim', { 'for': 'html' }
    Plug 'hokaccha/vim-html5validator', { 'for':  'html' }
    Plug 'tpope/vim-haml', { 'for':  'haml' }
    Plug 'mustache/vim-mustache-handlebars'
" }}}

" CSS/LESS {{{
    Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
    Plug 'gko/vim-coloresque', { 'for': ['css', 'scss', 'sass', 'stylus'] }
    Plug 'groenewege/vim-less', { 'for':  'less' }
" }}}

" JavaScript {{{
    Plug 'pangloss/vim-javascript', { 'for':  'javascript' }
    if executable('npm')
        Plug 'prettier/vim-prettier', {
                    \ 'do': 'npm install',
                    \ 'for': [
                    \ 'javascript',
                    \ 'html',
                    \ 'typescript',
                    \ 'css',
                    \ 'less',
                    \ 'scss',
                    \ 'json',
                    \ 'graphql',
                    \ 'markdown',
                    \ 'vue',
                    \ 'yaml'
                    \ ] }
    endif
    Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'typescript'] }
    Plug 'jparise/vim-graphql'
" }}}

" Typescript {{{
    if has('nvim')
        " Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
        " https://github.com/HerringtonDarkholme/yats.vim/pull/189
        Plug 'gko/yats.vim', { 'for': 'typescript' }
    else
        " TODO remove once merged https://github.com/leafgarland/typescript-vim/pull/140
        autocmd BufRead,BufNewFile *.tsx setfiletype typescriptreact
        " due to this issue https://github.com/HerringtonDarkholme/yats.vim/issues/25
        Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescriptreact'] }
    endif
    " Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
" }}}

" JSX {{{
    Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript', 'typescript', 'typescriptreact'] }
" }}}

" Webassembly {{{
    Plug 'rhysd/vim-wasm', { 'for': ['wast', 'wat'] }
" }}}

" JSON {{{
    Plug 'elzr/vim-json', { 'for': 'json' }
" }}}

" TOML {{{
    Plug 'cespare/vim-toml', { 'for': 'toml' }
" }}}

" PHP {{{
    Plug 'StanAngeloff/php.vim', { 'for': 'php' }
" }}}

" Python/Django {{{
    Plug 'klen/python-mode', { 'for': 'python' }
    Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" }}}

" C/C++ {{{
    Plug 'justmao945/vim-clang', { 'for': ['c', 'cpp'] }
" }}}

" Go {{{
    if executable('go')
        Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
        Plug 'mdempsky/gocode', { 'for': 'go' }
    endif
" }}}

" Ruby/Rails {{{
    Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
    Plug 'tpope/vim-rails', { 'for': 'ruby' }
" }}}

" Dart {{{
    Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
" }}}

" Pug {{{
    Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
" }}}

" Stylus {{{
    Plug 'wavded/vim-stylus', { 'for': 'stylus' }
" }}}

" Scala {{{
    Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
" }}}

" Java {{{
    Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
" }}}

" Rust {{{
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }
    Plug 'racer-rust/vim-racer', { 'for': 'rust' }
" }}}

" Elm {{{
    Plug 'ElmCast/elm-vim', { 'for': 'elm' }
    Plug 'elixir-editors/vim-elixir', { 'for': 'elm' }
" }}}

" Kotlin {{{
    Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }
" }}}

" Markdown {{{
    Plug 'jkramer/vim-checkbox', { 'for': 'markdown' }
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

    if executable('npm')
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install' }
    endif

    Plug 'ferrine/md-img-paste.vim', { 'for': 'markdown' }
" }}}

" Mheg {{{
    Plug 'vim-scripts/mheg', { 'for': 'mheg' }
" }}}

" Nginx {{{
    Plug 'chr4/nginx.vim'
" }}}

" ReasonML {{{
" Plug 'reasonml-editor/vim-reason-plus'
" }}}

" Swift {{{
    Plug 'keith/swift.vim', { 'for': 'swift' }
" }}}

" Terraform {{{
    Plug 'hashivim/vim-terraform', { 'for': 'tf' }
    Plug 'juliosueiras/vim-terraform-completion', { 'for': 'tf' }
" }}}

" Your part of config {{{
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }}}
call plug#end()
