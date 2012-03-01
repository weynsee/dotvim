call pathogen#infect() 

set nocompatible
set nu
set cursorline
set noerrorbells
set clipboard+=unnamed
set mouse=a
set expandtab
set nowrap
set ruler
set hidden
set autoindent
set smartindent
set incsearch
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set softtabstop=4
set showmatch
set showcmd
set title
set wildmenu
set wildmode=list:longest,full
set guioptions-=T
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=%-16(\ %l,%c-%v\ %)%P
set wildignore+=public/hotels/**
set encoding=utf-8

au BufNewFile,BufRead *.thor setfiletype ruby
au BufNewFile,BufRead Thorfile setfiletype ruby

let NERDTreeMinimalUI=1

map <Esc>[B <Down>
set backspace=indent,eol,start

colorscheme molokai
"colorscheme solarized
"set background=dark
syntax enable
filetype plugin indent on
nnoremap <space> za

source $VIMRUNTIME/macros/matchit.vim
let g:SuperTabDefaultCompletionType="context"

let uname = substitute(system("uname"),"\n","","g")
if uname == "Darwin"
    command -bar -nargs=1 OpenURL :!open <args>
elseif uname == "Linux"
    command -bar -nargs=1 OpenURL :!firefox <args>
endif

if has("autocmd")
    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " strip trailing whitespaces
    autocmd FileType java,ruby autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType ruby set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_rvm')?rvm#statusline():''}%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=%-16(\ %l,%c-%v\ %)%P
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let mapleader=','
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

cmap w!! %!sudo tee > /dev/null %

let g:syntastic_enable_signs=1
let g:syntastic_auto_loclist=1
let g:syntastic_quiet_warnings=0
