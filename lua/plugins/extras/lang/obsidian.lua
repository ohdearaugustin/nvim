-- https://github.com/epwalsh/obsidian.nvim
return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "MyBrain",
        path = "~/MyBrain",
      },
    },
    daily_notes = {
      folder = "dailies",
      data_format = "%Y-%m-%d",
      template = nil,
    },
  },
}
