local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
  return true
end

local packer = require 'packer'

local packer_config = require 'packer_config'

packer.init(packer_config)

return packer.startup(function(use)

  use 'wbthomason/packer.nvim'

  for _, dir in ipairs({'plugins', 'lsp'}) do

    for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/'..dir, [[v:val =~ '\.lua$']])) do
      local plugin = require(dir..'.'..file:gsub('%.lua$', ''))
      use(plugin)

    end

  end



	use 'majutsushi/tagbar'
	use 'tpope/vim-commentary'
	use 'preservim/nerdtree'
  use 'nvim-lua/plenary.nvim'
	use 'kdheepak/lazygit.nvim'

	use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    requires = {'nvim-tree/nvim-web-devicons'}
  }


end
)
