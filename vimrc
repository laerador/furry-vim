" Modeline and Notes  
" vim: set foldlevel=0 foldmethod=marker foldmarker={,} ft=vim:
" 
"        ________ ++     ________
"       /VVVVVVVV\++++  /VVVVVVVV\
"       \VVVVVVVV/++++++\VVVVVVVV/
"        |VVVVVV|++++++++/VVVVV/'
"        |VVVVVV|++++++/VVVVV/'
"       +|VVVVVV|++++/VVVVV/'+
"     +++|VVVVVV|++/VVVVV/'+++++
"   +++++|VVVVVV|/VVV___++++++++++
"     +++|VVVVVVVVVV/##/ +_+_+_+_
"       +|VVVVVVVVV___ +/#_#,#_#,\
"        |VVVVVVV//##/+/#/+/#/'/#/
"        |VVVVV/'+/#/+/#/+/#/ /#/
"        |VVV/'++/#/+/#/ /#/ /#/
"        'V/'  /##//##//##//###/
"                 ++
"
"   This is a Vim Config File (.vimrc) by Franz Greiling. it gives a 
"   general Idea of what Options and Configurations are possible. It
"   should work on (hopefully) every System with at least Vim 7.2 
"   installed. You can simply clone the repository, but it is probably
"   better if you just cherry-pick the parts you want and understand.
"
"   For a more general Informationsource full with credits, check out
"   the Readme in the Repository at https://github.com/laerador
" 

" Environment {
    " Windows or *nix? {
        if has('win32') || has('win64')
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
            let os = "win"
        else
            let os = substitute(system('uname'), '\n', '', '')
        endif
    " }

    " Basic Behavior {
        " Mouse Movement, Encoding
        " Commandlineoptions, Messagesettings
        " Default Clipboard
        set nocompatible

        set encoding=utf-8
        if has('mouse')
            set mouse=a
        endif

        set showcmd
        set cmdheight=2
    
        set autoread
        set clipboard+=unnamedplus
        set shortmess+=aIoOtT
        set hidden

        filetype off
    " }

    " Language Settings {
        set nospell
        set spelllang=en_us
    " }
    
    " Backup, Swap & Undo {
        " Longer Commandhistory
        set history=1000

        " Persistent Undo and Session/view Magic
        " Need vim 7.3 + Compilerfeatures
        " Persistent Undo enabled by default,
        " for usage of views look :h mkview
        if has('persistent_undo')
            set undodir=$HOME/.vim/undo
            set undofile
            set undolevels=1000
            set undoreload=10000
        endif

        if has('mksession')
            set viewdir=$HOME/.vim/view
            set viewoptions=folds,options,cursor,unix,slash
        endif

        set directory=$HOME/.vim/swap
    " }
" }

" Plugins -- Vundle {
    " Initializing Vundle {
        " Use Bundle as Plugin Manager
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()

        " Update/Manage Vundle with Vundle
        Bundle 'gmarik/vundle'
    " }

    " Use local bundles if available {
        if filereadable(expand("~/.vimrc.bundles.local"))
            source ~/.vimrc.bundles.local
        endif
    " }

    " Plugins themselfes {
        " Dependencies {
            Bundle 'tomtom/tlib_vim'
            Bundle 'vim-addon-mw-utils'
            Bundle 'mattn/webapi-vim'
        " }
        
        " Colors {
            Bundle 'Lokaltog/vim-powerline'
            Bundle 'altercation/vim-colors-solarized'
            Bundle 'chriskempson/vim-tomorrow-theme'
            Bundle 'sjl/badwolf'
        " }

        " Autocompletion and Snippets {
            " Still not sure which Snippet-Engine to use...
            Bundle 'Shougo/neocomplcache'
            Bundle 'Shougo/neocomplcache-snippets-complete'

            " Bundle 'garbas/vim-snipmate'
            Bundle 'spf13/snipmate-snippets'
            if filereadable(expand("~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim"))
                source ~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim
            endif
        " }
        
        " Features {
            if has('python') || has('python3')
                Bundle 'sjl/gundo.vim'
            endif

            Bundle 'godlygeek/tabular'
            Bundle 'tpope/vim-commentary'
            Bundle 'tpope/vim-unimpaired'
            Bundle 'tpope/vim-surround'
            Bundle 'Townk/vim-autoclose'
            Bundle 'matchit.zip'
            Bundle 'spiiph/vim-space'
        " }
        
        " Environment {
            Bundle 'kien/ctrlp.vim'
            Bundle 'roman/golden-ratio'
            Bundle 'tpope/vim-fugitive'
            
            " CARE! Restore view automates Views
            " This can get some unintendet behavior!
            Bundle 'vim-scripts/restore_view.vim'

            Bundle 'vim-scripts/sessionman.vim'
        " }

        " Ctaging {
            if executable('ctags')
                Bundle 'majutsushi/tagbar'
                Bundle 'xolox/vim-easytags'
            endif
        " }

        " Developing {
            Bundle 'xuhdev/SingleCompile'
            Bundle 'scrooloose/syntastic'
            Bundle 'mattn/gist-vim'
        " }

        " File Specific {
            Bundle 'plasticboy/vim-markdown'
            Bundle 'LaTeX-Box-Team/LaTeX-Box'
            Bundle 'tpope/vim-git'
            Bundle 'tpope/vim-liquid'
            Bundle 'hail2u/vim-css3-syntax'
            Bundle 'othree/html5.vim'

            if (os == 'Darwin' || os == 'Mac')
                Bundle 'vim-scripts/applescript.vim'
            endif
        " }
    " }

    filetype plugin indent on
