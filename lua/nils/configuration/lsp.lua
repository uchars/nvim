local conf = {}
local Remap = require("nils.keymap")

local nnoremap = Remap.nnoremap

function conf.trouble()
  require("trouble").setup({
    auto_preview = false,
    auto_fold = true,
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
  nnoremap("gd", function()
    vim.lsp.buf.definition()
  end, opts)
  nnoremap("gi", function()
    vim.lsp.buf.implementation()
  end, opts)
  nnoremap("<leader>vws", function()
    vim.lsp.buf.workspace_symbol()
  end, opts)

  local status1, lsp = pcall(require, "lsp-zero")
  if not status1 then
    print("lsp-zero not installed")
    return
  end

  lsp.preset("recommended")
  lsp.ensure_installed({
    "tsserver",
    "marksman",
    "lua_ls",
    "jsonls",
    "cssls",
    "pyright",
  })

  local status2, cmp = pcall(require, "cmp")
  if not status2 then
    print("cmp not installed")
    return
  end

  local has_flutter_tools = pcall(require, "flutter-tools")
  if not has_flutter_tools then
    print("flutter-tools not installed")
    return
  end

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local cmp_select = { behavior = cmp.SelectBehavior.Select }
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
    ["<C-u>"] = cmp.mapping.scroll_docs( -4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-q>"] = cmp.mapping.complete(),
  })

  lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
  })

  -- Flutter
  require("flutter-tools").setup({
    closing_tags = {
      enabled = true,
      prefix = ">",
    },
    dev_log = {
      enabled = true,
      open_cmd = "tabedit",
    },
    lsp = {
      settings = {
        showTodos = false,
      },
    },
  })

  nnoremap("gd", function()
    vim.lsp.buf.definition()
  end, opts)
  nnoremap("<leader>vr", function()
    vim.lsp.buf.references()
  end, opts)
  nnoremap("K", function()
    vim.lsp.buf.hover()
  end, opts)
  nnoremap("<leader>vd", function()
    vim.diagnostic.open_float()
  end, opts)
  nnoremap("[e", function()
    vim.diagnostic.goto_prev()
  end, opts)
  nnoremap("]e", function()
    vim.diagnostic.goto_next()
  end, opts)
  nnoremap("[E", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
  end)
  nnoremap("]E", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end)
  nnoremap("<leader>vca", function()
    vim.lsp.buf.code_action()
  end, opts)
  nnoremap("<leader>gr", function()
    vim.lsp.buf.rename()
  end, opts)

  lsp.setup()
end

return conf
