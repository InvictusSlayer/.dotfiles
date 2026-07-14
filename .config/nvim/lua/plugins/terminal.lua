return {
    "akinsho/toggleterm.nvim",
    config = function ()
        require("toggleterm").setup({
            open_mapping = [[<C-;>]],
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = false,
            size = 22,
            float_opts = {
                border = "curved",
                --width = 0.8,
                --height = 0.8,
            }
        })

        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            direction = "float",
            hidden = true,
        })
        vim.api.nvim_set_keymap("n", "<leader>g", "", {
            desc = "Git",
            noremap = true,
            silent = true,
            callback = function ()
                lazygit:toggle()
            end,
        })
    end,
}
