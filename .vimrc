" ----- Basic Settings ----- {{{
  set nocompatible
  let mapleader = ","

  " help language
  set helplang=cn

  " auto read when files changed
  set autoread

  " disuse swapfiles
  set noswapfile

  " backspace
  set backspace=2

  " indent
  set autoindent
  set smartindent
  set shiftwidth=2
  set expandtab
  set tabstop=2

  " line number
  set number
  set relativenumber

  " search
  set ignorecase
  set smartcase

  " status line
  set laststatus=2

  " cursor
  set cursorline

  " filetype plugins
  filetype plugin on
  filetype indent on
" }}}

" ----- GUI Settings ----- {{{
  if has("gui_running")
    " set gui font & size
    set guifont=Sauce_Code_Powerline:h12

    " display gui scrollbar
    set guioptions-=r
    set guioptions-=l
    set guioptions-=L
  endif
" }}}

" ----- Syntax Settings ----- {{{
  if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
  endif
" }}}

" ----- Mappings Settings ----- {{{
  " esc to normal mode
  inoremap jk <esc>

  " exchange with the above line
  inoremap <c-s> <esc>yyddkkpi

  " fast configure .vimrc
  nnoremap <leader>ev :vsplit $MYVIMRC<cr>
  nnoremap <leader>sv :source $MYVIMRC<cr>

  " fase switch tab
  nnoremap <c-l> <esc>:tabn<cr>
  nnoremap <c-h> <esc>:tabp<cr>

  " fast switch buffer
  nnoremap <leader>p :bp<cr>
  nnoremap <leader>n :bn<cr>

  " smart way to move between windows
  noremap <c-j> <C-W>j
  noremap <c-k> <C-W>k
  noremap <c-h> <C-W>h
  noremap <c-l> <C-W>l
" }}}

" ----- Plugin Settings ----- {{{
  call plug#begin('~/.vim/plugged')
    Plug 'junegunn/vim-plug'

    Plug 'Emmet.vim'
    Plug 'taglist.vim'
    Plug 'JSON.vim'
    Plug 'ShowTrailingWhitespace'
    Plug 'wakatime/vim-wakatime'
    Plug 'tomasr/molokai'
    " Plug 'liuchengxu/space-vim-dark'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'kien/ctrlp.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'Valloric/YouCompleteMe'
    Plug 'scrooloose/nerdcommenter'
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Raimondi/delimitMate'
    Plug 'easymotion/vim-easymotion'
    Plug 'pangloss/vim-javascript'
    Plug 'marijnh/tern_for_vim'
    Plug 'scrooloose/syntastic'
    Plug 'justinj/vim-react-snippets', { 'for': ['js', 'jsx']}
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
  call plug#end()
" }}}

" ----- Color Scheme Settings ----- {{{
  colorscheme molokai
" }}}

" ----- Plugin Configure Settings ----- {{{
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
" }}}
