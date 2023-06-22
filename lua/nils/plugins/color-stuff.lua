local statuslineConf = require("nils.configuration.statusline")
local colorConf = require("nils.configuration.color-stuff")

return {
  { "ellisonleao/gruvbox.nvim",    event = "VeryLazy", config = colorConf.gruvbox },
  { "xiyaowong/nvim-transparent",  lazy = false,       config = colorConf.transparent },
  { "rebelot/kanagawa.nvim",       event = "VeryLazy", config = colorConf.kanagawa },
  { "Everblush/everblush.nvim",    event = "VeryLazy", config = colorConf.everblush },
  { "folke/tokyonight.nvim",       event = "VeryLazy", config = colorConf.tokyonight },
  { "sam4llis/nvim-tundra",        event = "VeryLazy", config = colorConf.tundra },
  { "EdenEast/nightfox.nvim",      event = "VeryLazy", config = colorConf.nightfox },
  { "Mofiqul/vscode.nvim",         event = "VeryLazy", config = colorConf.vscode },
  { "catppuccin/nvim",             event = "VeryLazy", config = colorConf.catppuccin },
  { "olimorris/onedarkpro.nvim",   event = "VeryLazy", config = colorConf.onedarkpro },
  { "projekt0n/github-nvim-theme", event = "VeryLazy", config = colorConf.github },
  { "seandewar/paragon.vim",       event = "VeryLazy" },
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    config = colorConf.zenmode,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
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
