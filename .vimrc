set nocompatible
filetype off

" VUNDLE

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'sjl/gundo.vim'
Bundle 'kien/ctrlp.vim'

call vundle#end()
filetype plugin indent on

"SETTINGS

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
colorscheme ir_black

au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$\| \+\ze\t\|^\t*\zs \+/

set hlsearch

syntax on

set number

set timeoutlen=1000 ttimeoutlen=0

set tabstop=8
set shiftwidth=8
set softtabstop=8
set noexpandtab
set smartindent
set autoindent
set nomodeline

set listchars=tab:▸\ ,eol:¬
" set listchars=tab:▸\
" set list

set ignorecase
set smartcase

set wildmenu
set wildmode=list:longest,full

set history=500

set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

set foldmethod=syntax
set foldenable

set scrolloff=15

set pastetoggle=<F8>

set rulerformat=%30(%=%M%t\ %p%)
set showcmd

" PLUGIN SETTINGS

let g:ctrlp_show_hidden=1

" KEYBINDS

nnoremap <C-n> :call NumberToggle()<CR>
nnoremap <backspace> :noh<CR>
nnoremap <F1> :GundoToggle<CR>
nnoremap <C-@> :call TrimWhiteSpace()<CR>

" FUNCTIONS

function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc

function! TrimWhiteSpace()
	%s/\s\+$\| \+\ze\t//e
endfunction

function! IndentConvert(line1, line2, what, cols)
	let savepos = getpos('.')
	let cols = empty(a:cols) ? &tabstop : a:cols
	execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
	call histdel('search', -1)
	call setpos('.', savepos)
endfunction

function! Indenting(indent, what, cols)
	let spccol = repeat(' ', a:cols)
	let result = substitute(a:indent, spccol, '\t', 'g')
	let result = substitute(result, ' \+\ze\t', '', 'g')
	if a:what == 1
		let result = substitute(result, '\t', spccol, 'g')
	endif
	return result
endfunction

" COMMANDS

command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)

" COMMENTS

autocmd FileType systemd set commentstring=#\ %s

" FTDETECT

autocmd BufRead,BufNewFile *.conf set filetype=conf
" autocmd BufRead,BufNewFile *.cf set filetype=conf
