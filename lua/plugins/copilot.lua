return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = true, auto_trigger = true, debounce = 75, keymap = { accept = false } },
      panel = { enabled = false },
    })

    vim.keymap.set("i", "<Tab>", function()
      local suggestion = require("copilot.suggestion")
      if suggestion.is_visible() then
        suggestion.accept()
      else
        return "<Tab>"
      end
    end, { expr = true, silent = true, noremap = true })
  end,
}

