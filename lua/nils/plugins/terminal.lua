local conf = require("nils.configuration.terminal")

return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = conf.terminal,
}
