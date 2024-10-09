return {
  {
    "sainnhe/sonokai",
    priority = 1000,
    config = function()
      -- Basic settings
      vim.g.sonokai_transparent_background = 2
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_style = "andromeda"
      vim.g.sonokai_diagnostic_text_highlight = 1
      vim.g.sonokai_diagnostic_virtual_text = "colored"

      -- Override only the specific colors we want to change while keeping the theme's structure
      vim.g.sonokai_colors_override = {
        red = { "#FB3778", "203" },
        green = { "#fb6fa9", "203" },
        yellow = { "#ffb3d2", "217" },
        blue = { "#9ac5ff", "117" },
        magenta = { "#fb6fa9", "203" },
        cyan = { "#b6d9ff", "117" },
        fg = { "#ffffff", "246" },
        gray = { "#4f5472", "237" },
        orange = { "#B6D9FF", "232" },
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
        set_hl("DashboardHeader", palette.cyan, palette.none) -- Changed background to none
        -- Ensure highlights are applied immediately
        vim.cmd("redraw")
      end
      -- Set the colorscheme
      vim.cmd.colorscheme("sonokai")

      apply_custom_highlights()
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("custom_highlights_sonokai", {}),
        pattern = "sonokai",
        callback = apply_custom_highlights,
      })
    end,
  },
}
