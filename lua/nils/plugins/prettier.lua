local conf = require("nils.configuration.format")

return {
  {
    "MunifTanjim/prettier.nvim",
    ft = {
      "lua",
      "javascriptreact",
      "typescriptreact",
      "javascript",
      "typescript",
      "dart",
      "flutter",
      "dockerfile",
      "html",
      "scss",
      "css",
      "html",
      "json",
    },
    config = conf.prettier,
  },
  {
    "kylechui/nvim-surround",
    event = "BufEnter",
    config = conf.surround,
  },
  "sbdchd/neoformat",
}
