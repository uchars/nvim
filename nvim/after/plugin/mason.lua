local s1, mason = pcall(require, "mason")
if not s1 then
    print("mason not installed")
    return
end

local s2, lspconfig = pcall(require, "mason-lspconfig")
if not s2 then
    print("mason-lspconfig not installed")
    return
end

mason.setup({})

lspconfig.setup{
    automatic_installation = true
}

