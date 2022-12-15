vim.g.nils_colorscheme = "kanagawa"
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.g.gruvbox_invert_selection = '0'

require("tokyonight").setup({
    transparent = true
})

require("kanagawa").setup({
    transparent = true
})

vim.cmd("colorscheme " .. vim.g.nils_colorscheme)

vim.cmd 'highlight TelescopeBorder guibg=none'
vim.cmd 'highlight TelescopeTitle guibg=none'


local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
end

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

