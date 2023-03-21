local Path = require("plenary.path")

local config = {
  colorscheme = "kanagawa",
  transparency = false,
}

local config_path = vim.fn.stdpath("data") .. "/config.json"
if Path:new(config_path):exists() then
  local config_json = vim.fn.json_decode(Path:new(config_path):read()) -- read config json
  -- merge config tables
  for k, v in pairs(config_json) do
    config[k] = v
  end
else
  Path:new(config_path):write(vim.fn.json_encode(config), "w") -- write config if file not exists
end

vim.cmd.colorscheme(config.colorscheme) -- set colorscheme
if config.transparency == true then
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
