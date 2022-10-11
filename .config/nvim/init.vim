" Disable arrow keys from insert mode
inoremap <silent> <down> <NOP>
inoremap <silent> <up> <NOP>
inoremap <silent> <left> <NOP>
inoremap <silent> <right> <NOP>

" Disable arrow keys from normal mode
nnoremap <silent> <down> <NOP>
nnoremap <silent> <up> <NOP>
nnoremap <silent> <left> <NOP>
nnoremap <silent> <right> <NOP>

" Disable arrow keys from visual mode
vnoremap <silent> <down> <NOP>
vnoremap <silent> <up> <NOP>
vnoremap <silent> <left> <NOP>
vnoremap <silent> <right> <NOP>

" Disable mouse
set mouse=

" Enable syntax highlighting
syntax on
filetype plugin indent on

" Enable relative and absolute numbers in the sidebar (hybrid numbering)
set number relativenumber

" Set cursor to square box in all modes
set guicursor=
set hidden

" Disable line wrapping
set nowrap

" Start scrolling vertically when 12 lines are left
set scrolloff=12

" Share system clipboard
set clipboard=unnamed

" Use utf-8 encoding
set encoding=utf-8

" Use 2 spaces for tabs
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab

" Enable auto indenting
set autoindent
set smartindent

" Use dark mode
set background=dark

" Disable swap files
set noswapfile

" Disable highlighting in searches
set nohlsearch

" Hide default status line in favor of lualine
set noshowmode
set noruler 
set noshowcmd

call plug#begin()
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Sensible defaults (prone to be removed)
  " Plug 'tpope/vim-sensible'
  
  " Appearance settings 
  Plug 'ellisonleao/gruvbox.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Pairing parenthesis and quotes
  Plug 'jiangmiao/auto-pairs'
  Plug 'machakann/vim-sandwich'

  " Zen mode
  Plug 'Pocco81/true-zen.nvim'

  " Status bar
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'

  " Telescope file picker and extensions
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
  Plug 'nvim-telescope/telescope-file-browser.nvim'
  
  Plug 'terrortylor/nvim-comment'
  Plug 'pantharshit00/vim-prisma'

call plug#end()

colorscheme gruvbox

" Map leader to space
nnoremap <Space> <Nop>
let mapleader=" "

" Zen mode mappings
nnoremap <silent> <leader>z :TZAtaraxis<CR>
vnoremap <silent> <leader>z :TZNarrow<CR>

" Move lines up and down in visual mode
vnoremap ∆ :m '>+<CR>gv=gv
vnoremap ˚ :m -2<CR>gv=gv

" Telescope file browser configuration
lua require('telescope').load_extension('file_browser')

" Telescope mappings
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope file_browser<cr>

nnoremap <leader>t <cmd>term<cr>

lua require('nvim_comment').setup()

" Feline setup

lua << EOF

require'lualine'.setup{
options={
theme='gruvbox'
}
}

EOF

" Window movement

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
      if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

" Coc Configuration

set nobackup
set nowritebackup

set updatetime=300
set signcolumn=yes

" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? '\<Tab>' :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>gf  <Plug>(coc-format-selected)
nmap <leader>gf  <Plug>(coc-format-selected)

lua << EOF

require'nvim-treesitter.configs'.setup{
ensure_installed = {"typescript", "javascript", "lua", "vim", "java"},
auto_install = true,
highlight = {
  enable = true
}
}

EOF
