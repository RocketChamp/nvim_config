
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

local terminal_bufnr = nil

function _G.toggle_terminal()
  if terminal_bufnr and vim.api.nvim_buf_is_valid(terminal_bufnr) then
    local win_ids = vim.api.nvim_list_wins()
    for _, win_id in ipairs(win_ids) do
      if vim.api.nvim_win_get_buf(win_id) == terminal_bufnr then
        vim.api.nvim_win_close(win_id, true)
        return
      end
    end
    vim.api.nvim_command('botright 10split')
    vim.api.nvim_set_current_buf(terminal_bufnr)
  else
    vim.api.nvim_command('botright 10split | terminal')
    terminal_bufnr = vim.api.nvim_get_current_buf()
  end
end

vim.api.nvim_set_keymap('n', '<C-\\>', '<cmd>lua toggle_terminal()<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<F5>', '<Cmd>lua require"dap".continue()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F10>', '<Cmd>lua require"dap".step_over()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F11>', '<Cmd>lua require"dap".step_into()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F12>', '<Cmd>lua require"dap".step_out()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b', '<Cmd>lua require"dap".toggle_breakpoint()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>B', '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>lp', '<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>dr', '<Cmd>lua require"dap".repl.open()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>dl', '<Cmd>lua require"dap".run_last()<CR>', {noremap = true, silent = true})

