-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("gruvbox").setup({
  palette_overrides = {
    bright_green = "#00C05F",
    bright_red = "#F8928E",
    bright_yellow = "#19D0BA",
    bright_orange = "#F8928E",
    bright_aqua = "#13F1DA",
    bright_blue = "#2879AC",
    blue = "#42477E",
    gray = "#687F8C",
    green = "#F8928E",
  },
  transparent_mode = true,
})

vim.cmd("colorscheme gruvbox")
