return {
    "nvim-treesitter/nvim-treesitter",
    buid = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {"lua", "c", "go"},
            highlight = {enable = true},
            indent = {enable = true},
        })
    end
}
