return {
  -- The OpenCode plugin
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    dependencies = {
      "folke/snacks.nvim", -- Dependency for UI inputs/panels
    },
    config = function()
      -- Autoread files when updated outside editor
      vim.o.autoread = true

      -- Keymaps for OpenCode
      -- Ask: Send prompt to the AI agent (leader + o + a)
      vim.keymap.set({ "n", "x" }, "<leader>oa", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "OpenCode: Ask (context-aware)" })

      -- Action Select: Select an operation or action (leader + o + x)
      vim.keymap.set({ "n", "x" }, "<leader>ox", function()
        require("opencode").select()
      end, { desc = "OpenCode: Action Select" })

      -- Toggle: Open/Close the OpenCode sidebar (leader + o + t)
      vim.keymap.set({ "n", "t" }, "<leader>ot", function()
        require("opencode").toggle()
      end, { desc = "OpenCode: Toggle Sidebar" })
    end,
  },
}
