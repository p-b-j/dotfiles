local utils = {}

function utils.put(text, line_number)
    local target_line_number = line_number or vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, target_line_number, target_line_number, false, { text })
end

return utils
