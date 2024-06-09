local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

---@param opts LazyConfig
return function(opts)
  opts = vim.tbl_deep_extend("force", {
    spec = {
      {
        -- import LazyVim plugins
        "LazyVim/LazyVim",
        import = "lazyvim.plugins",
        opts = {
          colorscheme = function()
            local theme = ""
            if string.match(opts.nv.colorscheme, "github") ~= nil then
              theme = "github"
            else
              if string.match(opts.nv.colorscheme, "one[dark|light]") ~= nil then
                theme = "onedark"
              end
            end
            local has_theme, nvim_theme = pcall(require, "plugins.extras.theme." .. theme)
            if has_theme then
              nvim_theme.setup(opts.nv.colorscheme)
            else
              require("tokyonight").load() -- fallback to tokyo night if not otherwise specified
            end
          end,
        },
      },
      -- lazyvim copilot extension modules
      { import = "lazyvim.plugins.extras.coding.copilot", enabled = opts.nv.copilot_support },
      { import = "plugins.extras.coding.copilot", enabled = opts.nv.copilot_support },
      -- lazyvim yanky extension modules
      { import = "lazyvim.plugins.extras.coding.yanky" },
      -- lazyvim dap core extension modules
      { import = "lazyvim.plugins.extras.dap.core", enabled = opts.nv.dap_support },
      -- debugger specific extension modules
      { import = "lazyvim.plugins.extras.dap.nlua", enabled = opts.nv.lang.lua },
      -- core language specific extension modules
      { import = "lazyvim.plugins.extras.lang.clangd", enabled = opts.nv.lang.clangd },
      { import = "lazyvim.plugins.extras.lang.cmake", enabled = opts.nv.lang.clangd },
      { import = "lazyvim.plugins.extras.lang.docker", enabled = opts.nv.lang.docker },
      { import = "lazyvim.plugins.extras.lang.elixir", enabled = opts.nv.lang.elixir },
      { import = "lazyvim.plugins.extras.lang.go", enabled = opts.nv.lang.go },
      { import = "lazyvim.plugins.extras.lang.java", enabled = opts.nv.lang.java },
      { import = "lazyvim.plugins.extras.lang.python", enabled = opts.nv.lang.python },
      { import = "lazyvim.plugins.extras.lang.ruby", enabled = opts.nv.lang.ruby },
      { import = "lazyvim.plugins.extras.lang.rust", enabled = opts.nv.lang.rust },
      { import = "lazyvim.plugins.extras.lang.terraform", enabled = opts.nv.lang.terraform },
      { import = "lazyvim.plugins.extras.lang.tex", enabled = opts.nv.lang.tex },
      { import = "lazyvim.plugins.extras.lang.yaml", enabled = opts.nv.lang.yaml },
      { import = "lazyvim.plugins.extras.lang.markdown", enabled = opts.nv.lang.markdown },
      { import = "lazyvim.plugins.extras.lsp.neoconf", enabled = opts.nv.lsp.neoconf },
      -- lazyvim test core extension modules
      { import = "lazyvim.plugins.extras.test.core", enabled = opts.nv.test_support },
      -- lazyvim UI extension modules
      { import = "lazyvim.plugins.extras.ui.edgy" },
      { import = "lazyvim.plugins.extras.ui.mini-animate" },
      -- lazyvim project extension modules
      { import = "lazyvim.plugins.extras.util.project" },
      -- import/override with your plugins
      { import = "plugins" },
      -- lazyvim codeium extension modules
      { import = "plugins.extras.coding.codeium", enabled = opts.nv.codeium_support },
      -- custom language specific extension modules
      { import = "plugins.extras.lang.nodejs", enabled = opts.nv.lang.nodejs },
      -- lazyvim coverage extension modules
      { import = "plugins.extras.test.coverage", enabled = opts.nv.lang.coverage_support },
      -- Import utils
      -- lazyvim REST extension modules
      { import = "plugins.extras.util.rest", enabled = opts.nv.lang.rest_support },
      -- taskwarrior modules
      { import = "plugins.extras.util.taskwarrior", enabled = opts.nv.util.taskwarrior },
      -- windowpicker modules
      { import = "plugins.extras.util.windowpicker", enabled = opts.nv.util.windowpicker },
      -- kube_utils modules
      { import = "plugins.extras.util.kube_utils", enabled = opts.nv.util.kube_utils },
      -- sshdfs modules
      { import = "plugins.extras.util.sshfs", enabled = opts.nv.util.sshfs },
      -- yaml-companion modules
      { import = "plugins.extras.util.yaml-companion", enabled = opts.nv.util.yamlcompanion },
      -- custom language specific extension modules
      { import = "plugins.extras.lang.ansible", enabled = opts.nv.lang.ansible },
      { import = "plugins.extras.lang.python", enabled = opts.nv.lang.python },
      { import = "plugins.extras.lang.yaml", enabled = opts.nv.lang.yaml },
      { import = "plugins.extras.lang.obsidian", enabled = opts.nv.lang.obsidian },
    },
    defaults = {
      -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
      -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
      lazy = false,
      -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
      -- have outdated releases, which may break your Neovim install.
      version = false, -- always use the latest git commit
      -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    install = { colorscheme = { "tokyonight", "habamax" } },
    checker = { enabled = true }, -- automatically check for plugin updates
    performance = {
      cache = {
        enabled = true,
        -- disable_events = {},
      },
      rtp = {
        -- disable some rtp plugins
        disabled_plugins = {
          "gzip",
          -- "matchit",
          -- "matchparen",
          -- "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
  }, opts or {})
  require("lazy").setup(opts)
end
