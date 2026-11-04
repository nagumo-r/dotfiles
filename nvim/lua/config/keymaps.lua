-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-------------------------------------------------------------------------------------------------
-- this is for obsidian.
-- this shortcut saves the image from the clipboard into the ./image (relative path) and add the wikilink of the image (e.g. [[saved_image.png]])
-- it essentially saves the image on the clipboard into cdrive, send the file to wsl using stdout, then move the image to ./image
-------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>ip", function()
  require("config.paste_image").paste_image()
end, { desc = "Paste clipboard image to ./image" })

-------------------------------------------------------------------------------------------------
------------- this is to insert today's date---------------------------------------------
-------------------------------------------------------------------------------------------------
-- the string|ostime to string error can be ignored.
vim.keymap.set("n", "<leader>id", function()
  vim.api.nvim_put({ os.date("%Y-%m-%d") }, "c", true, true)
end, { desc = "Insert today's date" })

vim.keymap.set("n", "gx", function()
  local url = vim.fn.expand("<cfile>")

  if url:match("^https?://") then
    vim.fn.jobstart({ "firefox", url }, { detach = true })
  else
    vim.ui.open(url)
  end
end, { desc = "Open URL in Linux Firefox" })

-------------------------------------------------------------------------------------------------
----------- this is to put the cursor on top of the first letter of the line when jumped with jk
-------------------------------------------------------------------------------------------------
for _, key in ipairs({ "j", "k" }) do
  vim.keymap.set("n", key, function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local first = line:find("%S")

    -- only applies when the cursor is at the empty or the first letter of the current line
    if not first or col <= first - 1 then
      return key .. "^"
    end

    return key
  end, {
    expr = true,
    desc = "Move vertically, following indentation at line start",
  })
end
