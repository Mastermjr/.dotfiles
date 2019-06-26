" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Jul 28
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
"source $VIMRUNTIME/.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
"if has('syntax') && has('eval')
"  packadd matchit
"endif

"_____________________________
"
"adding in custom vimrc
"_________________________ __
"
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

set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

"line numbers
set number
set relativenumber

"organize files!
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.
set undodir=~/.vim/undo
set viminfo+=n~/.vim/viminfo

"plugin loading vim-plug
"TODO: add in ulti-snips/youcompleteme
"TODO: vim-gitgutter
"TODO: vim-airline
call plug#begin("~/.dotfiles/vim/pack/")

  "git
  Plug 'https://github.com/tpope/vim-fugitive.git'

  "python
  Plug 'https://github.com/davidhalter/jedi-vim'

  "syntax
  Plug 'https://github.com/tpope/vim-surround'
  Plug 'https://github.com/vim-syntastic/syntastic'

  "utility
  Plug 'https://github.com/scrooloose/nerdtree'
  Plug 'https://github.com/lervag/vimtex'
  Plug 'https://github.com/Konfekt/FastFold'
  Plug 'https://github.com/tmhedberg/SimpylFold'

  "ui

  "colorschemes

call plug#end()

"update helptags
call plug#helptags() 



"add support for tabbing autocomplete and paths
"let F = function('tabbing', lastkey)
"inoremap <tab> :call F()<CR>

"folding on syntax
set foldmethod=syntax

" add nerd tree key
map <C-n> :NERDTreeToggle<CR>

" spelling remaps
nnoremap Ss :set spell spelllang=en_us<CR>
nnoremap ss :set nospell<CR>
nnoremap  zz z=

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

  " options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
  " python
let g:syntastic_python_checkers = ['python', 'pylint']

"vimtex
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1

"FastFold
let g:fastfold_savehook = 1
let g:tex_fold_enabled = 1
