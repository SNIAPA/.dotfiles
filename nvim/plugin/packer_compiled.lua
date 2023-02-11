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
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
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
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
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
  ["lsp-zero.nvim"] = {
    config = { "\27LJ\2\nl\0\0\4\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0019\1\4\0B\1\1\0019\1\5\0B\1\1\1K\0\1\0\nsetup\19nvim_workspace\16recommended\vpreset\rlsp-zero\frequire\0" },
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\nÀ\4\0\0\6\0\r\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\0039\3\6\3'\5\a\0B\3\2\2'\4\b\0&\3\4\3=\3\t\0025\3\n\0=\3\v\0024\3\0\0=\3\f\2B\0\2\1K\0\1\0\24extra_trigger_chars\17handler_opts\1\0\1\vborder\frounded\rlog_path\23/lsp_signature.log\ncache\fstdpath\afn\bvim\1\0\24\19always_trigger\1\14max_width\3P\17hi_parameter LspSignatureActiveParameter\16hint_scheme\vString\twrap\2\16hint_prefix\nüêº \16hint_enable\1\ffix_pos\1\18close_timeout\3†\31\26floating_window_off_y\3\0\26floating_window_off_x\3\1#floating_window_above_cur_line\2\20floating_window\2\nnoice\1\ndebug\1\15max_height\3\f\14doc_lines\3\n\fverbose\1\19timer_interval\3»\1\17shadow_guibg\nBlack\17shadow_blend\3$\tbind\2\fpadding\5\vzindex\3»\1\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nì\6\0\0\6\0&\0;6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0004\5\0\0=\5\t\0044\5\0\0=\5\n\4=\4\v\0034\4\0\0=\4\f\0035\4\r\0=\4\14\3=\3\16\0025\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\3=\3\30\0025\3\31\0004\4\0\0=\4\19\0034\4\0\0=\4\21\0035\4 \0=\4\23\0035\4!\0=\4\25\0034\4\0\0=\4\27\0034\4\0\0=\4\29\3=\3\"\0024\3\0\0=\3#\0024\3\0\0=\3\n\0024\3\0\0=\3$\0024\3\0\0=\3%\2B\0\2\1K\0\1\0\15extensions\20inactive_winbar\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\frefresh\1\0\3\ftabline\3Ë\a\vwinbar\3Ë\a\15statusline\3Ë\a\17ignore_focus\23disabled_filetypes\vwinbar\15statusline\1\0\0\23section_separators\1\0\2\nright\bÓÇ≤\tleft\bÓÇ∞\25component_separators\1\0\2\nright\bÓÇ≥\tleft\bÓÇ±\1\0\4\ntheme\tauto\18icons_enabled\2\17globalstatus\1\25always_divide_middle\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
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
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÙ\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\2\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\1\0\3\17auto_install\2\17sync_install\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
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
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n¢\14\0\0\6\0P\0]6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\b\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\4=\4\t\0034\4\0\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0005\5\16\0=\5\17\0045\5\18\0=\5\19\4=\4\20\0035\4\22\0005\5\21\0=\5\23\0045\5\24\0=\5\25\4=\4\26\0035\4\27\0=\4\28\0035\4\30\0005\5\29\0=\5\31\0045\5 \0=\5!\4=\4\"\3B\1\2\0019\1#\0004\3\0\0005\4$\0B\1\3\0019\1#\0005\3&\0005\4%\0=\4'\0035\4(\0=\4)\0035\4*\0=\4+\0035\4,\0=\4-\0035\4.\0=\4/\0035\0040\0=\0041\0035\0042\0=\0043\0035\0044\0005\0055\0=\0056\0045\0057\0=\0058\0045\0059\0=\5/\4=\0046\0035\4:\0005\5;\0=\5<\0045\5=\0=\5\31\4=\4>\0035\4?\0005\5@\0=\5A\0045\5B\0=\5<\0045\5C\0=\5D\4=\4E\0035\4F\0005\5G\0=\5\31\0045\5H\0=\5I\4=\4J\0035\4K\0=\4L\0035\4M\0=\4N\0035\4O\0B\1\3\1K\0\1\0\1\0\5\vsilent\2\tmode\6n\vnowait\2\vprefix\r<leader>\fnoremap\2\6t\1\3\0\0\26<cmd>TagbarToggle<CR>\vTagbar\6e\1\3\0\0\28<cmd>NERDTreeToggle<CR>\rNERDTree\6L\6m\1\3\0\0\19<cmd>Mason<CR>\nmason\1\3\0\0\21<cmd>LspInfo<CR>\rlsp info\1\0\1\tname\blsp\6l\6S\1\3\0\0-<cmd>Telescope lsp_workspace_symbols<CR>\22workspace symbols\1\3\0\0,<cmd>Telescope lsp_document_symbols<CR>\21document symbols\6d\1\3\0\0\"<cmd>Telescope diagnostic<CR>\16diagnostics\1\0\1\tname\16lsp actions\6p\1\3\0\0\26<cmd>PackerStatus<CR>\tinfo\6s\1\3\0\0\24<cmd>PackerSync<CR>\tsync\1\0\1\tname\vpacker\1\3\0\0#<cmd>Telescope git_commits<CR>\fcommits\6b\1\3\0\0\28<cmd>GitBlameToggle<CR>\nblame\6g\1\3\0\0\21<cmd>LazyGit<CR>\flazygit\1\0\1\tname\bgit\6f\1\3\0\0\"<cmd>Telescope find_files<CR>\nfiles\6h\1\3\0\0\24<cmd>nohlsearch<CR>\17no highlight\6c\1\3\0\0\22<cmd>bdelete!<CR>\17close buffer\6W\1\3\0\0\17<cmd>wa!<CR>\14write all\6w\1\3\0\0\16<cmd>w!<CR>\nwrite\6Q\1\3\0\0\17<cmd>qa!<CR>\14close all\6q\1\0\0\1\3\0\0\16<cmd>q!<CR>\nclose\1\0\5\vsilent\2\tmode\6n\vnowait\2\vprefix\6g\fnoremap\2\rregister\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmax\0032\bmin\3\20\vheight\1\0\2\fspacing\3\3\nalign\tleft\1\0\2\bmax\3\25\bmin\3\4\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\3\rposition\vbottom\rwinblend\3\0\vborder\vsingle\19popup_mappings\1\0\2\16scroll_down\n<c-d>\14scroll_up\n<c-u>\nicons\1\0\3\ngroup\6+\14separator\b‚ûú\15breadcrumb\a¬ª\15key_labels\fplugins\1\0\4\19ignore_missing\2\rtriggers\tauto\14show_keys\2\14show_help\2\fpresets\1\0\a\fwindows\2\17text_objects\2\fmotions\2\14operators\1\6g\2\6z\2\bnav\2\rspelling\1\0\2\fenabled\2\16suggestions\3\20\1\0\2\14registers\2\nmarks\2\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/saian/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: moonfly
time([[Config for moonfly]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme moonfly\bcmd\bvim\0", "config", "moonfly")
time([[Config for moonfly]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\nÀ\4\0\0\6\0\r\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\0039\3\6\3'\5\a\0B\3\2\2'\4\b\0&\3\4\3=\3\t\0025\3\n\0=\3\v\0024\3\0\0=\3\f\2B\0\2\1K\0\1\0\24extra_trigger_chars\17handler_opts\1\0\1\vborder\frounded\rlog_path\23/lsp_signature.log\ncache\fstdpath\afn\bvim\1\0\24\19always_trigger\1\14max_width\3P\17hi_parameter LspSignatureActiveParameter\16hint_scheme\vString\twrap\2\16hint_prefix\nüêº \16hint_enable\1\ffix_pos\1\18close_timeout\3†\31\26floating_window_off_y\3\0\26floating_window_off_x\3\1#floating_window_above_cur_line\2\20floating_window\2\nnoice\1\ndebug\1\15max_height\3\f\14doc_lines\3\n\fverbose\1\19timer_interval\3»\1\17shadow_guibg\nBlack\17shadow_blend\3$\tbind\2\fpadding\5\vzindex\3»\1\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÙ\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\2\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\1\0\3\17auto_install\2\17sync_install\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nì\6\0\0\6\0&\0;6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0004\5\0\0=\5\t\0044\5\0\0=\5\n\4=\4\v\0034\4\0\0=\4\f\0035\4\r\0=\4\14\3=\3\16\0025\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\3=\3\30\0025\3\31\0004\4\0\0=\4\19\0034\4\0\0=\4\21\0035\4 \0=\4\23\0035\4!\0=\4\25\0034\4\0\0=\4\27\0034\4\0\0=\4\29\3=\3\"\0024\3\0\0=\3#\0024\3\0\0=\3\n\0024\3\0\0=\3$\0024\3\0\0=\3%\2B\0\2\1K\0\1\0\15extensions\20inactive_winbar\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\frefresh\1\0\3\ftabline\3Ë\a\vwinbar\3Ë\a\15statusline\3Ë\a\17ignore_focus\23disabled_filetypes\vwinbar\15statusline\1\0\0\23section_separators\1\0\2\nright\bÓÇ≤\tleft\bÓÇ∞\25component_separators\1\0\2\nright\bÓÇ≥\tleft\bÓÇ±\1\0\4\ntheme\tauto\18icons_enabled\2\17globalstatus\1\25always_divide_middle\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: lsp-zero.nvim
time([[Config for lsp-zero.nvim]], true)
try_loadstring("\27LJ\2\nl\0\0\4\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0019\1\4\0B\1\1\0019\1\5\0B\1\1\1K\0\1\0\nsetup\19nvim_workspace\16recommended\vpreset\rlsp-zero\frequire\0", "config", "lsp-zero.nvim")
time([[Config for lsp-zero.nvim]], false)
-- Config for: git-blame.nvim
time([[Config for git-blame.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\31let g:gitblame_enabled = 0\bcmd\bvim\0", "config", "git-blame.nvim")
time([[Config for git-blame.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n¢\14\0\0\6\0P\0]6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\b\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\4=\4\t\0034\4\0\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0005\5\16\0=\5\17\0045\5\18\0=\5\19\4=\4\20\0035\4\22\0005\5\21\0=\5\23\0045\5\24\0=\5\25\4=\4\26\0035\4\27\0=\4\28\0035\4\30\0005\5\29\0=\5\31\0045\5 \0=\5!\4=\4\"\3B\1\2\0019\1#\0004\3\0\0005\4$\0B\1\3\0019\1#\0005\3&\0005\4%\0=\4'\0035\4(\0=\4)\0035\4*\0=\4+\0035\4,\0=\4-\0035\4.\0=\4/\0035\0040\0=\0041\0035\0042\0=\0043\0035\0044\0005\0055\0=\0056\0045\0057\0=\0058\0045\0059\0=\5/\4=\0046\0035\4:\0005\5;\0=\5<\0045\5=\0=\5\31\4=\4>\0035\4?\0005\5@\0=\5A\0045\5B\0=\5<\0045\5C\0=\5D\4=\4E\0035\4F\0005\5G\0=\5\31\0045\5H\0=\5I\4=\4J\0035\4K\0=\4L\0035\4M\0=\4N\0035\4O\0B\1\3\1K\0\1\0\1\0\5\vsilent\2\tmode\6n\vnowait\2\vprefix\r<leader>\fnoremap\2\6t\1\3\0\0\26<cmd>TagbarToggle<CR>\vTagbar\6e\1\3\0\0\28<cmd>NERDTreeToggle<CR>\rNERDTree\6L\6m\1\3\0\0\19<cmd>Mason<CR>\nmason\1\3\0\0\21<cmd>LspInfo<CR>\rlsp info\1\0\1\tname\blsp\6l\6S\1\3\0\0-<cmd>Telescope lsp_workspace_symbols<CR>\22workspace symbols\1\3\0\0,<cmd>Telescope lsp_document_symbols<CR>\21document symbols\6d\1\3\0\0\"<cmd>Telescope diagnostic<CR>\16diagnostics\1\0\1\tname\16lsp actions\6p\1\3\0\0\26<cmd>PackerStatus<CR>\tinfo\6s\1\3\0\0\24<cmd>PackerSync<CR>\tsync\1\0\1\tname\vpacker\1\3\0\0#<cmd>Telescope git_commits<CR>\fcommits\6b\1\3\0\0\28<cmd>GitBlameToggle<CR>\nblame\6g\1\3\0\0\21<cmd>LazyGit<CR>\flazygit\1\0\1\tname\bgit\6f\1\3\0\0\"<cmd>Telescope find_files<CR>\nfiles\6h\1\3\0\0\24<cmd>nohlsearch<CR>\17no highlight\6c\1\3\0\0\22<cmd>bdelete!<CR>\17close buffer\6W\1\3\0\0\17<cmd>wa!<CR>\14write all\6w\1\3\0\0\16<cmd>w!<CR>\nwrite\6Q\1\3\0\0\17<cmd>qa!<CR>\14close all\6q\1\0\0\1\3\0\0\16<cmd>q!<CR>\nclose\1\0\5\vsilent\2\tmode\6n\vnowait\2\vprefix\6g\fnoremap\2\rregister\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmax\0032\bmin\3\20\vheight\1\0\2\fspacing\3\3\nalign\tleft\1\0\2\bmax\3\25\bmin\3\4\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\3\rposition\vbottom\rwinblend\3\0\vborder\vsingle\19popup_mappings\1\0\2\16scroll_down\n<c-d>\14scroll_up\n<c-u>\nicons\1\0\3\ngroup\6+\14separator\b‚ûú\15breadcrumb\a¬ª\15key_labels\fplugins\1\0\4\19ignore_missing\2\rtriggers\tauto\14show_keys\2\14show_help\2\fpresets\1\0\a\fwindows\2\17text_objects\2\fmotions\2\14operators\1\6g\2\6z\2\bnav\2\rspelling\1\0\2\fenabled\2\16suggestions\3\20\1\0\2\14registers\2\nmarks\2\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
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
