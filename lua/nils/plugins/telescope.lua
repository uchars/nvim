local conf = require("nils.configuration.telescope")

return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    "octarect/telescope-menu.nvim",
  },
  config = conf.telescope,
}
