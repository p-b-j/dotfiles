local lazy_pkgs = {}
local pkg_setup_fns = {}

local pkg_manager = {}

function pkg_manager.add_pkgs(pkgs)
    for i = 1, #pkgs do
        lazy_pkgs[#lazy_pkgs + 1] = pkgs[i]
    end
end

function pkg_manager.add_setup_fn(callback)
    pkg_setup_fns[#pkg_setup_fns + 1] = callback
end

function pkg_manager.setup_pkgs()
    require("lazy").setup(lazy_pkgs)

    for _, setup_fn in ipairs(pkg_setup_fns) do
        setup_fn()
    end
end

return pkg_manager
