return {
  -- custime neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        group_empty_dirs = true,
      },
    },
  },
  -- git blame
  {
    "f-person/git-blame.nvim",
    event = "BufReadPre",
  },
  -- git conflict
  {
    "akinsho/git-conflict.nvim",
    event = "BufReadPre",
    opts = {},
  },
}
