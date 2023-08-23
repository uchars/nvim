local conf = {}

function conf.treesitter()
  require("nvim-treesitter.install").compilers = { "clang" }

  require("nvim-treesitter.configs").setup({
    rainbow = {
      enable = true,
    },
    ensure_installed = {
      -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
      "c",
      "lua",
      "css",
      "diff",
      "dockerfile",
      "cpp",
      "html",
      "javascript",
      "json",
      "jsonc",
      "json5",
      "markdown",
      "markdown_inline",
      "python",
      "rust",
      "scss",
      "sql",
      "tsx",
      "typescript",
      "vim",
      "go",
      "gitignore",
      "arduino",
      "make",
      "jsdoc",
      "regex",
      "yaml",
    },
    autotag = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = {},
    },
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    playground = {
      enable = true,
    },
  })
end

function conf.autotag()
  require("nvim-ts-autotag").setup()
end

function conf.treesittercontext()
  require("treesitter-context").setup({
    enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
    show_all_context = false,
    patterns = {
      -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
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
