return {
    "akinsho/toggleterm.nvim",
    config = function ()
        require("toggleterm").setup({
            open_mapping = "<C-;>",
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = false,
            size = vim.o.lines * 0.6,
            float_opts = {
                border = "curved",
                --width = 0.8,
                --height = 0.8,
            }
        })
        -- vim.api.nvim_set_keymap("n", "<CS-;>", "<C-;>", {
        --     callback = function ()
        --         
        --     end
        -- })

        local Terminal = require("toggleterm.terminal").Terminal
        vim.api.nvim_set_keymap("n", "<leader>g", "", {
            desc = "Git",
            noremap = true,
            silent = true,
            callback = function ()
                Terminal:new({
                    cmd = "lazygit; exit",
                    dir = "git_dir",
                    direction = "float",
                    persist_mode = false,
                }):toggle()
            end,
        })
    end,
}
