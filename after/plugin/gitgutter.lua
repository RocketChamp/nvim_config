vim.g.gitgutter_sign_added = '+'
vim.g.gitgutter_sign_modified = '>'
vim.g.gitgutter_sign_removed = '-'
vim.g.gitgutter_sign_removed_first_line = '^'
vim.g.gitgutter_sign_modified_removed = '<'

-- Next hunk
vim.api.nvim_set_keymap('n', '<leader>gh', ':GitGutterNextHunk<CR>', {noremap = true, silent = true})

-- Previous hunk
vim.api.nvim_set_keymap('n', '<leader>gH', ':GitGutterPrevHunk<CR>', {noremap = true, silent = true})

-- Stage hunk
vim.api.nvim_set_keymap('n', '<leader>gS', ':GitGutterStageHunk<CR>', {noremap = true, silent = true})

-- Undo hunk
vim.api.nvim_set_keymap('n', '<leader>gu', ':GitGutterUndoHunk<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>h', ':GitGutterPreviewHunk<CR>', {noremap = true, silent = true})