" }

" Userinterface {
    syntax on

    " Set some Layout {
        set title
        set number
        set ruler
        set cursorline
    " }

    " Fire up wildmenu {
        set wildmenu
        " Do not show these files in the Tabcompletion (in CMD)
        set wildignore=*.o,*.~,.*.class,*.exe,*.aux,*.fdb_latexmk,*.pdf
    " }

    " Search {
        set ignorecase
        set smartcase
        set incsearch
        set hlsearch
    " }

    " Movement {
        set whichwrap+=<,>,h,l,[,]
        set showmatch

        " Backspace
        set backspace=indent,eol,start

        set virtualedit=onemore

        " Set Line, at which buffer starts moving
        set scrolloff=3
    " }

    " Tabs {
        set expandtab
        set shiftwidth=4
        set tabstop=4
        set smarttab
        set softtabstop=4

        set ai
        set copyindent
    " }

    " Folds {
        " Enable Folding, but start with a very low level
        set foldenable
        set foldlevel=8
    " }

    " Theme & Customization {
        set term=screen-256color
        set t_Co=256
        set background=dark
        let g:solarized_termcolors = 256
        let g:solarized_termtrans = 1
        let g:solarized_visibility = "high"
        let g:solarized_contrast = "high"
        colorscheme badwolf

        hi LineNR ctermfg=237 
        hi Folded ctermfg=darkgrey
        hi SignColumn ctermbg=black
    " }

    " Statusline -- Powerline {
        set laststatus=2
        let g:Powerline_stl_path_style = "short"
         
        " For Fancy symbols you need a supporting Font!
        let g:Powerline_symbols = "fancy"
    " }
" }

" Key Mappings {
    " Define Leaders
    let mapleader = ","
    let maplocalleader = '\\'
    
    " Movement {
        " Easier Move between Splits
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-L> <C-W>l<C-W>_
        map <C-H> <C-W>h<C-W>_

        " Easier Movement between wraped lines
        noremap j gj
        noremap k gk
        noremap 0 g0
        noremap $ g$
        inoremap <Down> <C-o>gj
        inoremap <Up> <C-o>gk

        nnoremap Y y$
        
        " visual shifting (does not exit Visual mode)
        vnoremap < <gv
        vnoremap > >gv
    " }

    " Code Folding {
        nmap <leader>f0 :set foldlevel=0<CR>
        nmap <leader>f1 :set foldlevel=1<CR>
        nmap <leader>f2 :set foldlevel=2<CR>
        nmap <leader>f3 :set foldlevel=3<CR>
        nmap <leader>f4 :set foldlevel=4<CR>
        nmap <leader>f5 :set foldlevel=5<CR>
        nmap <leader>f6 :set foldlevel=6<CR>
        nmap <leader>f7 :set foldlevel=7<CR>
        nmap <leader>f8 :set foldlevel=8<CR>
        nmap <leader>f9 :set foldlevel=9<CR>
    " }

    " Fast editing & saving of the vimrc
    map <leader>ev :e! ~/.vimrc<CR>
    map <leader>sv :source $MYVIMRC<CR>
    
    " Search
    nnoremap <silent><leader>n :noh<CR>

    " Spell checking
    nmap <silent> <leader>sp :set spell!<cr>
    nmap <leader>sd :set spelllang=de_20<cr>
    nmap <leader>se :set spelllang=en_us<cr>
    nmap <leader>z 1z=
    
    " Adjust viewports to the same size
    map <Leader>= <C-W>=
    
    " Funktionstasten {
        " netrw

        " Gundo
        if filereadable(expand('~/.vim/bundle/gundo.vim/autoload/gundo.vim'))
            nmap <F7> :GundoToggle<CR>
            nmap <leader>gt :GundoToggle<CR>
        endif

        " Tagbar
        if filereadable(expand('~/.vim/bundle/tagbar/autoload/tagbar.vim'))
            nmap <F8> :TagbarToggle<CR>
        endif
    " }
