local conf = {}

function conf.treesitter()
  -- local ok, treesitter_install = pcall(require, "nvim-treesitter.install")
  -- if not ok then
  --   print("treesitter not installed")
  --   return
  -- end

  require("nvim-treesitter.install").compilers = { "clang" }

  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
      "c",
      "lua",
      "dart",
      "css",
      "diff",
      "dockerfile",
      "cpp",
      "html",
      "javascript",
      "json",
      "json5",
      "markdown",
      "python",
      "rust",
      "scss",
      "sql",
      "tsx",
      "typescript",
      "vim",
      "go",
      "graphql",
      "gitignore",
      "arduino",
      "make",
      -- "php",
      "phpdoc",
      "jsdoc",
      "regex",
      "yaml",
    },

    autotag = {
      enable = true,
    },

    yati = {
      enable = true,
      default_lazy = true,
      default_fallback = "auto",
    },

    indent = {
      enable = false,
      disable = {},
    },

    sync_install = false,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  })
end

function conf.autotag()
  require("nvim-ts-autotag").setup()
end

function conf.treesittercontext()
  require("treesitter-context").setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    show_all_context = false,
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
      -- For all filetypes
      -- Note that setting an entry here replaces all other patterns for this entry.
      -- By setting the 'default' entry below, you can control which nodes you want to
      -- appear in the context window.
      default = {
        "function",
        "method",
        "for",
        "while",
        "if",
        "switch",
        "case",
      },

      rust = {
        "loop_expression",
        "impl_item",
      },

      typescript = {
        "class_declaration",
        "abstract_class_declaration",
        "else_clause",
      },
    },
  })
end

return conf
