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
  { "<leader>e", "Toggle Neotree" },
  { "<leader>E", "Explorer Neotree" },
}

wk.add(neotree_mappings)

local kube_utils_mappings = {
  { "<leader>k", group = "Kubernetes" },
  { "<leader>kh", group = "Helm" },
  { "<leader>khT", "<cmd>HelmDryRun<CR>", desc = "Helm DryRun Buffer" },
  { "<leader>khb", "<cmd>HelmDependencyBuildFromBuffer<CR>", desc = "Helm Dependency Build" },
  { "<leader>khd", "<cmd>HelmDeployFromBuffer<CR>", desc = "Helm Deploy Buffer to Context" },
  { "<leader>khr", "<cmd>RemoveDeployment<CR>", desc = "Helm Remove Deployment From Buffer" },
  { "<leader>kht", "<cmd>HelmTemplateFromBuffer<CR>", desc = "Helm Template From Buffer" },
  { "<leader>khu", "<cmd>HelmDependencyUpdateFromBuffer<CR>", desc = "Helm Dependency Update" },
  { "<leader>kk", group = "Kubectl" },
  { "<leader>kkC", "<cmd>SelectSplitCRD<CR>", desc = "Download CRD Split" },
  { "<leader>kkD", "<cmd>DeleteNamespace<CR>", desc = "Kubectl Delete Namespace" },
  { "<leader>kkK", "<cmd>OpenK9s<CR>", desc = "Open K9s" },
  { "<leader>kka", "<cmd>KubectlApplyFromBuffer<CR>", desc = "Kubectl Apply From Buffer" },
  { "<leader>kkc", "<cmd>SelectCRD<CR>", desc = "Download CRD" },
  { "<leader>kkk", "<cmd>OpenK9sSplit<CR>", desc = "Split View K9s" },
  { "<leader>kkl", "<cmd>ToggleYamlHelm<CR>", desc = "Toggle YAML/Helm" },
  { "<leader>kl", group = "Logs" },
  { "<leader>klf", "<cmd>JsonFormatLogs<CR>", desc = "Format JSON" },
  { "<leader>klv", "<cmd>ViewPodLogs<CR>", desc = "View Pod Logs" },
}

-- Register the Helm keybindings with a specific prefix
wk.add(kube_utils_mappings)

-- Yaml-Companion
local yaml_companion_mappings = {
  { "<leader>y", "<cmd>Telescope yaml_schema<CR>", desc = "Yaml Companion" },
}

-- Register the yaml-companion keybindings with a specific prefix
wk.add(yaml_companion_mappings)
