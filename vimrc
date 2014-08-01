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
au BufNewFile,BufRead Guardfile setfiletype ruby
au BufNewFile,BufRead *.jbuilder setfiletype ruby
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

let NERDTreeMinimalUI=1
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

"neocomplete
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

map <Esc>[B <Down>
set backspace=indent,eol,start

"colorscheme vividchalk
syntax enable
set background=dark
let g:solarized_termcolors=256
"colorscheme Tomorrow-Night-Bright
colorscheme solarized
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
    " setup omnicomplete
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown,eruby setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " strip trailing whitespaces
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

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

function! <SID>StripTrailingWhitespaces()
  " preparation: save last search, and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")

  " do the business
  %s/\s\+$//e

  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

let mapleader=','
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

map <leader>vp :VimuxPromptCommand<CR>
map <leader>vl :VimuxRunLastCommand<CR>
map <leader>vi :VimuxInspectRunner<CR>
map <leader>vq :VimuxCloseRunner<CR>
map <leader>vx :VimuxInterruptRunner<CR>

cmap w!! %!sudo tee > /dev/null %
