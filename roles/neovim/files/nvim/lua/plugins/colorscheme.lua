return {
  -- Add the sonokai colorscheme plugin
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      -- Set the sonokai style to 'atlantis'
      vim.g.sonokai_style = "atlantis"
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_better_performance = 1
    end,
  },

  -- Configure LazyVim to load sonokai as the default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
    },
  },
}
