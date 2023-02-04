vim.g.nils_colorscheme = "kanagawa"
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme(vim.g.nils_colorscheme)

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
