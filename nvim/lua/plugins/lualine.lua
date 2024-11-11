return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local function set_lualine_theme()
            local theme
            if vim.g.colors_name == "catppuccin-macchiato" then
                theme = "dracula"
            elseif vim.g.colors_name == "tokyonight" then
                theme = "ayu_light"
            else
                theme = "auto"
            end

            require("lualine").setup({
                options = { theme = theme },
            })
        end

        set_lualine_theme()

        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                vim.defer_fn(set_lualine_theme, 100)
            end,
        })

        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                vim.defer_fn(set_lualine_theme, 100)
            end,
        })

        vim.api.nvim_create_user_command("RefreshLualine", set_lualine_theme, {})
    end,
}
