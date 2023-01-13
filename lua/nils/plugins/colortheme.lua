local conf = require("nils.configuration.statusline")

return {
  "ellisonleao/gruvbox.nvim",
  "rebelot/kanagawa.nvim",
  "Everblush/everblush.nvim",
  "folke/tokyonight.nvim",
  "folke/zen-mode.nvim",
  {
    "nvim-lualine/lualine.nvim",
    event = "UIEnter",
    config = conf.lualine,
  },
  "norcalli/nvim-colorizer.lua",
}
