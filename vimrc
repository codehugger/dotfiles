set nocompatible			" required
filetype off				" required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle.vim'

" General plugins
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-repeat'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'terryma/vim-multiple-cursors'

" Language plugins
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim'
Plugin 'wting/rust.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'rollxx/vim-antlr'

" Colors
Plugin 'nanotech/jellybeans.vim'
Plugin 'chriskempson/base16-vim'

call vundle#end()
filetype plugin indent on		" required

" General options
set hlsearch
set incsearch
set noswapfile
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab
set ttyfast
set lazyredraw
set completeopt-=preview
set foldmethod=syntax
set nofoldenable

" Syntax highlighting
syntax enable
set background=dark
set number
set relativenumber
set cursorline

" Colorscheme settings
color jellybeans
let base16colorspace=256 " Access colors present in 256 colorspace

" Shortcuts
let mapleader=","
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Space> za

noremap <Leader>l :set list!<CR>
noremap <Leader>p :set paste!<CR>
noremap <Leader>w :w<CR>
noremap <Leader>q :q!<CR>
noremap <Leader>h :split<CR>
noremap <Leader>v :vsplit<CR>

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

nnoremap <CR> :noh<CR><CR>

" GUI settings
if has("gui_running")
	set guifont=Inconsolata\ for\ Powerline:h13
	set guioptions-=L " no scrollbar in NERDTree
	set guioptions-=r " no scrollbars
	set clipboard=unnamed " make yy, d and p work with system clipboard without + or *
	autocmd! GUIEnter * set vb t_vb=
endif

" ----------------------------------------------------------------------------
"  vim-go
" ----------------------------------------------------------------------------

let g:go_fmt_fail_silently = 1
let g:go_snippet_engine = "neosnippet"

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap gd <Plug>(go-def)

" ----------------------------------------------------------------------------
"  vim-ruby
" ----------------------------------------------------------------------------

au FileType ruby set softtabstop=2
au FileType ruby set tabstop=2
au FileType ruby set shiftwidth=2
au FileType ruby set expandtab

" ----------------------------------------------------------------------------
"  Neocomplete
" ----------------------------------------------------------------------------

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Recommended key-mappings.
" <CR>: close popup and save indent.
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" ----------------------------------------------------------------------------
"  Neosnippet
" ----------------------------------------------------------------------------

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" ----------------------------------------------------------------------------
"  Powerline
" ----------------------------------------------------------------------------
" source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
" set laststatus=2

" ----------------------------------------------------------------------------
"  Airline
" ----------------------------------------------------------------------------
let g:airline_powerline_fonts = 1

" ----------------------------------------------------------------------------
"  Tagbar
" ----------------------------------------------------------------------------

nmap <Leader>t TagbarToggle!<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
