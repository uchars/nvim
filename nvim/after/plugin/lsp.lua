local Remap = require("nils.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local status1, lsp = pcall(require, "lsp-zero")
if not status1 then
    print("lsp-zero not installed")
    return
end

lsp.preset("recommended")
lsp.ensure_installed({
    "tsserver",
})


local status2, cmp = pcall(require, "cmp")
if not status2 then
    print("cmp not installed")
    return
end

local status3, lspsaga = pcall(require, "lspsaga")
if not status3 then
    print("lspsaga not installed")
    return
end

local has_flutter_tools = pcall(require, "flutter-tools")
if not has_flutter_tools then
  print("flutter-tools not installed")
  return
end

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
        end, { "i", "s" }
    ),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
            fallback()
          end
        end, { "i", "s" }
    ),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

-- Keymaps for LSP buffers
lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false, silent = true}

    nnoremap("gd", function() vim.lsp.buf.definition() end, opts)
    nnoremap("gi", function() vim.lsp.buf.implementation() end, opts)
    nnoremap("K", function() vim.lsp.buf.hover() end, opts)
    nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    nnoremap("<leader>vd", function() vim.diagnostic.open_float() end, opts)
    nnoremap("]d", function() vim.diagnostic.goto_next() end, opts)
    nnoremap("[d", function() vim.diagnostic.goto_prev() end, opts)
    nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    nnoremap("<leader>vrr", function() vim.lsp.buf.references() end, opts)
    nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    inoremap("<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    nnoremap("<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    nnoremap("K", "<Cmd>Lspsaga hover_doc<CR>", opts)
    nnoremap("gD", "<Cmd>Lspsaga lsp_finder<CR>", opts)
    nnoremap("gr", "<Cmd>Lspsaga rename<CR>", opts)
    nnoremap("<leader>vca", "<Cmd>Lspsaga code_action<CR>", opts)
end)

-- Flutter
require("flutter-tools").setup({
    closing_tags = {
        enabled = true,
        prefix = ">",
    },

    lsp = {
        color = {
            enabled = true,
            background = false,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
        },

        on_attach = custom_attach,

        settings = {
            showTodos = false,
        }
    }
})

lspsaga.init_lsp_saga({
    code_action_lightbulb = {
        enable = false,
    }
})

lsp.setup()
