local pkg_manager = require("pkg_manager")

pkg_manager.add_pkgs({
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
})

pkg_manager.add_setup_fn(function()
    local lspconfig_defaults = require("lspconfig").util.default_config
    lspconfig_defaults.capabilities =
        vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

    local lspconfig = require("lspconfig")
    lspconfig.ccls.setup({})
    lspconfig.lua_ls.setup({})
end)
