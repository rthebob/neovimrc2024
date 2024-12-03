return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      blue = "#65D1FF",
      green = "#3EFFDC",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
      red = "#FF4A4A",
      fg = "#c3ccdc",
      bg = "#112638",
      inactive_bg = "#2c3043",
      branch_fg = "#C8AE6E",
      branch_bg = "#2c3043",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }
    -- Function to determine the filename path display
    local function filename()
      local win_count = #vim.api.nvim_tabpage_list_wins(0)
      if win_count > 1 then
        return "%t" -- Just the filename
      else
        return "%f" -- Full relative path
      end
    end

    -- Function to determine when to show the lualine_x section
    local function show_lualine_x()
      return #vim.api.nvim_tabpage_list_wins(0) == 1
    end

    -- Configure lualine with the modified theme and filename function
    lualine.setup({
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_b = {
          {
            "branch",
            color = { fg = colors.branch_fg, gui = "bold" },
          },
          "diagnostics",
        },
        lualine_c = {
          filename,
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = function()
              return lazy_status.has_updates() and show_lualine_x()
            end,
            color = { fg = "#ff9e64" },
          },
          { "encoding", cond = show_lualine_x },
          { "fileformat", cond = show_lualine_x },
          { "filetype", cond = show_lualine_x },
        },
      },
    })
  end,
}
