-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/saian/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/saian/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/saian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/saian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/saian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dashboard-nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/saian/.local/share/nvim/site/pack/packer/opt/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["git-blame.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\31let g:gitblame_enabled = 0\bcmd\bvim\0" },
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n“\6\0\0\6\0&\0;6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0004\5\0\0=\5\t\0044\5\0\0=\5\n\4=\4\v\0034\4\0\0=\4\f\0035\4\r\0=\4\14\3=\3\16\0025\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\3=\3\30\0025\3\31\0004\4\0\0=\4\19\0034\4\0\0=\4\21\0035\4 \0=\4\23\0035\4!\0=\4\25\0034\4\0\0=\4\27\0034\4\0\0=\4\29\3=\3\"\0024\3\0\0=\3#\0024\3\0\0=\3\n\0024\3\0\0=\3$\0024\3\0\0=\3%\2B\0\2\1K\0\1\0\15extensions\20inactive_winbar\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\frefresh\1\0\3\vwinbar\3è\a\15statusline\3è\a\ftabline\3è\a\17ignore_focus\23disabled_filetypes\vwinbar\15statusline\1\0\0\23section_separators\1\0\2\nright\bî‚²\tleft\bî‚°\25component_separators\1\0\2\nright\bî‚³\tleft\bî‚±\1\0\4\ntheme\tauto\18icons_enabled\2\17globalstatus\1\25always_divide_middle\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\n¼\1\0\2\t\0\f\0\0255\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\6\0006\a\2\0009\a\a\a9\a\b\a9\a\t\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\n\0006\a\2\0009\a\a\a9\a\b\a9\a\v\a\18\b\2\0B\3\5\1K\0\1\0\15definition\agd\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\bvim\vbuffer\1\0\2\fnoremap\2\vsilent\2m\0\1\5\2\6\0\f6\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\0015\3\3\0-\4\0\0=\4\4\3-\4\1\0=\4\5\3B\1\2\1K\0\1\0\1À\2À\14on_attach\17capabilities\1\0\0\nsetup\14lspconfig\frequireØ\1\1\0\a\0\n\0\0216\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0004\4\0\0=\4\4\3B\1\2\0016\1\0\0'\3\5\0B\1\2\0029\1\6\1B\1\1\0023\2\a\0009\3\b\0004\5\3\0003\6\t\0>\6\1\5B\3\2\0012\0\0€K\0\1\0\0\19setup_handlers\0\25default_capabilities\17cmp_nvim_lsp\21ensure_installed\1\0\1\27automatic_installation\2\nsetup\20mason-lspconfig\frequire\0" },
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\nã\5\0\0\5\0\22\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0004\4\0\0=\4\5\3=\3\6\0026\3\a\0009\3\b\0039\3\t\0039\3\n\3=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\2B\0\2\1K\0\1\0\aui\fkeymaps\1\0\t\24cancel_installation\n<C-c>\22uninstall_package\6X\28check_outdated_packages\6C\24update_all_packages\6U\26check_package_version\6c\19update_package\6u\20install_package\6i\26toggle_package_expand\t<CR>\26apply_language_filter\n<C-f>\nicons\1\0\3\24package_uninstalled\bâ—\20package_pending\bâ—\22package_installed\bâ—\1\0\4\nwidth\4š³æÌ\t™³¦ÿ\3$check_outdated_packages_on_open\2\vheight\4Í™³æ\fÌ™³ÿ\3\vborder\tnone\14providers\1\2\0\0!mason.providers.registry-api\vgithub\1\0\1\26download_url_template2https://github.com/%s/releases/download/%s/%s\14log_level\tINFO\vlevels\blog\bvim\bpip\17install_args\1\0\1\16upgrade_pip\1\1\0\2\tPATH\fprepend\30max_concurrent_installers\3\4\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  moonfly = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme moonfly\bcmd\bvim\0" },
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/moonfly",
    url = "https://github.com/bluz71/vim-moonfly-colors"
  },
  nerdtree = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire*\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\21select_next_item*\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\21select_prev_item‚\5\1\0\v\0&\0P6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0035\4\v\0009\5\b\0009\5\t\0059\5\n\5B\5\1\2=\5\f\0049\5\b\0009\5\t\0059\5\n\5B\5\1\2=\5\r\4=\4\t\0039\4\14\0009\4\15\0049\4\16\0045\6\19\0009\a\14\0009\a\17\a5\t\18\0B\a\2\2=\a\20\0069\a\14\0003\t\21\0005\n\22\0B\a\3\2=\a\23\0069\a\14\0003\t\24\0005\n\25\0B\a\3\2=\a\26\6B\4\2\2=\4\14\0039\4\b\0009\4\27\0044\6\6\0005\a\28\0>\a\1\0065\a\29\0>\a\2\0065\a\30\0>\a\3\0065\a\31\0>\a\4\0065\a \0>\a\5\6B\4\2\2=\4\27\3B\1\2\0019\1\2\0009\1!\1'\3\"\0005\4#\0009\5\14\0009\5\15\0059\5!\5B\5\1\2=\5\14\0049\5\b\0009\5\27\0054\a\3\0005\b$\0>\b\1\a4\b\3\0005\t%\0>\t\1\bB\5\3\2=\5\27\4B\1\3\0012\0\0€K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\fcmdline\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\1\0\1\tname\28nvim_lsp_signature_help\fsources\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\0\1\0\1\vselect\2\fconfirm\vinsert\vpreset\fmapping\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/saian/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nô\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\2\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\1\0\3\17auto_install\2\17sync_install\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/saian/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  tagbar = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/majutsushi/tagbar"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n}\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15float_opts\1\0\1\vborder\vshadow\1\0\2\rdirecton\nfloat\14autochdir\2\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nÏ\17\0\0\6\0^\0m6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\b\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\4=\4\t\0034\4\0\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0005\5\16\0=\5\17\0045\5\18\0=\5\19\4=\4\20\0035\4\22\0005\5\21\0=\5\23\0045\5\24\0=\5\25\4=\4\26\0035\4\27\0=\4\28\0035\4\30\0005\5\29\0=\5\31\0045\5 \0=\5!\4=\4\"\3B\1\2\0019\1#\0005\3%\0005\4$\0=\4&\0035\4'\0=\4(\0035\4)\0=\4*\0035\4+\0=\4,\0035\4-\0=\4.\0035\4/\0=\0040\0035\0041\0=\0042\0035\0043\0=\0044\0035\0045\0=\0046\0035\0047\0005\0058\0=\0059\0045\5:\0=\5;\0045\5<\0=\5.\4=\0049\0035\4=\0005\5>\0=\5?\0045\5@\0=\5\31\4=\4A\0035\4B\0005\5C\0=\5\31\0045\5D\0=\0056\0045\5E\0=\5F\0045\5G\0=\5H\0045\5I\0=\5J\0045\5K\0=\5L\0045\5M\0=\5?\0045\5N\0=\5O\4=\4H\0035\4P\0005\5Q\0=\5\31\0045\5R\0=\5S\4=\4T\0035\4U\0=\4V\0035\4W\0=\4X\0035\4Y\0005\5Z\0=\0059\0045\5[\0=\5X\4=\4\\\0035\4]\0B\1\3\1K\0\1\0\1\0\5\vprefix\r<leader>\vnowait\2\fnoremap\2\vsilent\2\tmode\6n\6T\1\3\0\0\"<cmd>Telescope treesitter<CR>\ttags\1\3\0\0!<cmd>Telescope live_grep<CR>\tgrep\1\0\1\tname\14Telescope\6t\1\3\0\0\24<cmd>ToggleTerm<CR>\15ToggleTerm\6e\1\3\0\0\28<cmd>NERDTreeToggle<CR>\rNERDTree\6L\6m\1\3\0\0\19<cmd>Mason<CR>\nmason\1\3\0\0\21<cmd>LspInfo<CR>\rlsp info\1\0\1\tname\blsp\6S\1\3\0\0-<cmd>Telescope lsp_workspace_symbols<CR>\22workspace symbols\1\3\0\0,<cmd>Telescope lsp_document_symbols<CR>\21document symbols\6d\1\3\0\0\27<cmd>TroubleToggle<CR>\16diagnostics\6a\1\3\0\0\28<cmd>CodeActionMenu<CR>\vaction\6l\1\3\0\0-<cmd>lua vim.diagnostic.open_float()<CR>\20line diagnostic\6r\1\3\0\0&<cmd>lua vim.lsp.buf.rename()<CR>\vrename\1\3\0\0&<cmd>lua vim.lsp.buf.format()<CR>\vformat\1\3\0\0%<cmd>lua vim.lsp.buf.hover()<CR>\tinfo\1\0\1\tname\16lsp actions\6p\1\3\0\0\26<cmd>PackerStatus<CR>\tinfo\6s\1\3\0\0+<cmd>:source $MYVIMRC | PackerSync<CR>\tsync\1\0\1\tname\vpacker\1\3\0\0#<cmd>Telescope git_commits<CR>\fcommits\6b\1\3\0\0\28<cmd>GitBlameToggle<CR>\nblame\6g\1\3\0\0\21<cmd>LazyGit<CR>\flazygit\1\0\1\tname\bgit\6f\1\3\0\0\"<cmd>Telescope find_files<CR>\nfiles\6z\1\3\0\0\21<cmd>ZenMode<CR>\rzen mode\6h\1\3\0\0\24<cmd>nohlsearch<CR>\17no highlight\6C\1\3\0\0\24<cmd>Commentary<CR>\fcomment\6c\1\3\0\0\22<cmd>bdelete!<CR>\17close buffer\6W\1\3\0\0\17<cmd>wa!<CR>\14write all\6w\1\3\0\0\16<cmd>w!<CR>\nwrite\6Q\1\3\0\0\17<cmd>qa!<CR>\14close all\6q\1\0\0\1\3\0\0\16<cmd>q!<CR>\nclose\rregister\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmax\0032\bmin\3\20\vheight\1\0\2\fspacing\3\3\nalign\tleft\1\0\2\bmax\3\25\bmin\3\4\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\3\rwinblend\3\0\rposition\vbottom\vborder\vsingle\19popup_mappings\1\0\2\16scroll_down\n<c-d>\14scroll_up\n<c-u>\nicons\1\0\3\ngroup\6+\15breadcrumb\aÂ»\14separator\bâžœ\15key_labels\fplugins\1\0\4\19ignore_missing\2\rtriggers\tauto\14show_keys\2\14show_help\2\fpresets\1\0\a\fwindows\2\17text_objects\2\fmotions\2\14operators\1\6z\2\6g\2\bnav\2\rspelling\1\0\2\fenabled\2\16suggestions\3\20\1\0\2\14registers\2\nmarks\2\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n“\6\0\0\6\0&\0;6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0004\5\0\0=\5\t\0044\5\0\0=\5\n\4=\4\v\0034\4\0\0=\4\f\0035\4\r\0=\4\14\3=\3\16\0025\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\3=\3\30\0025\3\31\0004\4\0\0=\4\19\0034\4\0\0=\4\21\0035\4 \0=\4\23\0035\4!\0=\4\25\0034\4\0\0=\4\27\0034\4\0\0=\4\29\3=\3\"\0024\3\0\0=\3#\0024\3\0\0=\3\n\0024\3\0\0=\3$\0024\3\0\0=\3%\2B\0\2\1K\0\1\0\15extensions\20inactive_winbar\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\frefresh\1\0\3\vwinbar\3è\a\15statusline\3è\a\ftabline\3è\a\17ignore_focus\23disabled_filetypes\vwinbar\15statusline\1\0\0\23section_separators\1\0\2\nright\bî‚²\tleft\bî‚°\25component_separators\1\0\2\nright\bî‚³\tleft\bî‚±\1\0\4\ntheme\tauto\18icons_enabled\2\17globalstatus\1\25always_divide_middle\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nÏ\17\0\0\6\0^\0m6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\b\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\4=\4\t\0034\4\0\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0005\5\16\0=\5\17\0045\5\18\0=\5\19\4=\4\20\0035\4\22\0005\5\21\0=\5\23\0045\5\24\0=\5\25\4=\4\26\0035\4\27\0=\4\28\0035\4\30\0005\5\29\0=\5\31\0045\5 \0=\5!\4=\4\"\3B\1\2\0019\1#\0005\3%\0005\4$\0=\4&\0035\4'\0=\4(\0035\4)\0=\4*\0035\4+\0=\4,\0035\4-\0=\4.\0035\4/\0=\0040\0035\0041\0=\0042\0035\0043\0=\0044\0035\0045\0=\0046\0035\0047\0005\0058\0=\0059\0045\5:\0=\5;\0045\5<\0=\5.\4=\0049\0035\4=\0005\5>\0=\5?\0045\5@\0=\5\31\4=\4A\0035\4B\0005\5C\0=\5\31\0045\5D\0=\0056\0045\5E\0=\5F\0045\5G\0=\5H\0045\5I\0=\5J\0045\5K\0=\5L\0045\5M\0=\5?\0045\5N\0=\5O\4=\4H\0035\4P\0005\5Q\0=\5\31\0045\5R\0=\5S\4=\4T\0035\4U\0=\4V\0035\4W\0=\4X\0035\4Y\0005\5Z\0=\0059\0045\5[\0=\5X\4=\4\\\0035\4]\0B\1\3\1K\0\1\0\1\0\5\vprefix\r<leader>\vnowait\2\fnoremap\2\vsilent\2\tmode\6n\6T\1\3\0\0\"<cmd>Telescope treesitter<CR>\ttags\1\3\0\0!<cmd>Telescope live_grep<CR>\tgrep\1\0\1\tname\14Telescope\6t\1\3\0\0\24<cmd>ToggleTerm<CR>\15ToggleTerm\6e\1\3\0\0\28<cmd>NERDTreeToggle<CR>\rNERDTree\6L\6m\1\3\0\0\19<cmd>Mason<CR>\nmason\1\3\0\0\21<cmd>LspInfo<CR>\rlsp info\1\0\1\tname\blsp\6S\1\3\0\0-<cmd>Telescope lsp_workspace_symbols<CR>\22workspace symbols\1\3\0\0,<cmd>Telescope lsp_document_symbols<CR>\21document symbols\6d\1\3\0\0\27<cmd>TroubleToggle<CR>\16diagnostics\6a\1\3\0\0\28<cmd>CodeActionMenu<CR>\vaction\6l\1\3\0\0-<cmd>lua vim.diagnostic.open_float()<CR>\20line diagnostic\6r\1\3\0\0&<cmd>lua vim.lsp.buf.rename()<CR>\vrename\1\3\0\0&<cmd>lua vim.lsp.buf.format()<CR>\vformat\1\3\0\0%<cmd>lua vim.lsp.buf.hover()<CR>\tinfo\1\0\1\tname\16lsp actions\6p\1\3\0\0\26<cmd>PackerStatus<CR>\tinfo\6s\1\3\0\0+<cmd>:source $MYVIMRC | PackerSync<CR>\tsync\1\0\1\tname\vpacker\1\3\0\0#<cmd>Telescope git_commits<CR>\fcommits\6b\1\3\0\0\28<cmd>GitBlameToggle<CR>\nblame\6g\1\3\0\0\21<cmd>LazyGit<CR>\flazygit\1\0\1\tname\bgit\6f\1\3\0\0\"<cmd>Telescope find_files<CR>\nfiles\6z\1\3\0\0\21<cmd>ZenMode<CR>\rzen mode\6h\1\3\0\0\24<cmd>nohlsearch<CR>\17no highlight\6C\1\3\0\0\24<cmd>Commentary<CR>\fcomment\6c\1\3\0\0\22<cmd>bdelete!<CR>\17close buffer\6W\1\3\0\0\17<cmd>wa!<CR>\14write all\6w\1\3\0\0\16<cmd>w!<CR>\nwrite\6Q\1\3\0\0\17<cmd>qa!<CR>\14close all\6q\1\0\0\1\3\0\0\16<cmd>q!<CR>\nclose\rregister\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmax\0032\bmin\3\20\vheight\1\0\2\fspacing\3\3\nalign\tleft\1\0\2\bmax\3\25\bmin\3\4\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\3\rwinblend\3\0\rposition\vbottom\vborder\vsingle\19popup_mappings\1\0\2\16scroll_down\n<c-d>\14scroll_up\n<c-u>\nicons\1\0\3\ngroup\6+\15breadcrumb\aÂ»\14separator\bâžœ\15key_labels\fplugins\1\0\4\19ignore_missing\2\rtriggers\tauto\14show_keys\2\14show_help\2\fpresets\1\0\a\fwindows\2\17text_objects\2\fmotions\2\14operators\1\6z\2\6g\2\bnav\2\rspelling\1\0\2\fenabled\2\16suggestions\3\20\1\0\2\14registers\2\nmarks\2\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire*\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\21select_next_item*\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\21select_prev_item‚\5\1\0\v\0&\0P6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0035\4\v\0009\5\b\0009\5\t\0059\5\n\5B\5\1\2=\5\f\0049\5\b\0009\5\t\0059\5\n\5B\5\1\2=\5\r\4=\4\t\0039\4\14\0009\4\15\0049\4\16\0045\6\19\0009\a\14\0009\a\17\a5\t\18\0B\a\2\2=\a\20\0069\a\14\0003\t\21\0005\n\22\0B\a\3\2=\a\23\0069\a\14\0003\t\24\0005\n\25\0B\a\3\2=\a\26\6B\4\2\2=\4\14\0039\4\b\0009\4\27\0044\6\6\0005\a\28\0>\a\1\0065\a\29\0>\a\2\0065\a\30\0>\a\3\0065\a\31\0>\a\4\0065\a \0>\a\5\6B\4\2\2=\4\27\3B\1\2\0019\1\2\0009\1!\1'\3\"\0005\4#\0009\5\14\0009\5\15\0059\5!\5B\5\1\2=\5\14\0049\5\b\0009\5\27\0054\a\3\0005\b$\0>\b\1\a4\b\3\0005\t%\0>\t\1\bB\5\3\2=\5\27\4B\1\3\0012\0\0€K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\fcmdline\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\1\0\1\tname\28nvim_lsp_signature_help\fsources\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\0\1\0\1\vselect\2\fconfirm\vinsert\vpreset\fmapping\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\n¼\1\0\2\t\0\f\0\0255\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\6\0006\a\2\0009\a\a\a9\a\b\a9\a\t\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\n\0006\a\2\0009\a\a\a9\a\b\a9\a\v\a\18\b\2\0B\3\5\1K\0\1\0\15definition\agd\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\bvim\vbuffer\1\0\2\fnoremap\2\vsilent\2m\0\1\5\2\6\0\f6\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\0015\3\3\0-\4\0\0=\4\4\3-\4\1\0=\4\5\3B\1\2\1K\0\1\0\1À\2À\14on_attach\17capabilities\1\0\0\nsetup\14lspconfig\frequireØ\1\1\0\a\0\n\0\0216\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0004\4\0\0=\4\4\3B\1\2\0016\1\0\0'\3\5\0B\1\2\0029\1\6\1B\1\1\0023\2\a\0009\3\b\0004\5\3\0003\6\t\0>\6\1\5B\3\2\0012\0\0€K\0\1\0\0\19setup_handlers\0\25default_capabilities\17cmp_nvim_lsp\21ensure_installed\1\0\1\27automatic_installation\2\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: moonfly
