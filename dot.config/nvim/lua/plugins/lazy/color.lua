return {
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            local everforest = require("everforest")

            everforest.setup({
                background = "hard",
                colours_override = function(palette)
                    palette.background = "#232a2e"
                end,
            })

            everforest.load()
        end,
    },
}
