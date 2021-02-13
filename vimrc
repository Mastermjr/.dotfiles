"""""""""""""""""""
"vimplug settings " 
"""""""""""""""""""

"plugin loading vim-plug
call plug#begin('~/.dotfiles/vim/pack/')

  "git
  "Plug 'https://github.com/tpope/vim-fugitive.git'
  "Plug 'airblade/vim-gitgutter'

  "scheme
  Plug 'vim-airline/vim-airline'
  Plug 'crusoexia/vim-monokai'

  "syntax and linting
  Plug 'https://github.com/tpope/vim-surround'
  Plug 'https://github.com/dense-analysis/ale'

  "autocomplete
  Plug 'ycm-core/YouCompleteMe'

  "vim compilation and completion
  Plug 'https://github.com/lervag/vimtex'

  "snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  "utility
  Plug 'https://github.com/scrooloose/nerdtree'
  Plug 'https://github.com/Konfekt/FastFold'

  "Python folding
  Plug 'https://github.com/tmhedberg/SimpylFold'

call plug#end()

"update helptags
call plug#helptags() 

"""""""""""""""""""""""
"vimplug settings done" 
"""""""""""""""""""""""

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
noremap  Ll :set list!<CR>

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

"kill buffer cleanly
nnoremap BD :bp<bar>sp<bar>bn<bar>bd<CR>

"security, stops local vimrc from running autocmd
" don't know if it actually does anything, but stumbled on it
let secure=1

"""""""""""""""""""""""""
" builtin settings done "
"""""""""""""""""""""""""

"""""""""""""""""""""""
" completion settings "
"""""""""""""""""""""""
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"preview-window functions
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_semantic_triggers = {
\   'python': ['.', '(' ],
\ }

"GoTo:
nnoremap <silent> [g :YcmCompleter GoTo<cr>
nnoremap <silent> [d :YcmCompleter GoToDeclaration<cr>
nnoremap <silent> [r :YcmCompleter GoToReferences<cr>

"""""""""""""""""""""""
" completion settings "
"""""""""""""""""""""""

""""""""""""""""""""
"ultisnips settings "
""""""""""""""""""""
"  let g:UltiSnipsExpandTrigger="<tab>"
"  let g:UltiSnipsJumpForwardTrigger = "<tab>"
"  let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
  
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

"force to use pdflatex
"let g:vimtex_compiler_latexrun_engines = {
"    \ 'background' : 1,
"    \ 'build_dir' : '',
"    \ 'options' : [
"    \   '-verbose-cmds',
"    \   '--latex-args="-synctex=1"',
"    \   '-pdf', 
"    \ ],
"    \}

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

""""""""""""""""""""
"Other App settings" 
""""""""""""""""""""

" Add your own mapping. For example:
map <C-h> :NERDTreeToggle<CR>

"FastFold
let g:fastfold_savehook = 1
let g:tex_fold_enabled = 1

"colorscheme
set t_Co=256  " vim-monokai now only support 256 colours in terminal.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme monokai

