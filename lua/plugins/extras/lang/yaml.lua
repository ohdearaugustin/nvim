return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      settings = {
        yaml = {
          format = {
            enable = false,
            bracketSpacing = false,
          },
        },
      },
    },
  },
}
