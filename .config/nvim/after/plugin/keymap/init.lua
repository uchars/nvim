local Remap = require("nils.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap


nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>u", ":UndotreeToggle<CR>")

nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

inoremap("<C-c>", "<Esc>")
