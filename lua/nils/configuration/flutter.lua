local conf = {}
local autocmd = vim.api.nvim_create_autocmd

function _genL10n()
  local ok, notify = pcall(require, "notify")
  if ok then
    notify("Generating l10n", "info", { title = "Flutter" })
  end
  vim.fn.jobstart("flutter gen-l10n")
end

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

  autocmd("BufWritePost", {
    pattern = "*.arb",
    callback = function()
      _genL10n()
    end,
  })
end

return conf
