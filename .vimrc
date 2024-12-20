call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/gv.vim'
Plug 'valloric/youcompleteme'
Plug 'luochen1990/rainbow'
Plug 'w0rp/ale'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'joshdick/onedark.vim'
Plug 'easymotion/vim-easymotion'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'eslint/eslint'
Plug 'mattn/emmet-vim'
Plug 'simnalamburt/vim-mundo'
Plug 'christoomey/vim-tmux-navigator'
Plug 'galooshi/vim-import-js'
call plug#end()

colorscheme onedark

set guifont=Hack\ 10

set nocompatible
set nofoldenable
filetype off

syntax on
set autowrite
set number
set hidden
set nocp
set ruler
filetype plugin indent on
set relativenumber number
set nowrapscan
set nrformats+=alpha
set ignorecase smartcase
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd
set hlsearch
set fileformats=unix,dos,mac
set ttyfast
set splitright
set splitbelow
set encoding=UTF-8
set lazyredraw "Wait to redraw

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

" Make Vim to handle long lines nicely.
set wrap
set textwidth=80
set formatoptions=qrn1

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


"prettier format on save
"autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.json,*.css,*.scss,*.md Prettier

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\ }
let g:ale_fixers = {
\   'javascript': ['eslint', "prettier", "importjs"],
\   'javascriptreact': ['eslint', "prettier", "importjs"],
\ }

let g:ale_fix_on_save = 1   " Automatically fix files on save
" Lint only on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

"set updatetime=100
setlocal omnifunc=ale#complete#Complete

autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)

let g:go_fmt_fail_silently = 1

" run :GoBuild or :GoTestCompile based on the go file
""function! s:build_go_files()
""  let l:file = expand('%')
""  if l:file =~# '^\f\+_test\.go$'
""    call go#test#Test(0, 1)
""  elseif l:file =~# '^\f\+\.go$'
""    call go#cmd#Build(0)
""  endif
""endfunction

"autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
"autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

"au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl

nnoremap <silent> <C-f> :Files<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

nnoremap <F5> :MundoToggle<CR>

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
let g:go_fmt_command = "goimports"
"let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_build_constraints = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = '"5s"'
"let g:go_def_mode = 'godef'
"let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1


"let g:ycm_enable_semantic_highlighting=1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_error_symbol = '❌'
let g:ycm_warning_symbol = '☠️'


inoremap jj <Esc>
inoremap jk <Esc>

"let g:ale_fixers = {'javascript': ['prettier', 'eslint']}

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '☠️'

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Write this in your vimrc file
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_list_vertical = 1

let g:ale_open_list = 1

" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 0



nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Set this in your vimrc file to disabling highlighting
"let g:ale_set_highlights = 1

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> {Left-Mapping} :<C-U>TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :<C-U>TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :<C-U>TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :<C-U>TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>


" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
