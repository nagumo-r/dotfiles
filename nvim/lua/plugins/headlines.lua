return {
  {
    "lukas-reineke/headlines.nvim",
    enabled = false,
    ft = { "tex" },
    opts = function(_, opts)
      opts.tex = {
        query = vim.treesitter.query.parse(
          "latex",
          [[
            (generic_command
              command: (command_name) @name
              (#match? @name "^\\\\(section|subsection|subsubsection)$")
            ) @headline
          ]]
        ),
        headline_highlights = { "Headline1" },
      }
    end,
  },
}