" }

" Plugins {
    " Autoclose {
        let g:AutoCloseSelectionWrapPrefix="<leader>a"
        let g:AutoCloseExpandSpace = 0
    " }

    " Easytags {
        let g:easytags_include_members = 1
        highlight link cMember Special
        let g:easytags_by_filetype = "~/.ctags"
        let g:easytags_python_enabled = 1
    " }

    " Gundo {
        " let g:gundo_preview_bottom = 1
        " let g:gundo_help = 0
    " }

    " SingleCompile {
        let g:SingleCompile_usedialog = 0
        let g:SingleCompile_menumode = 0
        nmap <F9> :SCCompile<CR>
        nmap <F10> :SCCompileRun<CR>
    " }

    " netrw {
        let g:netrw_menu = 0
        let g:netrw_use_errorwindow = 0
        let g:netrw_liststyle = 1
        " let g:netrw_browse_split = 4

        " Make it Toggleble (Function) {
        function! ToggleVExplorer()
            if exists("t:expl_buf_num")
                let expl_win_num = bufwinnr(t:expl_buf_num)
                if expl_win_num != -1
                    let cur_win_nr = winnr()
                    exec expl_win_num . 'wincmd w'
                    close
                    exec cur_win_nr . 'wincmd w'
                    unlet t:expl_buf_num
                else
                    unlet t:expl_buf_num
                endif
            else
                exec '1wincmd w'
                Vexplore
                let t:expl_buf_num = bufnr("%")
            endif
        endfunction
        nmap <silent><F6> :call ToggleVExplorer()<CR>
        nmap <S-F6> :45Vex<CR>
        " }
    " }

    " Syntastic {
        let g:syntastic_check_on_open = 1
        let g:syntastic_auto_loc_list = 2

        " Pyflakes
        if executable('pyflakes')
            let g:syntastic_python_checker = 'pyflakes'
        endif
    " }
    
    " neocomplcache {
        " Keine Ahnung was das hier eigentlich genau macht, aber es funktioniert.
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_auto_completion_start_length = 3
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_enable_auto_delimiter = 1
        let g:neocomplcache_enable_auto_select = 1
        let g:neocomplcache_snippets_dir = '~/.vim/bundle/snipmate-snippets/snippets/'

        " Enable omni completion. 
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS 
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags 
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete 
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 

        " Enable heavy omni completion. 
        if !exists('g:neocomplcache_omni_patterns') 
            let g:neocomplcache_omni_patterns = {} 
        endif 
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::' 
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

        " Plugin key-mappings.
        imap <C-k>     <Plug>(neocomplcache_snippets_expand)
        smap <C-k>     <Plug>(neocomplcache_snippets_expand)

        " SuperTab like snippets behavior.
        imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

        " For snippet_complete marker.
        if has('conceal')
          set conceallevel=2
          set concealcursor=""
        endif
    " }

    " Tabularize {
        nmap <Leader>t= :Tabularize /=<CR>
        vmap <Leader>t= :Tabularize /=<CR>
        nmap <Leader>t: :Tabularize /:<CR>
        vmap <Leader>t: :Tabularize /:<CR>
        nmap <Leader>t:: :Tabularize /:\zs<CR>
        vmap <Leader>t:: :Tabularize /:\zs<CR>
        nmap <Leader>t, :Tabularize /,<CR>
        vmap <Leader>t, :Tabularize /,<CR>
        nmap <Leader>t<Bar> :Tabularize /<Bar><CR>
        vmap <Leader>t<Bar> :Tabularize /<Bar><CR>
    " }
    
     " Session List {
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        nmap <leader>sl :SessionList<CR>
        nmap <leader>ss :SessionSave<CR>
     " }

     " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
     " }

     " Gist {
        if (os == 'Darwin' || os == 'Mac')
            let g:gist_clip_command = 'pbcopy'
        elseif (os == 'Linux')
            let g:gist_clip_command = 'xclip -selection clipboard'
        endif

        let g:gist_detect_filetype = 1
        let g:gist_open_browser_after_post = 1
        let g:gist_show_privates = 1
     " }
