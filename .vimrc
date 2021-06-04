" 1. Install vim-plug:
" $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 
" 2. Install plugins:
" :PlugInstall
"
" 3. Copy coc-settings.json to ~/.vim/.
"
" 4. Profit!

syntax on
filetype plugin indent on

set bg=dark
set bs=2

set ffs=unix,dos
set ruler

set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4 

set autoindent smartindent

set hlsearch
set ignorecase

set modeline
set number

" autocmd FileType go map <Leader>gb :wa \| :!go build<CR>
autocmd FileType go map <Leader>gt :wa \| :GoTest<CR>
autocmd FileType go map <Leader>gf :wa \| :GoFmt<CR>
autocmd FileType go map <Leader>gr :wa \| :GoRun<CR>
autocmd FileType go map <Leader>gb :wa \| :GoBuild<CR>

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_bin_path = expand("~/go/bin")

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go'
Plug 'avoronkov/vim-close'
Plug 'vim-scripts/vcscommand.vim'

call plug#end()

" -------------------------------------------------------------------------------------------------
"  " coc.nvim default settings
" -------------------------------------------------------------------------------------------------
"
"  " if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
" set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
" set signcolumn=yes


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac :CocAction<CR>
" Apply AutoFix to problem on the current line.
nmap <leader>qf :CocFix<CR>

let g:coc_global_extensions = [ 'coc-tsserver' ]

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

autocmd FileType python :set expandtab
autocmd FileType javascript :set expandtab
autocmd FileType typescript :set expandtab
autocmd FileType json :set expandtab tabstop=2 shiftwidth=2 softtabstop=2

imap <C-L> <Esc>

command! Blame VCSBlame
