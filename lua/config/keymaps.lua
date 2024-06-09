-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")

-- Key mapping to switch between buffer and Neotree
-- Function to toggle between Neotree and the last used buffer
function ToggleNeoTree()
  local current_win = vim.api.nvim_get_current_win()
  local neotree_win = nil

  -- Find the Neotree window
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
    if bufname:match("neo%-tree filesystem") then
      neotree_win = win
      break
    end
  end

  if neotree_win then
    if current_win == neotree_win then
      -- If currently in Neotree, switch to the previous buffer
      vim.cmd("wincmd p")
    else
      -- Otherwise, switch to the Neotree window
      vim.api.nvim_set_current_win(neotree_win)
    end
  else
    -- If Neotree is not open, open it
    vim.cmd("Neotree toggle")
  end
end
vim.keymap.del("n", "<leader>E")
vim.keymap.del("n", "<leader>e")
vim.keymap.set("n", "<leader>e", ":lua ToggleNeoTree()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>E", function()
  vim.cmd("Neotree toggle")
end, { noremap = true, silent = true })
local neotree_mappings = {
  e = { "Toggle Neotree" },
  E = { "Explorer Neotree" },
}

wk.register(neotree_mappings, { prefix = "<leader>" })

local helm_mappings = {
  k = {
    name = "Kubernetes",
    d = { "<cmd>HelmDeployFromBuffer<CR>", "Helm Deploy Buffer to Context" },
    r = { "<cmd>RemoveDeployment<CR>", "Helm Remove Deployment From Buffer" },
    T = { "<cmd>HelmDryRun<CR>", "Helm DryRun Buffer" },
    a = { "<cmd>KubectlApplyFromBuffer<CR>", "Kubectl Apply From Buffer" },
    D = { "<cmd>DeleteNamespace<CR>", "Kubectl Delete Namespace" },
    u = { "<cmd>HelmDependencyUpdateFromBuffer<CR>", "Helm Dependency Update" },
    b = { "<cmd>HelmDependencyBuildFromBuffer<CR>", "Helm Dependency Build" },
    t = { "<cmd>HelmTemplateFromBuffer<CR>", "Helm Template From Buffer" },
    K = { "<cmd>OpenK9sSplit<CR>", "Split View K9s" },
    k = { "<cmd>OpenK9s<CR>", "Open K9s" },
    l = { "<cmd>ToggleYamlHelm<CR>", "Toggle YAML/Helm" },
  },
}

-- Register the Helm keybindings with a specific prefix
wk.register(helm_mappings, { prefix = "<leader>" })

-- Yaml-Companion
local yaml_companion_mappings = {
  y = { "<cmd>Telescope yaml_schema<CR>", "Yaml Companion" },
}

-- Register the yaml-companion keybindings with a specific prefix
wk.register(yaml_companion_mappings, { prefix = "<leader>" })
