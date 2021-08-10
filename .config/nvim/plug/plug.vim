" Set up vim plugins
call plug#begin('~/.config/nvim/plugged')

  " Autocompletions
  Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
  Plug 'hrsh7th/nvim-compe'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'neovim/nvim-lspconfig'
  Plug 'rafamadriz/friendly-snippets', { 'branch': 'main' }

  "Style
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kosayoda/nvim-lightbulb'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'navarasu/onedark.nvim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Utility
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'jiangmiao/auto-pairs' " Pairs
  Plug 'kristijanhusak/defx-icons'
  Plug 'mhinz/vim-startify' "Home page
  Plug 'numtostr/FTerm.nvim' "Terminal
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'pgdouyon/vim-evanesco' "Better buffer searching
  Plug 'simeji/winresizer' " Resizing
  Plug 'tpope/vim-commentary' " Comments

  " Source control
  Plug 'airblade/vim-gitgutter'
  Plug 'kristijanhusak/defx-git'
  Plug 'tpope/vim-fugitive'

  " Syntax
  Plug 'JulesWang/css.vim',             { 'for': 'css' }
  Plug 'OrangeT/vim-csharp'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'hoffstein/vim-tsql'
  Plug 'sheerun/vim-polyglot'

call plug#end()
