local Remap = require("nils.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

nnoremap("gd", function() vim.lsp.buf.definition() end)
nnoremap("gi", function() vim.lsp.buf.implementation() end)
nnoremap("K", function() vim.lsp.buf.hover() end)
nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
nnoremap("]d", function() vim.diagnostic.goto_next() end)
nnoremap("[d", function() vim.diagnostic.goto_prev() end)
nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
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

