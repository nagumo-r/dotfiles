return {
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        providers = {
          path = {
            opts = {
              get_cwd = function()
                return vim.fn.getcwd()
              end,
            },
          },
        },
      },
    },
  },
}
