return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      checkbox = {
        enabled = true,
        unchecked = { icon = "☐" },
        checked = { icon = "☑ " },
        custom = {
          cancelled = {
            raw = "[~]",
            rendered = "✗ ",
            highlight = "Comment",
          },
          forwarded = {
            raw = "[>]",
            rendered = "→ ",
            highlight = "DiagnosticInfo",
          },
        },
      },
    },
  },
}
