return {
  {
    -- "nosduco/remote-sshfs.nvim",
    dir = "/home/augustin/programming/remote-sshfs.nvim/",
    dependencies = { "nvim-telescope/telescope.nvim" },
    lazy = false,
    opts = {
      ui = {
        select_prompts = false, -- not yet implemented
        confirm = {
          connect = false,
        },
      },
      log = {
        enable = true,
        types = {
          all = true,
        },
      },
    },
    -- config = function(_, opts)
    --   require("remote-sshfs").setup(opts)
    --   require("telescope").load_extension("remote-sshfs")
    -- end,
  },
}
