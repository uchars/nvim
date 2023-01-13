local Remap = require("nils.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local opts = { buffer = bufnr, remap = false, silent = true }

nnoremap("gd", function()
  vim.lsp.buf.definition()
end, opts)
nnoremap("gi", function()
  vim.lsp.buf.implementation()
end, opts)
nnoremap("<leader>vws", function()
  vim.lsp.buf.workspace_symbol()
end, opts)
nnoremap("<leader>vd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
inoremap("<C-h>", "<cmd>Lspsaga signature_help<CR>", opts)
nnoremap("]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
nnoremap("[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
nnoremap("K", "<Cmd>Lspsaga hover_doc<CR>", opts)
nnoremap("gD", "<Cmd>Lspsaga lsp_finder<CR>", opts)
nnoremap("gr", "<Cmd>Lspsaga rename<CR>", opts)
nnoremap("<leader>vca", "<cmd>Lspsaga code_action<CR>", opts)
