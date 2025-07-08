return {
  --- https://www.aloisdeniel.com/blog/minimalist-configuration-for-neovim-and-flutter
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end     },
    },
    opts = function()
      local ret = {
        diagnostics = {},
        inlay_hints = {
          enabled = true,
        },
        codelens = {
          enabled = true,
        },
        document_highlight = {
          enabled = true,
        },
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },
        servers = {
          dartls = {

            mason = false,
            cmd = {
              "dart",
              "language-server",
              "--protocol=lsp",
            },
            filetypes = { "dart" },
            init_options = {
              onlyAnalyzeProjectsWithOpenFiles = false,
              suggestFromUnimportedLibraries = true,
              closingLabels = true,
              outline = false,
              flutterOutline = false,
            },
            settings = {
              dart = {
                analysisExcludedFolders = {
                  vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
                  vim.fn.expand("$HOME/.pub-cache"),
                  vim.fn.expand("/opt/homebrew/"),
                  vim.fn.expand("$HOME/tools/flutter/"),
                },
                updateImportsOnRename = true,
                completeFunctionCalls = true,
                showTodos = true,
              },
            },
          },
          -- ...
        },
        setup = {},
      }
      return ret
    end,
  },
}
