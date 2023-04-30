local conf = {}
local Remap = require("nils.keymap")

local nnoremap = Remap.nnoremap

local lspkind_icons = {
  Namespace = "",
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
  Table = "",
  Object = "",
  Tag = "",
  Array = "[]",
  Boolean = "",
  Number = "",
  Null = "ﳠ",
  String = "",
  Calendar = "",
  Watch = "",
  Package = "",
  Copilot = "",
}

function conf.lspsaga()
  require("lspsaga").setup({
    lightbulb = {
      enable = false,
    },
    diagnostic = {
      on_insert = false,
      show_code_action = false,
    },
    outline = {
      auto_preview = true,
      keys = {
        expand_or_jump = "<CR>",
      },
    },
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
      null_ls.builtins.formatting.sql_formatter,
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
  local has_words_before = function()
    ---@diagnostic disable-next-line: deprecated
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

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
    "dockerls",
    "vimls",
  })

  local cmp = require("cmp")
  local cmp_select = { behavior = cmp.SelectBehavior.Select }

  local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item(cmp_select)
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(cmp_select)
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

  lsp.set_sign_icons({
    error = "",
    warn = "",
    hint = "",
    info = "",
  })

  local opts = { remap = false, silent = true }

  nnoremap("gD", function()
    vim.lsp.buf.declaration()
  end, opts)
  nnoremap("gd", function()
    vim.lsp.buf.definition()
  end, opts)
  nnoremap("gi", function()
    vim.lsp.buf.implementation()
  end, opts)
  nnoremap("K", function()
    vim.lsp.buf.hover()
  end, opts)
  nnoremap("<leader>vd", function()
    vim.diagnostic.open_float({ border = "rounded" })
  end, opts)
  nnoremap("[e", function()
    vim.diagnostic.goto_prev({
      float = false,
    })
  end, opts)
  nnoremap("]e", function()
    vim.diagnostic.goto_next({
      float = false,
    })
  end, opts)
  nnoremap("[E", function()
    vim.diagnostic.goto_prev({
      severity = vim.diagnostic.severity.ERROR,
      float = false,
    })
  end)
  nnoremap("]E", function()
    vim.diagnostic.goto_next({
      severity = vim.diagnostic.severity.ERROR,
      float = false,
    })
  end)
  nnoremap("<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  nnoremap("<leader>vca", "<cmd>Lspsaga code_action<CR>", opts)
  nnoremap("<leader>gr", "<cmd>Lspsaga rename<CR>", opts)

  require("luasnip.loaders.from_vscode").lazy_load()

  require("lspconfig").lua_ls.setup({
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  })

  lsp.setup()

  cmp.setup({
    mapping = cmp_mappings,
    formatting = {
      format = function(_, item)
        local icon = lspkind_icons[item.kind] or ""

        icon = " " .. icon .. " " .. item.kind .. " "
        item.menu = lspkind_icons.text
        item.kind = icon

        return item
      end,
    },
    window = {
      completion = cmp.config.window.bordered({
        scrollbar = false,
      }),
      documentation = cmp.config.window.bordered({
        scrollbar = false,
      }),
    },
  })

  vim.diagnostic.config({
    signs = true,
    severity_sort = true,
    float = false,
    virtual_text = true,
  })
end

return conf
