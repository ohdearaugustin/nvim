return {
  -- correctly setup mason lsp extensions
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ansible-language-server" })
      end
    end,
  },
}
