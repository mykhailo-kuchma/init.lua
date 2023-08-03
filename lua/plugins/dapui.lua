local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dapui.setup()
--[[
vim.keymap.set('n', '<F9>', function() require("dap").toggle_breakpoint() end)
vim.keymap.set({'n', 't'}, '<S-F11>', function() require("dap").step_out() end)
vim.keymap.set({'n', 't'}, "<F11>", function() require("dap").step_into() end)
vim.keymap.set({'n', 't'}, '<F10>', function() require("dap").step_over() end)
vim.keymap.set({'n', 't'}, '<F5>', function() require("dap").continue() end)
vim.keymap.set('n', 'S-<F5>', function() require("dap").terminate() end)
]]--
