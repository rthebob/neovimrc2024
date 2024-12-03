return {
  "echasnovski/mini.cursorword",
  version = "*",
  config = function()
    require("mini.cursorword").setup({
      -- Delay (in ms) between when cursor moved and when highlighting appeared
      delay = 500,
    })
  end,
}
