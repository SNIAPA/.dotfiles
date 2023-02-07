local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...") vim.cmd([[packadd packer.nvim]]) end

vim.cmd([[
  augroup packer_user_config
	  autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	print("Packer not installed")
	return
end

packer.init({
  display = {
	  compact = true,
		open_fn = function() 
			return require('packer.util').float({ border = 'rounded' })
		end,
	},
})



return packer.startup(function(use)

	use 'wbthomason/packer.nvim'
	use 'majutsushi/tagbar'
	use 'tpope/vim-commentary'
	use 'preservim/nerdtree'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
	use 'folke/which-key.nvim'
	use 'f-person/git-blame.nvim'
	use 'kdheepak/lazygit.nvim'


  use 'ray-x/lsp_signature.nvim'


  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }

	use {'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
	}

	use { "bluz71/vim-moonfly-colors",
		as = "moonfly"
	}

	use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    requires = {'nvim-tree/nvim-web-devicons'}
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

end
)
