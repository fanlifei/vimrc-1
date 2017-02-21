set nocompatible

" Leader
let mapleader = ","

"""" Common """"
" set help document language
set helplang=cn
" auto smart indent
set autoindent
set smartindent
set expandtab
" backspace deletes in insert mode
set backspace=2
" softtabs, 2 spaces
set shiftwidth=2
set tabstop=2
" display line number
set number
set relativenumber
" dispaly status line
set laststatus=2
" ignore case
set ignorecase
" disuse swapfile
set noswapfile
" auto read when files change
set autoread
" set font size
set guifont=Sauce_Code_Powerline:h12
" set cursor line height
set cursorline

" switch syntax highlighting on, when the terminal has colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" display gui scrollbar
if has("gui_running")
  set guioptions-=r
  set guioptions-=l
  set guioptions-=L
endif

"""" Custom mapping """"
inoremap jk <esc>
" insert mode delete line
inoremap <c-d> <esc>ddi
" insert mode exchange with the above line
inoremap <c-s> <esc>yyddkkpi
" edit and apply .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" auto dele trailing
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<cr>
" switch tab
nnoremap <c-l> <esc>:tabn<cr>
nnoremap <c-h> <esc>:tabp<cr>
" switch buffer
nnoremap <c-p> :bp<cr>
nnoremap <c-n> :bn<cr>
" smart way to move between windows
noremap <c-j> <C-W>j
noremap <c-k> <C-W>k
noremap <c-h> <C-W>h
noremap <c-l> <C-W>l

"""" Vundle """"
" load bundle file
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

"""" Plugin """"
" molokai
colorscheme molokai

" ctrlp
let g:ctrlp_show_hidden = 1

" Emmet.vim
let g:user_emmet_expandabbr_key = '<c-e>'

" NERDTree
let NERDTreeShowHidden=1
noremap <c-b> :NERDTreeToggle<cr>
"  autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" YouCompleteMe
" http://efe.baidu.com/blog/vim-javascript-completion/#youcompleteme
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" Use tab
function! TabFunction ()
    let line = getline('.')
    let substr = strpart(line, -1, col('.')+1)
    let substr = matchstr(substr, "[^ \t]*$")
    if strlen(substr) == 0
        return "\<tab>"
    endif
    return pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>"
endfunction
inoremap <tab> <c-r>=TabFunction()<cr>

let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s{2}', 're!:\s+'],
    \   'html': [ '</' ],
    \ }

" nerdcommenter
let g:NERDSpaceDelims=1

" vim-javascript
let javascript_enable_domhtmlcss = 1

" taglist.vim
noremap <silent> <leader>tl :TlistToggle<cr>
let g:Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Use_Right_Window=1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint'

" airline
let g:airline_theme="luna"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

