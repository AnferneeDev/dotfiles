return {
  -- Configure Neo-tree to show dotfiles and gitignored files by extending default opts
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem = opts.filesystem or {}
      opts.filesystem.filtered_items = opts.filesystem.filtered_items or {}
      
      -- Set visibility and ensure nothing is hidden
      opts.filesystem.filtered_items.visible = true
      opts.filesystem.filtered_items.hide_dotfiles = false
      opts.filesystem.filtered_items.hide_gitignored = false
      opts.filesystem.filtered_items.hide_hidden = false
      
      return opts
    end,
  },
}
