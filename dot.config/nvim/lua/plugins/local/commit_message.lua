local utils = require("plugins.local.utils")

local commit_message = {}

function commit_message.current_branch()
    local current_branch_status = vim.system({ "git", "branch", "--show-current" }):wait()
    if current_branch_status.code ~= 0 then
        print("Uh oh: you're editing a commit message but I can't find a git branch???")
        return ""
    else
        return current_branch_status.stdout
    end
end

function commit_message.current_shortcut_slug()
    local current_branch = commit_message.current_branch()
    local shortcut_slug_start, shortcut_slug_end = string.find(current_branch, "sc%-%d%d%d%d%d")

    if shortcut_slug_start then
        local shortcut_slug_untrimmed = string.sub(current_branch, shortcut_slug_start, shortcut_slug_end)
        return string.gsub(shortcut_slug_untrimmed, "\n", "")
    else
        return ""
    end
end

function commit_message.buffer_already_contains_shortcut_slug()
    local buffer_content = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")

    return string.find(buffer_content, "%[sc%-%d%d%d%d%d%]")
end

function commit_message.maybe_add_shortcut_tag_to_commit_msg(_)
    local shortcut_slug = commit_message.current_shortcut_slug()
    if shortcut_slug ~= "" and not commit_message.buffer_already_contains_shortcut_slug() then
        utils.put("[" .. shortcut_slug .. "]", 1)
    end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, {
    pattern = { "COMMIT_EDITMSG" },
    callback = commit_message.maybe_add_shortcut_tag_to_commit_msg,
})
