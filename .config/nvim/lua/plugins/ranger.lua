return {
  "kelly-lin/ranger.nvim",
  config = function()
    require("ranger-nvim").setup({
      enable_cmds = false,
      replace_netrw = false,
      ui = {
        border = "rounded",
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,
      },
    })
    vim.api.nvim_set_keymap("n", "<leader>e", "ranger", {
      desc = "Ranger",
      noremap = true,
      callback = function()
        require("ranger-nvim").open(true)
      end,
    })
  end,
}
