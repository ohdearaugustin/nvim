return
{
  dir = "~/exxilon/cyber-themes/nvim", -- or "you/exxilon.nvim" once it's on GitHub
  lazy = false,
  priority = 1000,
  config = function()
    require("exxilon").setup({
        yank_glitch = true,
        visual = "hazard",          -- "hazard" = yellow selection like the page's ::selection
      })
    vim.cmd.colorscheme("exxilon")
  end,
}
