-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(ev)
    vim.keymap.set("n", "gx", function()
      local link = vim.fn.expand("<cfile>")
      local is_url = link:match("^https?://")
      if not is_url and link:lower():match("%.png$") then
        local dir = vim.fn.expand("%:p:h")
        local path = vim.fs.joinpath(dir, vim.uri_decode(link))
        if vim.fn.filereadable(path) == 1 then
          vim.system({ "feh", path })
        else
          vim.notify("画像が見つからへん: " .. path, vim.log.levels.WARN)
        end
      else
        vim.ui.open(link)
      end
    end, { buffer = ev.buf })
  end,
})
