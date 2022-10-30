require 'nvim-treesitter.install'.compilers = { "clang" }

require'nvim-treesitter.configs'.setup {
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
    },

    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

