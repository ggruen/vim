" 4 space tabs
set tabstop=4
set expandtab

" 4 space indents
set shiftwidth=4
set softtabstop=4

" use visual bell instead of beeping
set vb

" incremental search
set incsearch

" syntax highlighting
syntax on
color torte " Use the default theme
" Setting to light then dark makes vim actually update the colors, otherwise,
" the colors stay too dark to see on a black background
set background=light
set background=dark " Tell vim the screen background is dark

" autoindent
filetype indent on
"autocmd FileType perl set autoindent |set smartindent " smartindent was making comments outdent

" show matching brackets
set showmatch
"autocmd FileType perl set showmatch

" show line numbers
"autocmd FileType perl set number

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite

" dont use Q for Ex mode
map Q :q

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F2>

" comment/uncomment blocks of code (in vmode)
vmap _c :s/^/#/gi<Enter>
vmap _C :s/^#//gi<Enter>

" my perl includes pod
let perl_include_pod = 1

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>

" Deparse obfuscated code
nnoremap <silent> _d :.!perl -MO=Deparse 2>/dev/null<cr>
vnoremap <silent> _d :!perl -MO=Deparse 2>/dev/null<cr>

" Map F7/F8 to tabp and tabn
map <F7> :tabp<Enter>
map <F8> :tabn<Enter>

" Set pretty line indentation
set linebreak
if has("patch-7.4.354")
    set breakindent
    set breakindentopt=shift:4
endif

" Bar at column 81 to remind you to code good
set colorcolumn=81        " highlight column after 'textwidth'
"highlight ColorColumn ctermbg=black guibg=darkgrey

" Status line
set statusline=%f         " Path to the file
set statusline+=\ col\ %c " Column number
set statusline+=%=        " Switch to the right side
set statusline+=line\     " Label
set statusline+=%l        " Current line
set statusline+=\ of\     " Separator
set statusline+=%L        " Total lines
set laststatus=2          " Always display status

set backspace=indent,eol,start    " backspace through everything in insert mode

" Move cursor by display lines when wrapping
nnoremap j gj
nnoremap k gk

" also in visual mode
vnoremap j gj
vnoremap k gk

" Autowrap text with comment leader as appropriate, automatically extend com
" t - autoformat text, c - autoformat comments, r - automatically continue
" comment on next line, o - automatically continue column on o/O command, q -
" allow comment formatting with gq command, l - don't break long lines if they
" started long, b - autowrap only if you hit a blank before the wrap margin.
set formatoptions=tcroqlb

" Reopen file at last-edited position (see :help last-position-jump)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Moar tabs!
set tabpagemax=100

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
