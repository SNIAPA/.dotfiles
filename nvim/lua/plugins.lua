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
	use 'nvim-lua/plenary.nvim'
	use 'majutsushi/tagbar'
	use 'tpope/vim-commentary'
	use 'preservim/nerdtree'

	use {'folke/which-key.nvim',
	  config = require('plugins.which-key')
	}

	use {'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate',
		config = require('plugins.treesitter')
	}

	use { "bluz71/vim-moonfly-colors",
		as = "moonfly",
		config = require('plugins.moonfly')
	}

	use {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {

    }
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
}
end
)
