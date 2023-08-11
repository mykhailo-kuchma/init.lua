require('telescope').setup {}

pcall(require('telescope').load_extension, 'fzf')

require("telescope").load_extension("ui-select")

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Select buffer' })
