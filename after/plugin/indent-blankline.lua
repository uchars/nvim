local status, indentBlankline = pcall(require, "indent-blankline")
if (not status) then return end

indentBlankline.setup({})
