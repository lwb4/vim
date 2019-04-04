colorscheme gruvbox

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
set wildmode=longest,list
set rtp+=/usr/local/opt/fzf

au BufNewFile,BufRead *.yaml,*.yml,*.eyaml so ~/.vim/yaml.vim

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

inoremap jk <Esc>
let mapleader = ' '
nnoremap <leader>g :nohl<CR>
nnoremap <leader>s :%s//<C-r><C-w>/g<CR>
nnoremap <leader>z :w \| !./%<CR>
nnoremap <leader>p :w \| !python3 %<CR>
nnoremap <leader>w :w \| tabnew \| read !webpack<CR>
nnoremap <leader>0 :q!<CR>
nnoremap <leader>d :YcmCompleter GoTo<CR>
nnoremap <leader>f :FZF<CR>
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

let g:ale_enabled = 1
let g:ycm_python_binary_path = '/usr/local/bin/python'

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
