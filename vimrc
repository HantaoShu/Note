call plug#begin('~/.vim/plugged')
" completion/coding
  Plug 'Shougo/deoplete.nvim'
  "Plug 'Valloric/YouCompleteMe'
  Plug 'jiangmiao/auto-pairs' "自动括号匹配
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-surround'
  Plug 'junegunn/vim-easy-align'
  Plug 'ervandew/supertab'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
" looking
  Plug 'mhinz/vim-startify'
  Plug 'Yggdroot/indentLine'
  Plug 'myusuf3/numbers.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'morhetz/gruvbox'
  Plug 'airblade/vim-gitgutter'
  Plug 'altercation/vim-colors-solarized'
" utils
  Plug 'terryma/vim-multiple-cursors'
  Plug 'sjl/gundo.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'asins/vimcdoc'
  Plug 'Mark--Karkat'
  Plug 'repeat.vim'
  Plug 'ccvext.vim'
  Plug 'fcitx.vim'
  Plug 'CodeFalling/fcitx-vim-osx'
  Plug 'rhysd/nyaovim-markdown-preview'
  Plug 'kassio/neoterm'
  Plug 'neomake/neomake'
  Plug 'wellle/targets.vim'
  Plug 'ryanoasis/vim-devicons'
" navigation
  Plug 'scrooloose/nerdtree'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'wesleyche/SrcExpl'
  Plug 'majutsushi/tagbar'
  Plug 'taglist.vim'
  Plug 'rizzatti/dash.vim'         "For Mac
" c/c++
  Plug 'c.vim'
  Plug 'zhranklin/deoplete-clang'
" java
  Plug 'artur-shaik/vim-javacomplete2'
" html/css/javascript
  Plug 'mattn/emmet-vim'
" python
  Plug 'zchee/deoplete-jedi'
" scala
  Plug 'ensime/ensime-vim'
  Plug 'derekwyatt/vim-scala'
"  Plug 'ktvoelker/sbt-vim'
"  Plug 'megaannum/vimside'
call plug#end()

" Fundamental settings
  set fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
  set fileformat=unix
  set fileformats=unix,dos,mac
  filetype on
  filetype plugin on
  filetype plugin indent on
  syntax on
" Some useful settings
  set smartindent
  set expandtab         "tab to spaces
  set tabstop=4         "the width of a tab
  set shiftwidth=2      "the width for indent
  set foldenable
  set foldmethod=indent "folding by indent
  set foldlevel=100     "not folded by default
  set ignorecase        "ignore the case when search texts
  set smartcase         "if searching text contains uppercase case will not be ignored
" Lookings
  set number           "line number
  set cursorline       "hilight the line that the cursor exists in
  set cursorcolumn     "hilight the column that the cursor exists in
  set nowrap           "no line wrapping
  colorscheme gruvbox  "use the theme gruvbox
  set background=light "use the light version of gruvbox
  " change the color of chars over the width of 80 into blue (uncomment to enable this)
  "au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Shortcuts
  " <space> => fold/unfold current text tips: zR => unfold all; zM => fold all
    nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
  " \o => open current file by system apps (only in osx)
    "nmap <leader>o :!open %<cr>
    "imap <leader>o :!open %<cr>
  " ,, => escape to normal mode
    imap ,, <Esc>
  " <esc> => go back to normal mode (in terminal mode)
    noremap <Esc> <C-\><C-n> 
  " use t{h,j,k,l} to switch between different windows
    noremap tk <c-w>k
    noremap tj <c-w>j
    noremap th <c-w>h
    noremap tl <c-w>l
  " <F4> => popup the file tree navigation)
    nmap <F4> :NERDTreeToggle<CR>
  " t[number] => switch to the file showed in the top tabs
  " t[ t] => prev tab/next tab
    nmap t1 <Plug>AirlineSelectTab1
    nmap t2 <Plug>AirlineSelectTab2
    nmap t3 <Plug>AirlineSelectTab3
    nmap t4 <Plug>AirlineSelectTab4
    nmap t5 <Plug>AirlineSelectTab5
    nmap t6 <Plug>AirlineSelectTab6
    nmap t7 <Plug>AirlineSelectTab7
    nmap t8 <Plug>AirlineSelectTab8
    nmap t9 <Plug>AirlineSelectTab9
    nmap t[ <Plug>AirlineSelectPrevTab
    nmap t] <Plug>AirlineSelectNextTab
  " <F8> => toggle the srcExpl (for source code exploring)
    nmap <F8> :SrcExplToggle<CR>
  " tb => open the tagbar
    nmap tb :TlistClose<CR>:TagbarToggle<CR>
  " ti => taglist
    nmap ti :TagbarClose<CR>:Tlist<CR>
  " \jd => GoTo the definition 
    nnoremap <leader>jd :YcmCompleter GoTo<CR> "can't use
  " Neoterm
  " <F5>
    nnoremap <F5> :GundoToggle<CR>
  " <c-v> => paste
    inoremap <c-v> <esc>"+pi
  " t<enter> => terminal
    nnoremap t<enter> :Ttoggle<CR>
    xmap te :TREPLSend<CR>
    nmap tE :TREPLSendFile<CR>
    nmap tt :T<space>
    let g:neoterm_repl_command = 'bash'

