local status, indentBlankline = pcall(require, "indent_blankline")
if (not status) then return end

vim.g.indent_blankline_filetype = { "javascriptreact", "typescriptreact", "javascript", "typescript", "html" }
indentBlankline.setup {}
