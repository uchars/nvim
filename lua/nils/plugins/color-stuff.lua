local statuslineConf = require("nils.configuration.statusline")
local colorConf = require("nils.configuration.color-stuff")

return {
  { "ellisonleao/gruvbox.nvim",    lazy = true, config = colorConf.gruvbox },
  { "xiyaowong/nvim-transparent",  lazy = true, config = colorConf.transparent },
  { "projekt0n/github-nvim-theme", lazy = true, config = colorConf.github },
  { "rebelot/kanagawa.nvim",       lazy = true, config = colorConf.kanagawa },
  { "Everblush/everblush.nvim",    lazy = true, config = colorConf.everblush },
  { "folke/tokyonight.nvim",       lazy = true, config = colorConf.tokyonight },
  { "sam4llis/nvim-tundra",        lazy = true, config = colorConf.tundra },
  { "EdenEast/nightfox.nvim",      lazy = true, config = colorConf.nightfox },
  { "Mofiqul/vscode.nvim",         lazy = true, config = colorConf.vscode },
  { "catppuccin/nvim",             lazy = true, config = colorConf.catppuccin },
  { "olimorris/onedarkpro.nvim",   lazy = true, config = colorConf.onedarkpro },
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    config = colorConf.zenmode,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "UIEnter",
    config = statuslineConf.lualine,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufEnter",
    config = colorConf.colorizer,
  },
  {
    "folke/todo-comments.nvim",
    event = "UIEnter",
    config = colorConf.todo,
  },
}
