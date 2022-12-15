local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
    code_action_lightbulb = {
        enable = false,
    }
}

