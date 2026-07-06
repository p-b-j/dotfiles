local telescope_helpers = {}

function telescope_helpers.configure_key_bindings()
    local telescope_builtins = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", function()
        telescope_builtins.find_files({ hidden = true })
    end, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", function()
        telescope_builtins.live_grep({
            additional_args = function(_)
                return { "--hidden" }
            end,
        })
    end, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", telescope_builtins.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", telescope_builtins.help_tags, { desc = "Telescope help tags" })
end

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
        config = function()
            local telescope = require("telescope")

            telescope.setup({
                defaults = {
                    file_ignore_patterns = { "%.git/" },
                },
            })

            telescope_helpers.configure_key_bindings()
        end,
    },
}
