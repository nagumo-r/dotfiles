-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- show ruff diagnostic when I pause on a line
vim.opt.updatetime = 500

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function(args)
    -- do not show the message on markdown files
    if vim.bo[args.buf].filetype == "markdown" then
      return
    end

    vim.diagnostic.open_float({
      scope = "line",
      focusable = false,
      close_events = {
        "CursorMoved",
        "CursorMovedI",
        "InsertEnter",
        "BufLeave",
      },
    })
  end,
})
