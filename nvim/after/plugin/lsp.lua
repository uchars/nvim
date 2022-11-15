local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    print("lspconfig not installed")
    return
end

local has_flutter_tools = pcall(require, "flutter-tools")
if not has_flutter_tools then
  print("flutter-tools not installed")
  return
end

local Remap = require("nils.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	path = "[Path]",
}
local lspkind = require("lspkind")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
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
	}),

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			vim_item.menu = menu
			return vim_item
		end,
	},

	sources = {
		{ name = "nvim_lsp" },

		-- For luasnip user.
		{ name = "luasnip" },

		{ name = "buffer" },

	},
})

local custom_attach = function(client)
-- local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			nnoremap("gd", function() vim.lsp.buf.definition() end)
			nnoremap("gi", function() vim.lsp.buf.implementation() end)
			nnoremap("K", function() vim.lsp.buf.hover() end)
			nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
			nnoremap("]d", function() vim.diagnostic.goto_next() end)
			nnoremap("[d", function() vim.diagnostic.goto_prev() end)
			nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
			nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
                filter = function(code_action)
                    if not code_action or not code_action.data then
                        return false
                    end

                    local data = code_action.data.id
                    return string.sub(data, #data - 1, #data) == ":0"
                end,
                apply = true
            }) end)
			nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
			nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
			inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end

-- C languages
lspconfig.clangd.setup({on_attach = custom_attach})

-- C#
lspconfig.csharp_ls.setup({on_attach = custom_attach})

-- Python LSP
lspconfig.pylsp.setup({on_attach = custom_attach})

-- Type- & Javascript LSP
lspconfig.tsserver.setup({on_attach = custom_attach})

-- Angular
lspconfig.angularls.setup({on_attach = custom_attach})

-- JSON
lspconfig.jsonls.setup({on_attach = on_attach})

-- eslint
lspconfig.eslint.setup({on_attach = on_attach})

-- (S)CSS LSP
lspconfig.cssls.setup({on_attach = custom_attach})

-- HTML
lspconfig.html.setup({on_attach = custom_attach})

-- Docker
lspconfig.dockerls.setup({on_attach = custom_attach})

-- Go
lspconfig.gopls.setup({on_attach = custom_attach})

-- CMake
lspconfig.cmake.setup({on_attach = custom_attach})

-- Bash
lspconfig.bashls.setup({on_attach = custom_attach})

-- Ruby
lspconfig.solargraph.setup({on_attach = custom_attach})

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

local opts = {
	-- whether to highlight the currently hovered symbol
	-- disable if your cpu usage is higher than you want it
	-- or you just hate the highlight
	-- default: true
	highlight_hovered_item = true,

	-- whether to show outline guides
	-- default: true
	show_guides = true,
}

require("symbols-outline").setup(opts)

local snippets_paths = function()
	local plugins = { "friendly-snippets" }
	local paths = {}
	local path
	local root_path = vim.env.HOME .. "/.vim/plugged/"
	for _, plug in ipairs(plugins) do
		path = root_path .. plug
		if vim.fn.isdirectory(path) ~= 0 then
			table.insert(paths, path)
		end
	end
	return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
	paths = snippets_paths(),
	include = nil, -- Load all languages
	exclude = {},
})

