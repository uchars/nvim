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
    -- Essentials (for other plugins)
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("tpope/vim-commentary")

    -- LSP
    use({"neovim/nvim-lspconfig",
        -- Install LSP's
        run = "npm install -g pyright typescript typescript-language-server svelte-language-server vscode-langservers-extracted"
    })
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use({"folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
        require("trouble").setup {
            auto_fold = true,
        }
        end
    })

    -- Versioning
    use("ThePrimeagen/git-worktree.nvim")
    use("mbbill/undotree")
    use("TimUntersberger/neogit")

    -- Movement
    use("ThePrimeagen/harpoon")
    use("simrat39/symbols-outline.nvim")
    use("nvim-telescope/telescope.nvim")
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use("farmergreg/vim-lastplace")

    -- Colorscheme & Visual stuff
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")
    use({"folke/zen-mode.nvim", config = function()
        require("zen-mode").setup {}
    end
    })
    use({'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })

    -- Treesitter
    use({"nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    })
    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")

    -- Debugging
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")

    -- Formatting
    use("godlygeek/tabular")
    use("sbdchd/neoformat")

    -- Language Specific
    use({
      "akinsho/flutter-tools.nvim",
      requires = "nvim-lua/plenary.nvim",
      -- ft = {"flutter", "dart"},
    })
    use({"iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use("jose-elias-alvarez/typescript.nvim")

    if packer_bootstrap then
        require('packer').sync()
    end
end)

