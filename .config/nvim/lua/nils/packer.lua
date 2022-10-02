return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    -- Essentials
    use("farmergreg/vim-lastplace")
    use("nvim-lua/plenary.nvim")
    use("tpope/vim-surround")
    use("tpope/vim-commentary")
    use('iamcco/markdown-preview.nvim', {
        run = function() vim.fn["mkdp#util#install"]() end
    })

    -- Colorschemes & Style
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")
    use("nvim-lualine/lualine.nvim", {requires = {"kyazdani42/nvim-web-devicons"}, opt = true})

    -- Formatting
    use("sbdchd/neoformat")
    use("junegunn/vim-easy-align")

    -- Versioning
    use("mbbill/undotree")
    use("airblade/vim-gitgutter")
    use("rhysd/git-messenger.vim")
    use("tpope/vim-fugitive")

    -- Navigation
    use("nvim-telescope/telescope.nvim")
    use("romgrk/nvim-treesitter-context")

    -- File syntax
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    -- Autocomplete (LSP)
    use("neoclide/coc.nvim", {branch="release"})
end)

