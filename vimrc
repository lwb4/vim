syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber
set clipboard=unnamed
set backspace=indent,eol,start
set hlsearch
set linebreak
set history=200
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
set smartcase
set ignorecase
set incsearch

" set foldmethod=syntax "syntax highlighting items specify folds
" set foldcolumn=1 "defines 1 col at window left, to indicate folding
" let javaScript_fold=1 "activate folding by JS syntax
" set foldlevelstart=99 "start file with all folds opened

au BufNewFile,BufRead *.yaml,*.yml,*.eyaml so ~/.vim/yaml.vim
au BufNewFile,BufRead *.tsx set filetype=typescript

set background=dark

nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  echo "Long lines unhighlighted"
 endif
endfunction


set mouse=a

set wildmenu
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*
set wildignore+=*.pyc

inoremap JK <Esc>
inoremap jk <Esc>
let mapleader = ' '
nnoremap <leader>g :nohl<CR>
nnoremap <leader>s :%s//<C-r><C-w>/g<CR>
nnoremap <leader>z :w \| !./%<CR>
nnoremap <leader>b <C-^>
nnoremap <leader>p :w \| !prettier --write %<CR>
nnoremap <leader>w <C-w>v<C-w>w
nnoremap <leader>0 :q!<CR>
nnoremap <leader>d :YcmCompleter GoTo<CR>
nnoremap <leader>f :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))<CR>
nnoremap <leader>n :w \| !npm run lint:fix<CR>
nnoremap <leader>i :GoImplements<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>q <C-w>q
nnoremap <leader>y :let @+=expand("%:p") . ':' . line(".")<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev wualtrics qualtrics
iabbrev Wualtrics Qualtrics

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

command WQ wq
command Wq wq
command W w
command Q q
command Qa qa
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

function Char80()
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%80v.\+/
endfunction
command Char80 call Char80()

let g:ale_enabled = 0
let g:ycm_python_binary_path = '/usr/local/bin/python'
let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_autoclose_preview_window_after_completion = 1

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

runtime macros/matchit.vim

colo palenight
