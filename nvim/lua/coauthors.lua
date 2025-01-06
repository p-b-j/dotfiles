require("utils")

local coauthors = require("system-coauthors")

vim.api.nvim_create_user_command("Coa", function(opts)
    for _, arg in pairs(opts.fargs) do
        local coauthorline = coauthors[arg]
        if coauthorline == nil then
            print("No co-author entry: " .. arg)
        else
            put("Co-authored by: " .. coauthorline)
        end
    end
end, { nargs = "+" })
