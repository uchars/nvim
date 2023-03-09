local conf = {}

function conf.flutter()
  -- Flutter
  require("flutter-tools").setup({
    closing_tags = {
      enabled = true,
      prefix = ">",
    },
    dev_log = {
      enabled = true,
      open_cmd = "tabedit",
    },
    lsp = {
      settings = {
        showTodos = false,
      },
    },
  })

  require("telescope").load_extension("flutter")
end

return conf
