" Set up vim plugins
call plug#begin('~/.config/nvim/plugged')

  " Autocompletions
  Plug 'hrsh7th/nvim-compe'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'rafamadriz/friendly-snippets', { 'branch': 'main' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

  "Style
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'navarasu/onedark.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'kosayoda/nvim-lightbulb'
  Plug 'norcalli/nvim-colorizer.lua'

  " Utility
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'jiangmiao/auto-pairs' " Pairs
  Plug 'kristijanhusak/defx-icons'
  Plug 'mhinz/vim-startify' "Home page
  Plug 'pgdouyon/vim-evanesco' "Better buffer searching
  Plug 'simeji/winresizer' " Resizing
  Plug 'tpope/vim-commentary' " Comments
  Plug 'numtostr/FTerm.nvim' "Terminal

  " Source control
  Plug 'airblade/vim-gitgutter'
  Plug 'kristijanhusak/defx-git'
  Plug 'tpope/vim-fugitive'

  " Syntax
  Plug 'sheerun/vim-polyglot'
  Plug 'JulesWang/css.vim',             { 'for': 'css' }
  Plug 'hoffstein/vim-tsql'
  Plug 'OrangeT/vim-csharp'
  Plug 'cakebaker/scss-syntax.vim'

  "Linting
  Plug 'dense-analysis/ale'

call plug#end()
