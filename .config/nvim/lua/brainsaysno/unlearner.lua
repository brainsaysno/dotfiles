local map = require'brainsaysno'.map

map('n', '<down>', '<NOP>', {silent = true})
map('n', '<up>', '<NOP>', {silent = true})
map('n', '<left>', '<NOP>', {silent = true})
map('n', '<right>', '<NOP>', {silent = true})

map('i', '<down>', '<NOP>', {silent = true})
map('i', '<up>', '<NOP>', {silent = true})
map('i', '<left>', '<NOP>', {silent = true})
map('i', '<right>', '<NOP>', {silent = true})

map('v', '<down>', '<NOP>', {silent = true})
map('v', '<up>', '<NOP>', {silent = true})
map('v', '<left>', '<NOP>', {silent = true})
map('v', '<right>', '<NOP>', {silent = true})

vim.opt.mouse=''
