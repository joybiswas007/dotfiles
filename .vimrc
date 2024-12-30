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
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'joshdick/onedark.vim'
Plug 'easymotion/vim-easymotion'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'eslint/eslint'
Plug 'mattn/emmet-vim'
Plug 'simnalamburt/vim-mundo'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'galooshi/vim-import-js'
call plug#end()

colorscheme onedark

set guifont=Hack\ 10
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
set backspace=indent,eol,start 
set showcmd
set hlsearch
set incsearch
set fileformats=unix,dos,mac
set encoding=utf-8
set wrap
set textwidth=80
set formatoptions=qrn1
set undofile
set undodir=~/.vim/undo
set updatetime=100

nnoremap <esc><esc> :noh<return><esc>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap jj <Esc>
inoremap jk <Esc>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

let g:go_fmt_command = "goimports"
"let g:go_highlight_types = 1
""let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
"let g:go_highlight_extra_types = 1
""let g:go_highlight_build_constraints = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
let g:go_def_mode = "godef"
let g:go_fmt_fail_silently = 1
let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1


autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)

setlocal omnifunc=ale#complete#Complete

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\ }
let g:ale_fixers = {
\   'javascript': ['eslint', "prettier", "importjs"],
\   'javascriptreact': ['eslint', "prettier", "importjs"],
\ }

let g:ale_fix_on_save = 1 
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '☠️'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_list_vertical = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:airline#extensions#ale#enabled = 1

nnoremap <F5> :MundoToggle<CR>


"let g:ycm_enable_semantic_highlighting=1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_error_symbol = '❌'
let g:ycm_warning_symbol = '☠️'

" Enable YCM semantic linting
"let g:ycm_show_diagnostics_ui = 1
"let g:ycm_always_populate_location_list = 1
"let g:ycm_diagnostic_delay = 500  " Adjust delay in ms

autocmd FileType apache setlocal commentstring=#\ %s

let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 2

nnoremap <silent> {Left-Mapping} :<C-U>TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :<C-U>TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :<C-U>TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :<C-U>TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>
