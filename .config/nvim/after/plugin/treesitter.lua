require 'nvim-treesitter.install'.compilers = { "clang" }

require'nvim-treesitter.configs'.setup {
    ensure_installed = {"dart", "c", "lua", "css", "javascript", "json", "markdown", "typescript"},
    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