" Plugin settings
  " EasyAlign
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
  " IdentLine
    let g:indentLine_color_term = 239
  " markdown_preview (a plugin in nyaovim)
    let g:markdown_preview_eager=1
  " airline
    let g:airline#extensions#tabline#enabled = 1
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.notexists = '∄'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline#extensions#tabline#buffer_idx_mode = 1
  " Deoplete
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.6/lib/libclang.so.1'
    let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.6/lib/clang/3.6.0/include'
    "let g:deoplete#auto_complete_start_length = 1000
  " Neoterm
    let g:neoterm_size=5
    let g:neoterm_position = 'horizontal'
    let g:neoterm_automap_keys = ',tt'
    if has('nvim')
      tnoremap <Esc> <C-\><C-n>
    endif
    " toogle the terminal
    nnoremap <silent> <s-cr> :Ttoggle<cr>
    " kills the current job (send a <c-c>)
    nnoremap <silent> tc :call neoterm#kill()<cr>
    command! -nargs=+ Tg :T git <args>   let g:neoterm_
  " Neomake
    "let g:neomake_cpp_enable_markers=['clang'] 
    "let g:neomake_cpp_clang_args = ["Wall"]
    au! BufWritePost * Neomake
  " Supertab
    let g:SuperTabMappingForward = '<s-tab>'
    let g:SuperTabMappingBackward = '<tab>'
  " Tagbar
    let g:tagbar_width=30
  " Taglist
    let Tlist_Show_One_File=1
    let Tlist_Exit_OnlyWindow=1
    let Tlist_File_Fold_Auto_Close=1
    let Tlist_WinWidth=30
    let Tlist_Use_Right_Window=1
  " Ultisnips
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Automatics
" vim-devicons
    let g:airline_powerline_fonts=1

  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd BufWritePost *.scala :EnTypeCheck
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
  map <F7> :call CompileRun()<CR>
"easymotion 
 " <Leader>f{char} to move to {char}
  map  <Leader>f <Plug>(easymotion-bd-f)
  nmap <Leader>f <Plug>(easymotion-overwin-f)

  " s{char}{char} to move to {char}{char}
  nmap s <Plug>(easymotion-overwin-f2)

  " Move to line
  map <Leader>L <Plug>(easymotion-bd-jk)
  nmap <Leader>L <Plug>(easymotion-overwin-line)

  " Move to word
  map  <Leader>w <Plug>(easymotion-bd-w)
  nmap <Leader>w <Plug>(easymotion-overwin-w)
"multiple-cursors
  let g:multi_cursor_next_key='<leader><c-n>'
  let g:multi_cursor_prev_key='<c-p>'
  let g:multi_cursor_skip_key='<c-x>'
  let g:multi_cursor_quit_key='<Esc>'
"compile
    func! CompileRun()
      exec "w"
      if &filetype == 'c'
          exec "!g++ % -o %< -O2 -Wall -DLOCAL -std=c++11"
          exec "!time ./%<"
      elseif &filetype == 'cpp'
          exec "!g++ % -o %< -O2 -Wall -DLOCAL -std=c++11"
          exec "!time ./%<"
      elseif &filetype == 'java' 
          exec "!javac %" 
          exec "!time java %<"
      elseif &filetype == 'sh'
          :!time bash %
      elseif &filetype == 'python'
          exec "!time python3 %"
      elseif &filetype == 'html'
          exec "!firefox % &"
      elseif &filetype == 'go'
  "        exec "!go build %<"
          exec "!time go run %"
      elseif &filetype == 'mkd'
          exec "!~/.vim/markdown.pl % > %.html &"
          exec "!firefox %.html &"
      endif
  endfunc
"Defult code
    map <F2> :call LoadTemplate()<CR>
    func! LoadTemplate()
      exec "r ~/.vim/.templates/template.cpp"
    endfunc
"json
    autocmd FileType json set nocursorcolumn
"java
    let g:JavaComplete_ShowExternalCommandsOutput = 1
