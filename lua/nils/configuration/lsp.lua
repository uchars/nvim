local conf = {}
local Remap = require("nils.keymap")

local nnoremap = Remap.nnoremap

function conf.lspsaga()
  require("lspsaga").setup({
    lightbulb = {
      enable = false,
    },
  })
end

function conf.trouble()
  require("trouble").setup({
    auto_preview = false,
    auto_fold = true,
  })
end

function conf.lsp_lines()
  require("lsp_lines").setup()
  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { only_current_line = true },
  })
end

function conf.nullls()
  local _, null_ls = pcall(require, "null-ls")
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  null_ls.setup({
    debug = true,
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.dart_format,
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.formatting.rustfmt,
    },
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end,
  })

  vim.api.nvim_create_user_command("DisableLspFormatting", function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end, { nargs = 0 })
end

function conf.lspzero()
  local opts = { buffer = bufnr, remap = false, silent = true }
  vim.g.cmp_buftype_blacklist = { ["<buffer>"] = true }
  local lsp = require("lsp-zero")

  lsp.preset("recommended")
  lsp.ensure_installed({
    "tsserver",
    "marksman",
    "lua_ls",
    "jsonls",
    "cssls",
    "pyright",
  })

  local cmp = require("cmp")

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local cmp_mappings = lsp.defaults.cmp_mappings({
        ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-q>"] = cmp.mapping.complete(),
  })

  lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
  })

  nnoremap("gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  nnoremap("gD", function()
    vim.lsp.buf.definition()
  end, opts)
  nnoremap("gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
  nnoremap("K", "<cmd>Lspsaga hover_doc<CR>", opts)
  nnoremap("<leader>vd", function()
    vim.diagnostic.open_float()
  end, opts)
  nnoremap("[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  nnoremap("]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  nnoremap("[E", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
  end)
  nnoremap("]E", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end)
  nnoremap("<leader>vca", "<cmd>Lspsaga code_action<CR>", opts)
  nnoremap("<leader>gr", "<cmd>Lspsaga rename<CR>", opts)

  require("luasnip.loaders.from_vscode").lazy_load()

  lsp.setup()
end

return conf
