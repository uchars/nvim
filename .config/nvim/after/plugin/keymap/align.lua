local Remap = require("nils.keymap")
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nmap("ga", ":EasyAlign<CR>")
xnoremap("ga", ":EasyAlign<CR>")
