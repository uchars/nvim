local nnoremap = require("nils.keymap").nnoremap

vim.api.nvim_create_user_command("Nf", ":Neoformat", {})

