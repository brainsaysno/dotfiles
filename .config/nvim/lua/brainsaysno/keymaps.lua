local map = require'brainsaysno'.map


-- " Map leader to space
-- nnoremap <Space> <Nop>
-- let mapleader=" "

map('n', '<leader>z', ':TZAtaraxis<cr>', {silent = true})
map('v', '<leader>z', ':TZAtaraxis<cr>', {silent = true})
nnoremap <silent> <leader>z :TZAtaraxis<CR>
vnoremap <silent> <leader>z :TZNarrow<CR>

" Move lines up and down in visual mode
vnoremap ∆ :m '>+<CR>gv=gv
vnoremap ˚ :m -2<CR>gv=gv

" Go to alternate file
nnoremap <silent> ga :e#<CR>

" Telescope file browser configuration
lua require('telescope').load_extension('file_browser')

" Telescope mappings
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope file_browser<cr>

nnoremap <leader>t <cmd>term<cr>

lua require'nvim_comment'.setup()

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

