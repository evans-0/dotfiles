set shell=/bin/bash				" default shell is bash
set number						" displaying line numbers
set relativenumber				" relative line numbers (great for jumping)
set backspace=indent,eol,start	" Intuitive backspacing in insert mode
set tabstop=4					" tab space to 4
set ruler						" set ruler
set hlsearch					" highlight search
set incsearch					" when searching, show pattern as being typed
set autoindent					" indent automatically
set cursorline					" highlight current line
set nowrap						" no line wrapping
set scrolloff=8					" keep 8 lines above/below cursor
set sidescrolloff=8				" keep 8 cols left/right
set wildmenu					" better command completion
set wildmode=longest,list		" bash-like completion
set clipboard=unnamedplus		" use system clipboard
set showmatch					" highlight matching brackets
set ignorecase					" case insensitive search...
set smartcase					" ...unless you type uppercase

" set .h file to c instead of c++
let c_syntax_for_h = 1

" syntax highlighting
syntax on

" split options
set splitright	" default vsplit to right
set splitbelow	" default split to below

" clear search highlight with Escape
nnoremap <esc> :nohl<CR>

" easier split navigation (Ctrl+hjkl instead of Ctrl+W+hjkl)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" move lines up/down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" keep cursor centered when jumping
nnoremap n nzzzv
nnoremap N Nzzzv

" status line
set laststatus=2	" make the status line visible
let g:currentmode={
	\ 'n'	:	'NORMAL ',
	\ 'v'	:	'VISUAL ',
	\ 'V'	:	'V.Line ',
	\ "\<C-V>"	:	'V.Block ',
	\ 'i'	:	'INSERT',
	\ 'R'	:	'R',
	\ 'Rv'	:	'V.Replace',
	\ 'c'	:	'Command',
	\ 't'	:	'TERMINAL',
	\}
if has('statusline')
	set statusline=%1*									" highlight block User1
	set statusline+=\ %{toupper(g:currentmode[mode()])}	" current mode
	set statusline+=%*									" return to default statusline color
	set statusline+=\ %t								" file name
	set statusline+=\ %y								" file type
"	set statusline+=\ [%{&ff}]							" machine type (dos/unix)
	set statusline+=\ %m								" modified
	set statusline+=%=									" move to the other side
	set statusline+=%{&fileencoding}\ 					" file encoding
	set statusline+=\ %{getfsize(expand('%'))}B\ 		" file size in bytes
	set statusline+=%2*\ %p%%\ %*						" percent of file
	set statusline+=%3*									" highlight group User1
	set statusline+=\ line:%l/%L\ 						" line number
	set statusline+=\ col:%c\ 							" column
"	set statusline+=time:\ %{strftime(\"%H:%M:%S\")}	" time
endif

" highlight groups
hi User1 cterm=bold ctermbg=4 ctermfg=255
hi User2 ctermbg=33 ctermfg=255
hi User3 ctermbg=125 ctermfg=255

" mode-aware status bar color (green in INSERT, blue in NORMAL)
augroup ModeColors
	autocmd!
	autocmd InsertEnter * hi User1 ctermbg=2 ctermfg=255
	autocmd InsertLeave * hi User1 ctermbg=4 ctermfg=255
augroup END

" Non current statusline
hi statuslinenc ctermbg=8 ctermfg=252
