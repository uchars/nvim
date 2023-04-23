local Configger = require("utils.configger")

local config = {
  colorscheme = "kanagawa",
  transparency = false,
}
local configger = Configger:new(config)

-- Apply configuration
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