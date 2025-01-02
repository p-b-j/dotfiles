local pkg_manager = require("pkg_manager")

pkg_manager.add_pkgs({
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000,
    },
})

pkg_manager.add_setup_fn(function()
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("everforest")
end)
