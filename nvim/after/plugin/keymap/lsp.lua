local Remap = require("nils.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
nnoremap("gD", function() vim.lsp.buf.definition() end)
nnoremap("]d", function() vim.diagnostic.goto_next() end)
nnoremap("[d", function() vim.diagnostic.goto_prev() end)
nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
    filter = function(code_action)
        if not code_action or not code_action.data then
            return false
        end

        local data = code_action.data.id
        return string.sub(data, #data - 1, #data) == ":0"
    end,
    apply = true
}) end)
nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)

local opts = { noremap = true, silent = true }
nnoremap("<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
nnoremap("K", "<Cmd>Lspsaga hover_doc<CR>", opts)
nnoremap("gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
nnoremap("gr", "<Cmd>Lspsaga rename<CR>", opts)
nnoremap("<leader>vca", "<Cmd>Lspsaga code_action<CR>", opts)
