" Set up vim plugins
call plug#begin('~/.config/nvim/plugged')

  " Autocompletions
  Plug 'tami5/lspsaga.nvim', { 'branch': 'main' }
  Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }
  Plug 'hrsh7th/cmp-buffer', { 'branch': 'main' }
  Plug 'hrsh7th/cmp-cmdline', { 'branch': 'main' }
  Plug 'hrsh7th/cmp-path', { 'branch': 'main' }
  Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
  Plug 'hrsh7th/cmp-vsnip', { 'branch': 'main' }
  Plug 'hrsh7th/vim-vsnip'
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer', { 'branch': 'main' }
  Plug 'rafamadriz/friendly-snippets', { 'branch': 'main' }

  "Style
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kosayoda/nvim-lightbulb'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'navarasu/onedark.nvim'
  Plug 'norcalli/nvim-colorizer.lua' " hex colorizing
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Utility
  Plug 'jiangmiao/auto-pairs' " Pairs
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'liuchengxu/vim-which-key' " Help menu
  Plug 'numtostr/FTerm.nvim' "Terminal
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'branch': 'main', 'do': 'make' }
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'simeji/winresizer' " Resizing
  Plug 'tpope/vim-commentary' " Comments
  Plug 'vimwiki/vimwiki' " Wiki
  Plug 'powerman/vim-plugin-AnsiEsc' " Wiki
  Plug 'vim-test/vim-test'
  Plug 'code-biscuits/nvim-biscuits', { 'branch': 'main' } " nice bracket matching virtual text
  Plug 'tpope/vim-surround'
  Plug 'ahmedkhalf/project.nvim', { 'branch': 'main' }
  Plug 'sbdchd/neoformat' " Autoformatting (prettier)
  Plug 'nvim-lua/plenary.nvim'
  Plug 'ckipp01/nvim-jenkinsfile-linter'
  Plug 'nvimtools/none-ls.nvim'

  " Source control
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

call plug#end()
