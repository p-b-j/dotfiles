local pkg_manager = require("pkg_manager")

pkg_manager.add_pkgs({
    { "stevearc/conform.nvim", opts = {} },
    { "tpope/vim-sleuth" },
})

pkg_manager.add_setup_fn(function()
    local formatters = {
        "clang-format",
        -- "cmake-format",
        "jq",
        "stylua",
        "taplo",
    }

    for _, formatter in ipairs(formatters) do
        if vim.fn.executable(formatter) == 0 then
            print("WARNING: " .. formatter .. " is not installed!")
        end
    end

    require("conform").setup({
        formatters_by_ft = {
            c = { "clang-format" },
            -- cmake = { "cmake-format" },
            json = { "jq" },
            lua = { "stylua" },
            toml = { "taplo" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    })
end)
