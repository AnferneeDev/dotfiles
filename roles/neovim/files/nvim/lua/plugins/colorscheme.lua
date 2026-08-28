-- THEME: Neon Pink Slate, matching the OpenCode and Windows Terminal theme

return {
  -- Add the neon-pink/slate colorscheme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "main",
        dark_variant = "main",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        palette = {
          main = {
            base = "#2f3943",
            surface = "#35404b",
            overlay = "#3d4854",
            muted = "#9aa3ad",
            subtle = "#c8cfd6",
            text = "#edf0f3",
            love = "#ff3b5c",
            gold = "#ffd400",
            rose = "#ff2b7a",
            pine = "#67d98f",
            foam = "#ff7aac",
            iris = "#ff0066",
            highlightLow = "#35404b",
            highlightMed = "#46515d",
            highlightHigh = "#596573",
          },
        },
        highlight_groups = {
          Normal = { bg = "#2f3943" },
          NormalNC = { bg = "#2f3943" },
          SignColumn = { bg = "#2f3943" },
          StatusLine = { bg = "#35404b" },
          Folded = { bg = "#35404b" },
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
