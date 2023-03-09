local conf = require("nils.configuration.telescope")

return {
  "nvim-telescope/telescope.nvim",
  event = "UIEnter",
  dependencies = {
    "octarect/telescope-menu.nvim",
  },
  config = conf.telescope,
}
