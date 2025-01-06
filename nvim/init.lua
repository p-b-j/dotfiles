require("general_config")
require("lazy_config")
require("lsp_config")
require("format_config")
require("key_config")
require("color_config")
require("coauthors")

require("pkg_manager").add_pkgs({
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    },
})

require("pkg_manager").setup_pkgs()
