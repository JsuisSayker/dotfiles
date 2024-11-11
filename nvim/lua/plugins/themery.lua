return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		local themery = require("themery")

		themery.setup({
			themes = { "tokyonight", "catppuccin-macchiato" },
			livePreview = true,
		})

		local function set_theme_based_on_time()
			local hour = tonumber(os.date("%H"))
			local theme_name

			if hour >= 7 and hour < 20 then
				theme_name = "tokyonight"
			else
				theme_name = "catppuccin-macchiato"
			end

			themery.setThemeByName(theme_name, true)
			vim.g.colors_name = theme_name -- set vim's internal theme name
		end

		-- Set the theme based on the time of day at startup
		set_theme_based_on_time()

		-- Reapply the theme on VimEnter to ensure it’s set correctly
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				set_theme_based_on_time()
			end,
		})
	end,
}