" }

" Filetype Specific Settings (FSS) {
    " The Principle is: Using only one autocmd per filetype 
    " but set several options through filetypespecific functions

    if has('autocmd')
        
       " Functions {
            function! AppleScriptFile() " {
               setlocal ft=applescript
               if  && (os == 'Darwin' || os == 'Mac')
                   call SingleCompile#SetCompilerTemplate('applescript','osascript', 'AppleScript Interpreter', 'osascript', '-e $(FILE_TITLE)$')
                   call SingleCompile#ChooseCompiler('applescript', 'osascript')
               endif
            endfunction " }  

            function! CSSFile() " {
               setlocal ft=css syntax=css3
               setlocal nowrap
            endfunction " }

            function! MarkdownFile() " {
                setlocal spell
                setlocal tw=80
                setlocal ft=mkd syntax=liquid
                if getline(1) == '---'
                    let b:liquid_subtype = 'mkd'
                    set ft=liquid
                endif
            endfunction " }

            function! PythonFile() " {
               setlocal ft=python syntax=python3
               if executable('python3')
                   call SingleCompile#ChooseCompiler('python', 'python3')
               endif
            endfunction " }

            function! LaTeXFile() " {
               setlocal spell
               setlocal ft=tex spelllang=de_20
               if executable('latexmk')
                   call SingleCompile#SetCompilerTemplate('tex','latexmk','latexmk','latexmk','-pdf','open %<.pdf')
                   call SingleCompile#ChooseCompiler('tex', 'latexmk')
               endif
            endfunction " }

            function! CommitFile() " {
               setlocal spell
               setlocal spelllang=de_20
               call setpos('.', [0, 1, 1, 0])
            endfunction " }

            function! HtmlFile() " {
                call SingleCompile#SetCompilerTemplate('html', 'open', 'open', 'open','','')
                call SingleCompile#ChooseCompiler('html', 'open')
                nmap <F10> :SCCompile<CR><CR>
            endfunction   " }
       " }

       " Autocommands {
            autocmd BufRead,BufNewFile *.css                 call CSSFile()
            autocmd BufRead,BufNewFile *.mkd,*.md,*.markdown call MarkdownFile()
            autocmd BufRead,BufNewFile *.scpt                call AppleScriptFile()
            autocmd BufRead,BufNewFile *.tex                 call LaTeXFile()
            autocmd BufRead,BufNewFile *.py                  call PythonFile()
            autocmd filetype git,svn,*commit*                call CommitFile()
            autocmd FileType gitcommit                       call CommitFile()
            autocmd BufRead,BufNewFile *.html                call HtmlFile()
       " }
   endif
" }

" Functions {
    function! GetBufferList()
        redir =>buflist
        silent! ls
        redir END
        return buflist
    endfunction

    function! ToggleList(bufname, pfx)
        let buflist = GetBufferList()
        for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
            if bufwinnr(bufnum) != -1
                exec(a:pfx.'close')
                return
            endif
        endfor
        if a:pfx == 'l' && len(getloclist(0)) == 0
            echohl ErrorMsg
            echo "Location List is Empty."
            return
        endif
        let winnr = winnr()
        exec(a:pfx.'open')
        if winnr() != winnr
            wincmd p
        endif
    endfunction

    nmap <silent> <F11> :call ToggleList("Location List", 'l')<CR>
    nmap <silent> <F12> :call ToggleList("Quickfix List", 'c')<CR>
" }
