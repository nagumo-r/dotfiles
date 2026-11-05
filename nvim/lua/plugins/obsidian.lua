return {
  {
    "obsidian-nvim/obsidian.nvim",
    cmd = { "Obsidian" },
    version = "*",
    ft = "markdown",
    opts = {
      legacy_commands = false,
      templates = {
        folder = "template",
        --/homE/rnagumo/obs/template/Daily_note_template.md
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },
      -- WORKSPACES ----------------------------------------------------
      workspaces = {
        {
          name = "personal",
          path = "/home/rnagumo/obs_temp",
          --strict = true,
        },
        {
          name = "personal_windows",
          path = "/mnt/c/Users/td24442/Obsidian",
        },
        --------------------------------------------------------
      },
      picker = {
        name = "snacks.picker",
      },
      daily_notes = {
        folder = "DailyNotes",
        date_format = "%Y-%m-%d",
        template = "Daily_note_template.md",
      },
      completion = {
        -- Tells the engine to wait until you type 2 characters before searching
        min_chars = 2,
      },
      checkbox = {
        order = { " ", "x", ">", "~" },
        create_new = true,
      },
      attachments = {
        folder = "attachments",
      },
      ----- use Obsidian app in linux to run :obs open ---------------------
      open = {
        func = function(uri)
          vim.fn.jobstart({
            "/usr/local/bin/obsidian",
            uri,
          }, { detach = true })
        end,
      },
    },
  },
}
