return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local function set_lualine_theme()
            local current_theme = vim.g.colors_name
            if current_theme == "catppuccin-macchiato" then
                require("lualine").setup({
                    options = { theme = "dracula" },
                })
            elseif current_theme == "tokyonight" then
                require("lualine").setup({
                    options = { theme = "ayu_light" },
                })
            end
        end

        set_lualine_theme()

        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = function()
                set_lualine_theme()
            end,
        })
    end,
}
