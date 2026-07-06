require("config.general")
require("config.lazy")

require("lazy").setup({
    spec = {
        checker = { enabled = true },
        import = "plugins.lazy",
    },
})

require("plugins.local")
