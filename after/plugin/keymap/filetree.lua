local nnoremap = require("nils.keymap").nnoremap
local silent = { silent = true }

nnoremap("<C-b>", ":NvimTreeToggle<CR>", silent)
