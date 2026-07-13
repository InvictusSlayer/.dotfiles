return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
    config = function ()
        require("toggleterm").setup({
            open_mapping = [[<c-;>]],
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = false,
            size = 22,
        })
    end,
}
