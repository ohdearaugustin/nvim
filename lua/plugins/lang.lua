return {
  -- overwrite Rust tools inlay hints
  {
    "simrat39/rust-tools.nvim",
    optional = true,
    opts = {
      tools = {
        inlay_hints = {
          -- nvim >= 0.10 has native inlya hint support
          -- so we don't need the rust-rools specific implementation any longer
          auto = not vim.fn.has("nvim-0.10"),
        },
      },
    },
  },
}
