return {
  "TobinPalmer/rayso.nvim",
  config = function()
    require("rayso").setup({
      open_cmd = "chromium",
      options = {
        theme = "candy",
      },
    })
    vim.keymap.set("v", "<leader>rs", require("lib.create").create_snippet)
  end,
}
