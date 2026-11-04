return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-day",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      on_highlights = function(hl)
        -- cursour colour
        hl.Cursor = { fg = "#1a1b26", bg = "#8AE234" }

        -- heading colors (markdown only)
        hl.Normal = { fg = "#202020", bg = "NONE" }
        local colors = {
          "#e49aa8", -- H1
          "#2ca308", -- H2
          "#faa52a", -- H3
          "#26bd7e", -- H4
          "#b4a0d9", -- H5
          "#a0a0a0", -- H6
        }
        for i, color in ipairs(colors) do
          -- Covers headlines.nvim (LaTeX and older Markdown setups)
          hl["Headline" .. i] = { bg = color, bold = true }
          -- Covers render-markdown.nvim (New LazyVim Markdown default)
          hl["RenderMarkdownH" .. i .. "Bg"] = { bg = color, bold = true }
          -- Covers native Treesitter fallback
          hl["@markup.heading." .. i .. ".markdown"] = { bg = color, bold = true }
        end

        -- line number colors
        for _, grp in ipairs({
          "LineNr",
          "LineNrAbove",
          "LineNrBelow",
          "CursorLineNr",
        }) do
          hl[grp] = { fg = "#527BEB" }
        end
      end,
    },
  },
}
