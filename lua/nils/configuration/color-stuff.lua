local conf = {}

function conf.todo()
  require("todo-comments").setup({
    keywords = {
      FIX = {
        icon = " ",
        color = "error",
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    },
    highlight = {
      keyword = "bg",
    },
  })
end

function conf.zenmode()
  require("zen-mode").setup({})
end

function conf.colorizer()
  vim.opt.termguicolors = true
  require("colorizer").setup({
    "*",
  })
end

function conf.transparent()
  require("transparent").setup({
    extra_groups = {
      "TelescopeNormal",
      "TelescopeBorder",
      "TreesitterContext",
      "FloatBorder",
      "NormalFloat",
      "NvimTreeNormal",
      "NvimTreeNormalNC",
      "NvimTreeWinSeparator",
      "TelescopePrompt",
      "NotifyERRORBorder",
      "NotifyWARNBorder",
      "NotifyINFOBorder",
      "NotifyDEBUGBorder",
      "NotifyTRACEBorder",
      "NotifyERRORBody",
      "NotifyWARNBody",
      "NotifyINFOBody",
      "NotifyDEBUGBody",
      "NotifyTRACEBody",
    },
  })
end

function conf.gruvbox()
  require("gruvbox").setup({
    -- transparent_mode = true,
  })
end

function conf.kanagawa()
  require("kanagawa").setup({
    -- transparent = true,
  })
end

function conf.everblush()
  require("everblush").setup({
    -- transparent_background = true,
  })
end

function conf.tokyonight()
  require("tokyonight").setup({
    -- transparent = true,
  })
end

function conf.tundra()
  require("nvim-tundra").setup({
    -- transparent_background = true,
  })
end

function conf.nightfox()
  require("nightfox").setup({
    -- transparent = true,
  })
end

function conf.vscode()
  require("vscode").setup({
    disable_nvimtree_bg = true,
  })
end

function conf.catppuccin()
  require("catppuccin").setup({})
end

function conf.onedarkpro()
  require("onedarkpro").setup({})
end

function conf.github()
  require("github-theme").setup({})
end

return conf
