-- Setup dap-vscode-js
require("dap-vscode-js").setup({
  debugger_path = os.getenv('HOME') .. "/.local/share/nvim/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

-- Setup dap configurations for typescript and javascript
for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = vim.fn.getcwd(),
    },
    {
      type = "pwa-chrome",
      request = "attach",
      name = "Attach to Chrome",
      port = 9222,
      webRoot = vim.fn.getcwd(),
    }
  }
end

