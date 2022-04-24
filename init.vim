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

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Nvim Tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Status line
Plug 'theniceboy/eleline.vim'
Plug 'ojroques/vim-scrollstatus'

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim'

Plug 'MaxSt/FlatColor'
Plug 'joshdick/onedark.vim'
Plug 'flazz/vim-colorschemes'
Plug 'theniceboy/nvim-deus'
Plug 'glepnir/oceanic-material'
Plug 'sainnhe/gruvbox-material'
Plug 'themysteryboy/nvim-deus'

" Annotation plugin
Plug 'scrooloose/nerdcommenter'

" Start up Plug 'glepnir/dashboard-nvim'
" Plug 'junegunn/fzf.vim'
" Plug 'glepnir/dashboard-nvim'

" Pairs
Plug 'jiangmiao/auto-pairs'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()

" ===
" === Some sets
set relativenumber
set cursorline
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
set encoding=UTF-8



" ===
" === Theme
"
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

lua require('deus')

let g:spaceline_seperate_style = 'arrow'

let g:scrollstatus_size = 15

augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
augroup END

" ===
" === Coc
" ===
let g:coc_global_extensions = [
  \ 'coc-vimlsp',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-html',
  \ 'coc-clangd',
  \ 'coc-go',
  \ 'coc-css',
  \ 'coc-snippets',
  \ 'coc-cmake',
  \ 'coc-tabnine']

" Set let bar number && notice
set signcolumn=number
" set signcolumn=yes

" Set tab to be used
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Prev or Next Code WARNING
nmap <silent> <SPACE>- <Plug>(coc-diagnostic-prev)
nmap <silent> <SPACE>= <Plug>(coc-diagnostic-next)

" Nvim Tree
nmap tt :NvimTreeToggle<ENTER>
lua <<EOF
  require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
    auto_reload_on_write = true,
    disable_netrw = false,
    hide_root_folder = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = false,
    view = {
      width = 20,
      height = 30,
      side = "left",
      preserve_window_proportions = true,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      mappings = {
        custom_only = false,
        list = {
          -- user mappings go here
        },
      },
    },
    renderer = {
      indent_markers = {
        enable = false,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  ",
        },
      },
      icons = {
        webdev_colors = true,
      },
    },
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    update_focused_file = {
      enable = false,
      update_cwd = false,
      ignore_list = {},
    },
    ignore_ft_on_setup = {},
    system_open = {
      cmd = nil,
      args = {},
    },
    diagnostics = {
      enable = false,
      show_on_dirs = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    filters = {
      dotfiles = false,
      custom = {},
      exclude = {},
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 400,
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = false,
        restrict_above_cwd = false,
      },
      open_file = {
        quit_on_open = false,
        resize_window = false,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        diagnostics = false,
        git = false,
        profile = false,
      },
    },
  } -- END_DEFAULT_OPTS
EOF

" ===
" === Buffer line
" ===
nnoremap <TAB>l :BufferLineCycleNext<CR>
nnoremap <TAB>h :BufferLineCyclePrev<CR>

lua << EOF

require('bufferline').setup {
  options = {
    mode = "tabs", -- set to "tabs" to only show tabpages instead
    numbers = "none",
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    left_mouse_command = nil,    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = "bdelete!",          -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "coc",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number, buf_numbers)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
      -- filter out by it's index number in list (don't show first buffer)
      if buf_numbers[1] ~= buf_number then
        return true
      end
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "   File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    },
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thick",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = 'tabs',
    function(buffer_a, buffer_b)
      return buffer_a.modified > buffer_b.modified
    end
  }
}
EOF

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
" === Telescope
" ===
nnoremap ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap fg <cmd>lua require('telescope.builtin').live_grep()<cr>

" ===
" === Indent Line
" ===
lua <<EOF
  require("indent_blankline").setup {
      show_end_of_line = true,
      show_current_context_start = true,
  }
EOF

" Split
map si :set splitright<CR>:vsplit 
"map sp :vsplit
map <SPACE>h <C-w>h
map <SPACE>l <C-w>l
map <TAB>n :tab split 

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" ===
" === Dash board
" let g:dashboard_default_executive ='fzf'

" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 750
hi illuminatedWord cterm=underline gui=underline

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
