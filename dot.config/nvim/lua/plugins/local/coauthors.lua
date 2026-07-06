local coauthors = require("plugins.local.system_coauthors")
local utils = require("plugins.local.utils")

vim.api.nvim_create_user_command("Coa", function(opts)
    for _, arg in pairs(opts.fargs) do
        local coauthorline = coauthors[arg]
        if coauthorline == nil then
            print("No co-author entry: " .. arg)
        else
            -- TODO: this is nasty... since cursor doesn't move,
            -- we have to think in a stack :( maybe a future improvement
            utils.put("Co-authored-by: " .. coauthorline)
            utils.put("")
        end
    end
end, { nargs = "+" })
