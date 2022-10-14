return require("packer").startup(function()
  use 'wbthomason/packer.nvim'
  use {'neoclide/coc.nvim', branch='release'}

  -- Appearance settings 
  use 'neoclide/coc.nvim'
  use 'ellisonleao/gruvbox.nvim'

  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}

  -- Pairing parenthesis and quotes
  use 'jiangmiao/auto-pairs'
  use 'machakann/vim-sandwich'

  -- Zen mode
  use 'Pocco81/true-zen.nvim'

  -- Status bar
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- Telescope file picker and extensions
  use 'nvim-lua/plenary.nvim'
  use {'nvim-telescope/telescope.nvim', tag='0.1.0'}
  use 'nvim-telescope/telescope-file-browser.nvim'
  
  use 'terrortylor/nvim-comment'
  use 'pantharshit00/vim-prisma'

end)
