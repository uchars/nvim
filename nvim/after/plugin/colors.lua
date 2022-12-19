vim.g.nils_colorscheme = "kanagawa"
local status1, colorscheme = pcall(require, vim.g.nils_colorscheme)
if not status1 then
    print("colorscheme not installed")
    return
end
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.g.gruvbox_invert_selection = '0'

colorscheme.setup({
    transparent = true,
})

vim.cmd("colorscheme " .. vim.g.nils_colorscheme)

local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
end

hl("Normal", {
    bg = "none",
})

hl("NormalFloat", {
    bg = "none",
})

hl("SignColumn", {
    bg = "none",
})

hl("ColorColumn", {
    ctermbg = 0,
    bg = "#555555",
})

hl("CursorLineNR", {
    bg = "None"
})

hl("LineNr", {
    fg = "#d79921"
})

hl("netrwDir", {
    fg = "#d79921"
})

-- Plugins
hl("TelescopeNormal", {
    bg = "none",
})

hl("TelescopeBorder", {
    bg = "none",
})

