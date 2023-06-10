local conf = {}

function conf.indent_blankline()
  vim.g.indent_blankline_filetype_exclude = { "dashboard" }
  require("indent_blankline").setup({
    show_current_context = true,
    show_trailing_blankline_indent = false,
  })
end

return conf
