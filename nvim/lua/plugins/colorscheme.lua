return {
  {
    "sainnhe/sonokai",
    priority = 100,
    config = function()
      -- Sonokai configuration
      vim.g.sonokai_transparent_background = "1"
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_style = "andromeda"
      vim.g.sonokai_diagnostic_text_highlight = 1
      vim.g.sonokai_diagnostic_virtual_text = "colored"

      -- Define the palette (you may need to adjust these colors for the "andromeda" style)
      local CustomColors = {
        pink = { "#F5A9B8", "232" },
      }

      -- Function to apply custom highlights
      local function apply_custom_highlights()
        -- Add type annotations for Lua Language Server
        ---@type table
        local config = vim.fn["sonokai#get_configuration"]()
        ---@type table
        local palette = vim.fn["sonokai#get_palette"](config.style, config.colors_override)
        ---@type function
        local set_hl = vim.fn["sonokai#highlight"]

        -- Apply custom highlights
        set_hl("DashboardHeader", CustomColors.pink, palette.none) -- Changed background to none
        set_hl("DashboardFooter", palette.blue, palette.none) -- Changed background to none
        -- Ensure highlights are applied immediately
        vim.cmd("redraw")
      end

      -- Set the colorscheme
      vim.cmd.colorscheme("sonokai")

      -- Apply custom highlights after setting the colorscheme
      apply_custom_highlights()

      -- Create an autocmd to reapply highlights if the colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("custom_highlights_sonokai", {}),
        pattern = "sonokai",
        callback = apply_custom_highlights,
      })
    end,
  },
}
