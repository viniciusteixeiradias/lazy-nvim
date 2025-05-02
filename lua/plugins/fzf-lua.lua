return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({
      { "telescope" },
      winopts = {
        height = 0.85,
        width = 0.80,
      },
      files = {
        git_icons = true,
        file_icons = true,
        color_icons = true,
        fd_opts = "--hidden --exclude .git",
        cwd_prompt = false,
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", fzf.files, { noremap = true, desc = "Find files including hidden ones" })
    vim.keymap.set("n", "<leader>fw", fzf.live_grep, { desc = "Find string in cwd" })
    vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Find help tags" })
    vim.keymap.set("n", "<leader>fg", fzf.git_status, { desc = "Git status and diff preview" })
  end,
}
