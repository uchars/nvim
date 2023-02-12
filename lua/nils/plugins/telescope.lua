local conf = require("nils.configuration.telescope")

return {
  "nvim-telescope/telescope.nvim",
  event = "UIEnter",
  dependencies = {
    "octarect/telescope-menu.nvim",
    "uchars/telescope-pubdev.nvim",
    -- { dir = "~/telescope-pubdev.nvim/" },
  },
  config = conf.telescope,
}
