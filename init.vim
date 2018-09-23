" Vimscript file settings ------{{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" Basic settings ------{{{
syntax on		" this changes color of various elements within a user's code base
colorscheme badwolf
set foldlevelstart=0	" this will fold all folds when opening a new buffer
" }}}
" Mapping commands  ------{{{
" Arguably the most important stuf for init.vim when
" setting up neovim (or vim) as a vanilla editor with little or no plugins.
"
" Change map leader to ',' instead of '\'
let mapleader=','
" Change local map leader to ',' instead of '\'
let maplocalleader=','
" This command maps the Esc key to the jk sequence for characters 
inoremap jk <esc>
" This command disables the Esc key from leaving Insert mode
inoremap <esc> <nop>
" Move vertically by visual line what happends with jk now 
nnoremap j gj
nnoremap k gk
" Start and end of line with keys that are more easily accessible
nnoremap H ^
nnoremap L $
nnoremap ^ <nop>
nnoremap $ <nop>
" Start and end of line with keys that are more easily accessible
nnoremap Y y$
" Reload init.vim without exiting vim. $MYVIMRC is ~/.config/nvim/init.vim
nnoremap <leader>r :source $MYVIMRC<CR>
" Edit init.vim
nnoremap <leader>ei :split $MYVIMRC<CR>
" Change the current word to upper case in insert mode and stay in insert mode
" with cursor in same position with CTRL-u keys
inoremap <c-u> <esc>gUiwea
" Change the current word to upper case in normal mode and stay in normal mode
" with cursor in same position with CTRL-u keys
nnoremap <c-u> gUiw
" }}}
" Abbreviation commands -------{{{
" more useful commands for text that is typed frequently 
"
" Use @@ to type something that you type often, eg. email address etc.
iabbrev @@ john.doe@email.com
" }}}
" Searching related commands------{{{
"
" Case Insensitivity Pattern Matching
set ignorecase
" Overrides ignorecase if pattern contains upcase
set smartcase
" Press <leader> Enter to remove search highlights
noremap <silent> <leader><cr> :nohlsearch<cr>
" }}}
" GUI related commands------{{{
"
" Line numbering related commands
set number
set relativenumber
" Toggle Relative Number
nnoremap <silent> <leader>nb :set relativenumber!<CR>
" round up tabs to multiple of shiftwidth
set shiftround
" set shiftwidth to value that is reasonable for me
set shiftwidth=2
" }}}
" Auto commands------{{{
"
augroup my_auto_commands_group
  " remove all auto commands
  autocmd!
  " Re-indent all html files when reading and just before writing
  autocmd BufWritePre,BufRead *.html :normal gg=G
  " Set nowrap when working with html files
  autocmd BufNewFile,BufRead *.html setlocal nowrap
  " Add comments to .vim files using the specific commenting syntax that .vim
  " files requires
  autocmd FileType vim nnoremap <buffer> <localleader>c I" <esc>
  " Fold html tag easily - use za to unfold all folds
  autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
" }}}
" Test comment for purpose of checking that git is working.
