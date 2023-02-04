local conf = require("nils.configuration.indent-guide")

return {
  "lukas-reineke/indent-blankline.nvim",
  ft = {
    "javascript",
    "javascriptreact",
    "typescriptreact",
    "typescript",
    "dart",
    "html",
    "json",
  },
  config = conf.indent_blankline,
}
