local conf = require("nils.configuration.statusline")

return {
  { "projekt0n/github-nvim-theme", lazy = false },
  { "morhetz/gruvbox", lazy = false },
  { "rebelot/kanagawa.nvim", lazy = false },
  { "Everblush/everblush.nvim", lazy = false },
  { "folke/tokyonight.nvim", lazy = false },
  { "sam4llis/nvim-tundra", lazy = false },
  { "EdenEast/nightfox.nvim", lazy = false },
  "folke/zen-mode.nvim",
  {
    "nvim-lualine/lualine.nvim",
    event = "UIEnter",
    config = conf.lualine,
  },
  "norcalli/nvim-colorizer.lua",
}
