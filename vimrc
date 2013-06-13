execute pathogen#infect() 

set nocompatible
set shell=sh
set encoding=utf-8
set nu
set cursorline
set cursorcolumn
set noerrorbells
set clipboard+=unnamed
set mouse=a
set expandtab
set wrap linebreak textwidth=0
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
set colorcolumn=80
set title
set wildmenu
set wildmode=list:longest,full
set guioptions-=T
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=%-16(\ %l,%c-%v\ %)%P
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,public/hotels/**,.DS_Store

au BufNewFile,BufRead *.thor setfiletype ruby
au BufNewFile,BufRead Thorfile setfiletype ruby
au BufNewFile,BufRead *.jbuilder setfiletype ruby

let NERDTreeMinimalUI=1
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

map <Esc>[B <Down>
set backspace=indent,eol,start

"colorscheme vividchalk
syntax enable
set background=dark
"let g:solarized_termcolors=256  
colorscheme Tomorrow-Night-Bright
filetype plugin indent on
nnoremap <space> za

source $VIMRUNTIME/macros/matchit.vim

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

    autocmd FileType eruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType coffee setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType mustache setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType ruby set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_rvm')?rvm#statusline():''}%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=%-16(\ %l,%c-%v\ %)%P
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

set statusline+=%#warningmsg#
set statusline+=%*

let mapleader=','
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

cmap w!! %!sudo tee > /dev/null %
