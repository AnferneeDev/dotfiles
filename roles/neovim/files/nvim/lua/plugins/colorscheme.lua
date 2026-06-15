return {
  -- Add the rose-pine colorscheme plugin
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "dawn", -- set to dawn variant
        dark_variant = "main",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        palette = {
          dawn = {
            gold = "#a67500",
            foam = "#205798",
            iris = "#7a4b85",
            rose = "#025763",
          },
        },
        highlight_groups = {
          Normal = { bg = "#f5e6eb" },
          NormalNC = { bg = "#f5e6eb" },
          SignColumn = { bg = "#f5e6eb" },
          StatusLine = { bg = "#faf4ed" }, -- keep statusline slightly different for contrast
          Folded = { bg = "#faf4ed" },
        },
      })
    end,
  },

  -- Configure LazyVim to load rose-pine as the default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
