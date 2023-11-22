-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Set the mapleader to a space character for key mappings that use <leader>.
vim.g.mapleader = " "

-- Define a key mapping in normal mode (<leader>pv) to execute an Ex command.
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Create key mappings for moving selected text down and up in visual mode.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join the current line with the line below in normal mode (J).
vim.keymap.set("n", "J", "mzJ`z")

-- Search and replace the word under the cursor with itself in normal mode.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Edit the Packer.nvim configuration file in normal mode.
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/plugins/example.lua<CR>")

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
  -- Reload the current script in normal mode.
end)

-- local function replace_all()
--   -- Get user input for search pattern and new value
--   local search_pattern = vim.fn.input("Enter search pattern: ")
--   local new_value = vim.fn.input("Type the new value: ")
--
--   -- Use vimgrep to get a list of files containing the search pattern
--   local files = vim.fn.split(vim.fn.systemlist("vimgrep /" .. search_pattern .. "/j **/*"), "\n")
--
--   -- Iterate over the files and perform the replacement
--   for _, file in ipairs(files) do
--     vim.api.nvim_command("edit " .. file)
--     vim.api.nvim_buf_set_option(0, "modifiable", true)
--     vim.api.nvim_buf_set_option(0, "buftype", "")
--     vim.api.nvim_buf_set_option(0, "swapfile", false)
--
--     -- Perform the replacement using the substitute command
--     vim.api.nvim_command(
--       ":%s/" .. vim.fn.escape(search_pattern, "/") .. "/" .. vim.fn.escape(new_value, "/") .. "/g | update"
--     )
--
--     vim.api.nvim_buf_set_option(0, "modifiable", false)
--   end
-- end
--
-- vim.keymap.set("n", "<leader>ra", replace_all, {})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set(
  "n",
  "<leader>pf",
  "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
  { noremap = true }
)
vim.keymap.set("n", "<leader>pw", builtin.live_grep, {})
vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
vim.keymap.set("n", "<leader>pt", builtin.help_tags, {})
