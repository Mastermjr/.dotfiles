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
  Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
  Plug 'https://github.com/tpope/vim-surround'
  "Plug 'https://github.com/dense-analysis/ale'

  "language
  Plug 'https://github.com/lervag/vimtex'
  Plug 'derekwyatt/vim-scala'

  "tab
  "Plug 'ervandew/supertab'

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
  autocmd FileType text setlocal textwidth=78
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
noremap L :set list<CR>                           
noremap Ll :set list!<CR>

"folding on syntax
set foldmethod=syntax

" spelling remaps
nnoremap Ss :set spell spelllang=en_us<CR>
nnoremap ss :set nospell<CR>
nnoremap  zz z=
"""""""""""""""""""""""""
" builtin settings done "
"""""""""""""""""""""""""

"""""""""""""""""""""
" coc-nvim settings "
"""""""""""""""""""""
" coc
let g:airline#extensions#coc#enabled = 1

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Better display for messages
set cmdheight=2

" Use <c-space> for trigger completion.
inoremap <silent><expr> <C-n> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> <C-j> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-k> <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" Remap for do action format
nnoremap <silent> F :call CocAction('format')<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

""""""""""""""""""""""""""
" coc-nvim settings  done"
""""""""""""""""""""""""""

"""""""""""""""""
" ale settings "
"""""""""""""""""

let g:ale_linters = {
  \ 'scala': [ 'sbtserver', 'scalac','metals-vim' ] ,
  \ 'python': ['pylint', 'flake8'],
  \ }

" python3
let g:python3_host_prog='/usr/local/bin/python3'

"completion
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

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

""""""""""""""""""""
" Git settings "
""""""""""""""""""""
function! Gitgutter()
  :GitGutterToggle
  :GitGutterSignsToggle
  :GitGutterLineHighlightsToggle
endfunction

let g:gitgutter_enabled = 0

nnoremap <silent> gG :exec Gitgutter()<CR> 

""""""""""""""""""""
" Git settings done"
""""""""""""""""""""

"supertab
let g:SuperTabContextDefaultCompletionType = '<c-n>'
let g:SuperTabDefaultCompletionType = 'context'

" Add your own mapping. For example:
map <C-n> :NERDTreeToggle<CR>

"vimtex
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1

"FastFold
let g:fastfold_savehook = 1
let g:tex_fold_enabled = 1

"colorscheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme molokai

"vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala
