-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")

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
