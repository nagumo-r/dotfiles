return {
  {
    "L3MON4D3/LuaSnip",
    opts = {},
    config = function(_, opts)
      local ls = require("luasnip")
      ls.setup(opts)

      local s = ls.snippet
      local t = ls.text_node

      ls.add_snippets("tex", {
        s("lstmb", {
          t("$\\mathrm{LSTM}^{\\mathrm{bl}}_{N}$"),
        }),
        s("lstmft", {
          t("$\\mathrm{LSTM}^{\\mathrm{ft}}_{N}$"),
        }),
        s("lstmr", {
          t("$\\mathrm{LSTM}^{\\mathrm{reg}}_{N}$"),
        }),
      })
    end,
  },

  {
    "saghen/blink.cmp",
    opts = {
      snippets = {
        preset = "luasnip",
      },
    },
  },
}
