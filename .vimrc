set encoding=utf-8


set autowrite
set ignorecase
set incsearch
set showcmd
set showmatch
set smartcase

" looks
set background=dark
set laststatus=2
set nowrap
set ruler
set scrolloff=10
" show extra whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red


" line numbers
set rnu
autocmd InsertEnter * :set number rnu!
autocmd InsertLeave * :set rnu

" key bindings
let mapleader = ";"
vnoremap <Leader>s :sort<CR>
map <C-H> <C-W>h<C-W>
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>
map <C-L> <C-W>l<C-W>

" quickfix
map <leader>n :cnext<CR>
map <leader>m :cprevious<CR>

" Indentation
vnoremap < <gv
vnoremap > >gv

" spelling
"set spell
autocmd FileType mail setlocal spell spelllang=en_us
autocmd BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown set spell spelllang=en_us
autocmd BufNewFile,BufRead *.rst set spell spelllang=en_us
autocmd BufNewFile,BufRead *.txt set spell spelllang=en_us

" plugins
set loadplugins
syntax enable
filetype on
filetype plugin on
filetype indent on

" folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2


" CtrlP
let g:ctrlp_working_path_mode = 'c'


" python
autocmd BufNewFile,BufRead python setlocal et sta sw=4 sts=4
autocmd FileType python setlocal textwidth=79
autocmd FileType python nmap <leader>t :w<CR>:!clear; nosetests %<CR>
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete


" Go
autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4
autocmd FileType go nmap <Leader>8 :GoSameIds<CR>
autocmd FileType go nmap <Leader>* :GoSameIdsClear<CR>
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>


set secure

execute pathogen#infect()
