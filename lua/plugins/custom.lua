return {

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>gc", false },
      { "<leader>gl", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
    },
  },

  "tpope/vim-fugitive",
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({ mapping = { "jk", "kj" } })
    end,
  },
  "theprimeagen/harpoon",
}
