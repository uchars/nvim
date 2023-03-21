-- Import dependencies
local Path = require("plenary.path")

local config = {
  colorscheme = "kanagawa",
  transparency = false,
}

local config_path = vim.fn.stdpath("data") .. "/config.json"

local config_file = Path:new(config_path)

-- If configuration file exists, read and merge with default configuration
if config_file:exists() then
  local config_json = vim.fn.json_decode(config_file:read())
  config = vim.tbl_extend("force", config, config_json)
  print(config.colorscheme)
else
  config_file:write(vim.fn.json_encode(config), "w")
end

-- Apply configuration
vim.cmd.colorscheme(config.colorscheme) -- set colorscheme
if config.transparency then
  vim.cmd("TransparentEnable")          -- set transparency
end
vim.opt.termguicolors = true
vim.opt.background = "dark"

local hl = function(thing, opts)
  vim.api.nvim_set_hl(0, thing, opts)
end

hl("LineNr", {
  fg = "#d79921",
})

--
-- Plugins
hl("TelescopeNormal", {
  bg = "none",
})

hl("TelescopeBorder", {
  bg = "none",
})
