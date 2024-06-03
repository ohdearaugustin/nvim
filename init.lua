-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")({
  debug = true,
  defaults = {
    lazy = false,
  },
  nv = {
    colorscheme = "tokyonight",
    codeium_support = false, -- enable codeium extension
    copilot_support = false, -- enable copilot extension
    coverage_support = true, -- enable coverage extension
    dap_support = true, -- enable dap extension
    lsp = {
      neoconf = true,
    },
    lang = {
      ansible = true,
      clangd = false, -- enable clangd and cmake extension
      docker = false, -- enable docker extension
      elixir = false, -- enable elixir extension
      go = true, -- enable go extension
      java = false, -- enable java extension
      nodejs = true, -- enable nodejs (typescript, css, html, json) extension
      python = true, -- enable python extension
      ruby = false, -- enable ruby extension
      rust = true, -- enable rust extension
      terraform = false, -- enable terraform extension
      tex = false, -- enable tex extension
      yaml = true, -- enable yaml extension
      obsidian = true,
      markdown = true,
    },
    rest_support = true, -- enable rest.nvim extension
    test_support = true, -- enable test extension
    util = {
      taskwarrior = true, -- enable taskwarrior extension
      windowpicker = true, -- enable windowpicker extension
      kube_utils = true, -- enable kube_utils extension
      sshfs = true, -- enable sshdfs
    },
  },
  performance = {
    cache = {
      enabled = true,
    },
  },
})
