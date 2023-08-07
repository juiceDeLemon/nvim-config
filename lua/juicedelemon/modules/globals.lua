pp = vim.print

-- fast fingers
vim.api.nvim_create_user_command("Q", function() vim.cmd.q() end, {})
vim.api.nvim_create_user_command("Qw", function() vim.cmd.wq() end, {})
vim.api.nvim_create_user_command("Wq", function() vim.cmd.wq() end, {})
vim.api.nvim_create_user_command("W", function() vim.cmd.w() end, {})
