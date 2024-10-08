return {
  {
    "sainnhe/sonokai",
    priority = 100,
    config = function()
      vim.g.sonokai_transparent_background = "1"
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_style = "andromeda"
      vim.cmd.colorscheme("sonokai")
      vim.g.sonokai_diagnostic_text_highlight = 1
      vim.g.sonokai_diagnostic_virtual_text = "colored"
    end,
  },
}
