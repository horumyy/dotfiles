return {
  "L3MON4D3/LuaSnip",
  keys = function()
    return {}
  end,
  config = function()
    -- This will ensure LuaSnip completions appear after LSP completions
    require("cmp").setup({
      sorting = {
        priority_weight = 2,
        comparators = {
          require("cmp").config.compare.offset,
          require("cmp").config.compare.exact,
          require("cmp").config.compare.score,
          require("cmp").config.compare.kind,
          require("cmp").config.compare.sort_text,
          require("cmp").config.compare.length,
          require("cmp").config.compare.order,
        },
      },
      sources = {
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        -- Add other sources with lower priorities
      },
    })
  end,
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
}
