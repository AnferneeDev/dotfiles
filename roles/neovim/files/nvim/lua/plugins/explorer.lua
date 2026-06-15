return {
  -- Configure Neo-tree to show dotfiles and hidden folders
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- Show filtered items
          hide_dotfiles = false, -- Do not hide dotfiles
          hide_gitignored = false, -- Do not hide gitignored files
        },
      },
    },
  },

  -- Configure Telescope to include hidden files in search
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local telescope = require("telescope")
      opts.defaults = opts.defaults or {}
      opts.defaults.find_command = {
        "rg",
        "--files",
        "--hidden",
        "--glob",
        "!**/.git/*",
      }
      return opts
    end,
  },
}
