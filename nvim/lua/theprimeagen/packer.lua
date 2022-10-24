local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function()
    -- TJ created lodash of neovim
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")

    use("wbthomason/packer.nvim")
    use("sbdchd/neoformat")

    use("tpope/vim-commentary")
    use("farmergreg/vim-lastplace")
    use({
        run = function() vim.fn["mkdp#util#install"]() end,
        "iamcco/markdown-preview.nvim",
    })
    use({"folke/zen-mode.nvim", config = function()
        require("zen-mode").setup {}
    end
    })
    use({"folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
        require("trouble").setup {
            auto_fold = true,
        }
        end
    })

    use {
      "akinsho/flutter-tools.nvim",
      requires = "nvim-lua/plenary.nvim",
      -- ft = {"flutter", "dart"},
    }

    -- Simple plugins can be specified as strings
    use("TimUntersberger/neogit")

    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })

    -- All the things
    use("neovim/nvim-lspconfig", {
        -- Install LSP's
        run = "npm install -g pyright typescript typescript-language-server svelte-language-server vscode-langservers-extracted"}
    )
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    -- Primeagen doesn't create lodash
    use("ThePrimeagen/git-worktree.nvim")
    use("ThePrimeagen/harpoon")

    use("mbbill/undotree")

    -- Colorscheme section
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")

    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")
end)

