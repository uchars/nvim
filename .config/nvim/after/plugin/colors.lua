vim.g.nils_colorscheme = "gruvbox"

function ApplyColors() 
    vim.cmd("colorscheme " .. vim.g.nils_colorscheme)
end
ApplyColors()
