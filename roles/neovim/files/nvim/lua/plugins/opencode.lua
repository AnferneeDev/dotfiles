return {
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    dependencies = {
      "folke/snacks.nvim",
    },
    config = function()
      vim.o.autoread = true

      vim.keymap.set({ "n", "x" }, "<leader>oa", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "OpenCode: Ask (context-aware)" })

      vim.keymap.set({ "n", "x" }, "<leader>ox", function()
        require("opencode").select()
      end, { desc = "OpenCode: Action Select" })

      vim.keymap.set({ "n", "t" }, "<leader>ot", function()
        require("opencode").toggle()
      end, { desc = "OpenCode: Toggle Sidebar" })
    end,
  },
}
