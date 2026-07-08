local lsp_helpers = {}

function lsp_helpers.configure_key_bindings()
    vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
            local opts = { buffer = event.buf }

            vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
            vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
            vim.keymap.set("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
            vim.keymap.set("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
            vim.keymap.set("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
            vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
            vim.keymap.set("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
            vim.keymap.set("n", "<leader>dm", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
            -- vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
            -- vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
            -- vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        end,
    })
end

return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig_defaults = require("lspconfig").util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                "force",
                lspconfig_defaults.capabilities,
                require("cmp_nvim_lsp").default_capabilities()
            )

            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({})
            lspconfig.lua_ls.setup({})
            lspconfig.lexical.setup({
                cmd = { "lexical" },
            })

            lsp_helpers.configure_key_bindings()
        end,
    },
}
