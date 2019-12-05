" Get the defaults that most users want.
"source $VIMRUNTIME/.vim

"plugin loading vim-plug
call plug#begin('~/.dotfiles/vim/pack/')

  "git
  Plug 'https://github.com/tpope/vim-fugitive.git'
  Plug 'airblade/vim-gitgutter'

  "scheme
  Plug 'vim-airline/vim-airline'
  Plug 'tomasr/molokai'

  "syntax and linting
  Plug 'https://github.com/tpope/vim-surround'
  Plug 'https://github.com/dense-analysis/ale'

  "language
  Plug 'https://github.com/lervag/vimtex'
  Plug 'honza/vim-snippets'

  "autocomplete
  Plug 'ycm-core/YouCompleteMe'
  "Plug 'https://github.com/davidhalter/jedi'
  "Plug 'https://github.com/davidhalter/jedi-vim'

  "snippets
  Plug 'SirVer/ultisnips'

  "utility
  Plug 'https://github.com/scrooloose/nerdtree'
  Plug 'https://github.com/Konfekt/FastFold'
  Plug 'https://github.com/tmhedberg/SimpylFold'

call plug#end()

"update helptags
call plug#helptags() 

"""""""""""""""""""
" builtin settings" 
"""""""""""""""""""

"fix background issue
set background=dark

"backup and undo!
if has('vms')
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

"highlighting!
if &t_Co > 2 || has('gui_running')
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has('lautocmd')
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=80
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

"adding plugin filetype:
"set nocp                    " 'compatible' is not set
filetype plugin on          " plugins are enabled

"syntax on
syntax on

"remap ctrl-w to ctrl-[letter]
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab
"turn on autoindent
set autoindent

"line numbers
set number
set relativenumber

"organize files!
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.
set undodir=~/.vim/undo
set viminfo+=n~/.vim/viminfo

"add set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
noremap <F3> Ll :set list!<CR>

"folding on syntax
set foldmethod=syntax

" spelling remaps
nnoremap <silent> ss :call SpellToggle()<cr>

let g:NoSpell=1

function! SpellToggle()
    if g:NoSpell
        let g:NoSpell=0
        set spell spelllang=en_us
    else
        let g:NoSpell=1
        set nospell
    endif
endfunction

nnoremap  zz z=
"""""""""""""""""""""""""
" builtin settings done "
"""""""""""""""""""""""""

"""""""""""""""""
" ycm/jedi settings "
"""""""""""""""""
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"preview-window functions
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion=1

"let g:ycm_semantic_triggers = {
"\   'python': ['.', '(' ],
"\ }

"function params:
"let g:jedi#show_call_signatures = "0"
"let g:jedi#completions_command = "<C-N>"

"""""""""""""""""""""
" ycm/jedi settings done "
"""""""""""""""""""""

""""""""""""""""""""
"ultisnips settings "
""""""""""""""""""""
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
  let g:UltiSnipsJumpBackwardTrigger = "<C-j>"
  
""""""""""""""""""""""""
"ultisnips settings done"
""""""""""""""""""""""""

"""""""""""""""""""
" vimtex settings "
"""""""""""""""""""

let g:vimtex_quickfix_latexlog = {
      \'general': 0,
      \}
let g:tex_flavor = "latex"
let g:vimex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let g:vimtex_compiler_progname = 'nvr'

" fast typing//conceal
" https://castel.dev/post/lecture-notes-1/
"let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"""""""""""""""""""""""
" vimtex settings done"
"""""""""""""""""""""""


"""""""""""""""""
" ale settings "
"""""""""""""""""

let g:ale_linters = {
  \ 'scala': [ 'sbtserver', 'scalac' ] ,
  \ 'python': [''],
  \ 'tex': ['texlab'],
  \ }

" python3
let g:python3_host_prog='/usr/local/bin/python3'

"latex
let home = $HOME
let g:ale_tex_texlab_executable = home.'/.dotfiles/texlab/target/release/texlab'

"completion
"let g:ale_completion_enabled = 1
"set omnifunc=ale#completion#OmniFunc

"""""""""""""""""""""
" ale settings  done"
"""""""""""""""""""""

""""""""""""""""""""
" airline settings "
""""""""""""""""""""
"set smarter tab line
let g:airline#extensions#tabline#enabled = 1
" better buffer switching:
"Note: bd to close current buffer
nnoremap gB :bnext<CR>
nnoremap gb :bprevious<CR>
nnoremap B :bnext<CR>

" unique_tail
let g:airline#extensions#tabline#formatter = 'unique_tail'

"""""""""""""""""""""""""
" airline settings  done"
"""""""""""""""""""""""""

""""""""""""""""
" Git settings "
""""""""""""""""
function! Gitgutter()
  :GitGutterToggle
  :GitGutterSignsToggle
  :GitGutterLineHighlightsToggle
endfunction

let g:gitgutter_enabled = 0

"TODO: fix this!
nnoremap <silent> gG :exec Gitgutter()<CR> 

""""""""""""""""""""
" Git settings done"
""""""""""""""""""""

"""""""""""""""""""""""""
" floating term settings" 
"""""""""""""""""""""""""
"nnoremap <Leader>at :call FloatTerm()<CR>
"
"let s:float_term_border_win = 0
"let s:float_term_win = 0
"function! FloatTerm()
"  " Configuration
"  let height = float2nr((&lines - 2) * 0.6)
"  let row = float2nr((&lines - height) / 2)
"  let width = float2nr(&columns * 0.6)
"  let col = float2nr((&columns - width) / 2)
"  " Border Window
"  let border_opts = {
"        \ 'relative': 'editor',
"        \ 'row': row - 1,
"        \ 'col': col - 2,
"        \ 'width': width + 4,
"        \ 'height': height + 2,
"        \ 'style': 'minimal'
"        \ }
"  let border_buf = nvim_create_buf(v:false, v:true)
"  let s:float_term_border_win = nvim_open_win(border_buf, v:true, border_opts)
"  " Terminal Window
"  let opts = {
"        \ 'relative': 'editor',
"        \ 'row': row,
"        \ 'col': col,
"        \ 'width': width,
"        \ 'height': height,
"        \ 'style': 'minimal'
"        \ }
"  let buf = nvim_create_buf(v:false, v:true)
"  let s:float_term_win = nvim_open_win(buf, v:true, opts)
"  " Styling
"  hi FloatTermNormal term=None guibg=#2d3d45
"  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:FloatTermNormal')
"  call setwinvar(s:float_term_win, '&winhl', 'Normal:FloatTermNormal')
"  terminal
"  startinsert
"  " Close border window when terminal window close
"  autocmd CursorMoved * ++once call nvim_win_close(s:float_term_border_win, v:true)
"endfunction

""""""""""""""""""""""""""""""
" floating term settings done"
""""""""""""""""""""""""""""""

" Add your own mapping. For example:
map <C-n> :NERDTreeToggle<CR>

"FastFold
let g:fastfold_savehook = 1
let g:tex_fold_enabled = 1

"colorscheme
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme molokai

"vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala
