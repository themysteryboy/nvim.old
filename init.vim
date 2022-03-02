" __  ____   __  _   ___     _____ __  __ ____   ____
" |  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
" | |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
" |_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @themysteryboy


" ===
" === Auto load for first time uses
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim//plugged')

Plug 'nathanaelkane/vim-indent-guides'

" Coc
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Status line
Plug 'theniceboy/eleline.vim'
Plug 'ojroques/vim-scrollstatus'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim'
" theme Plug 'flazz/vim-colorschemes'
Plug 'theniceboy/nvim-deus'
Plug 'glepnir/oceanic-material'
Plug 'sainnhe/gruvbox-material'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'savq/melange'
Plug 'glepnir/zephyr-nvim'

" Annotation plugin
Plug 'scrooloose/nerdcommenter'

" Start up Plug 'glepnir/dashboard-nvim'
Plug 'junegunn/fzf.vim'
Plug 'glepnir/dashboard-nvim'

" Pairs
Plug 'jiangmiao/auto-pairs'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()

" ===
" === Some sets
" set relativenumber
" set cursorline
set list
set number
set listchars=tab:\ \ ,trail:·
" set listchars=tab:\ \ ,trail:█
" set listchars=tab:\ \ ,trail:▫
set exrc
set secure
set number
set hidden
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set cindent
set scrolloff=5
set indentexpr=
set ttimeoutlen=0
set notimeout
set mouse=a
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set noswapfile
set clipboard=unnamedplus

" ===
" === Theme
set background=dark    " Setting dark mode
" set background=light
syntax enable
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
" color deus
" color solarized8_dark_flat
" color solarized8_light_flat
" color gruvbox-material
" color material-theme
" color molokai
" color gruvbox

lua <<EOF
-- get zephyr color
require('zephyr')
EOF

let g:spaceline_seperate_style = 'arrow'

let g:scrollstatus_size = 15

" ===
" Markdown
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'google-chrome-stable'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']

" ===
" === Indent Line
" ===
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_guide_size = 1

" ===
" === coc
" ===
let g:coc_global_extensions = [
  \ 'coc-vimlsp',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-html',
  \ 'coc-clangd',
  \ 'coc-go',
  \ 'coc-css',
  \ 'coc-explorer',
  \ 'coc-snippets']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-o> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <SPACE>- <Plug>(coc-diagnostic-prev)
nmap <silent> <SPACE>= <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap tt :CocCommand explorer<CR>

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-k>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-j>'
let g:snips_author = 'Garde'

" Split
map si :set splitright<CR>:vsplit<CR>
"map sp :vsplit
map <SPACE>h <C-w>h
map <SPACE>l <C-w>l
map <TAB>n :tab split
"map <TAB>- :tabn<ENTER>
"map <TAB>= :tabp<ENTER>

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

exec "nohlsearch"

" ===
" === Dash board
let g:dashboard_default_executive ='fzf'

" ===
" === Save & quit
noremap Q :q<CR>
noremap S :w<CR>

" Compile function
noremap ru :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
    if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
 "elseif &filetype == 'cpp'
    "set splitbelow
    "exec "!g++ -std=c++20 % -Wall -o %<"
    ":sp
    ":res 50
    ":term ./%<
 elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
 elseif &filetype == 'sh'
    :!time bash %
 elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
 elseif &filetype == 'html'
    silent! exec "!".g:mkdp_browser." % &"
 elseif &filetype == 'markdown'
    exec "MarkdownPreview"
 elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
 elseif &filetype == 'dart'
    exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
    silent! exec "CocCommand flutter.dev.openDevLog"
 elseif &filetype == 'javascript'
    set splitbelow
    :sp
    :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
 elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run %
 endif
endfunc

" ===
" === Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"cpp", "go", "python", "c", "html", "css"},
  highlight = {
   enable = true
  },
  indent = {
   enable = false
  }
}
EOF
