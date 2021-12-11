" Set up vim plugins
call plug#begin('~/.config/nvim/plugged')

  " Autocompletions
  Plug 'tami5/lspsaga.nvim', { 'branch': 'main' }
  Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
  Plug 'hrsh7th/cmp-buffer', { 'branch': 'main' }
  Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }
  Plug 'hrsh7th/cmp-vsnip', { 'branch': 'main' }
  Plug 'hrsh7th/vim-vsnip'
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall', { 'branch': 'main' }
  Plug 'rafamadriz/friendly-snippets', { 'branch': 'main' }

  "Style
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kosayoda/nvim-lightbulb'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'navarasu/onedark.nvim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Utility
  Plug 'jiangmiao/auto-pairs' " Pairs
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'liuchengxu/vim-which-key' " Help menu
  Plug 'mhinz/vim-startify' "Home page
  Plug 'numtostr/FTerm.nvim' "Terminal
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'branch': 'main', 'do': 'make' }
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'pgdouyon/vim-evanesco' "Better buffer searching
  Plug 'simeji/winresizer' " Resizing
  Plug 'tpope/vim-commentary' " Comments
  Plug 'vimwiki/vimwiki' " Wiki
  " Plug 'tools-life/taskwiki' " Wiki
  Plug 'powerman/vim-plugin-AnsiEsc' " Wiki
  Plug 'editorconfig/editorconfig-vim'
  Plug 'vim-test/vim-test'

  " Source control
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " Syntax
  Plug 'JulesWang/css.vim',             { 'for': 'css' }
  Plug 'OrangeT/vim-csharp'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'hoffstein/vim-tsql'
  Plug 'sheerun/vim-polyglot'

call plug#end()