time([[Config for moonfly]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme moonfly\bcmd\bvim\0", "config", "moonfly")
time([[Config for moonfly]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\nã\5\0\0\5\0\22\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0004\4\0\0=\4\5\3=\3\6\0026\3\a\0009\3\b\0039\3\t\0039\3\n\3=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\2B\0\2\1K\0\1\0\aui\fkeymaps\1\0\t\24cancel_installation\n<C-c>\22uninstall_package\6X\28check_outdated_packages\6C\24update_all_packages\6U\26check_package_version\6c\19update_package\6u\20install_package\6i\26toggle_package_expand\t<CR>\26apply_language_filter\n<C-f>\nicons\1\0\3\24package_uninstalled\bâ—\20package_pending\bâ—\22package_installed\bâ—\1\0\4\nwidth\4š³æÌ\t™³¦ÿ\3$check_outdated_packages_on_open\2\vheight\4Í™³æ\fÌ™³ÿ\3\vborder\tnone\14providers\1\2\0\0!mason.providers.registry-api\vgithub\1\0\1\26download_url_template2https://github.com/%s/releases/download/%s/%s\14log_level\tINFO\vlevels\blog\bvim\bpip\17install_args\1\0\1\16upgrade_pip\1\1\0\2\tPATH\fprepend\30max_concurrent_installers\3\4\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: git-blame.nvim
time([[Config for git-blame.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\31let g:gitblame_enabled = 0\bcmd\bvim\0", "config", "git-blame.nvim")
time([[Config for git-blame.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nô\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\2\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\1\0\3\17auto_install\2\17sync_install\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n}\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15float_opts\1\0\1\vborder\vshadow\1\0\2\rdirecton\nfloat\14autochdir\2\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'CodeActionMenu', function(cmdargs)
          require('packer.load')({'nvim-code-action-menu'}, { cmd = 'CodeActionMenu', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-code-action-menu'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('CodeActionMenu ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'dashboard-nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles(1) end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
