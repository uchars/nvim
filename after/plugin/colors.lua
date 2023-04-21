-- Import dependencies
local Path = require("plenary.path")
local Configger = require("../../lua/utils/configger")

local config = {
  colorscheme = "kanagawa",
  transparency = false,
}
local configger = Configger:new(config)

-- Apply configuration
print("Setting colorscheme to " .. vim.g.colors_name .. "")
vim.cmd.colorscheme(configger:get("colorscheme")) -- set colorscheme
if configger:get("transparency") then
  vim.cmd("TransparentEnable")                    -- set transparency
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
