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
			if hour >= 7 and hour < 20 then
				themery.setThemeByName("tokyonight", true)
                vim.g.colors_name = "tokyonight"
			else
				themery.setThemeByName("catppuccin-macchiato", true)
                vim.g.colors_name = "catppuccin-macchiato"
			end
		end

		set_theme_based_on_time()

		vim.api.nvim_create_autocmd("VimEnter", {
			pattern = "*",
			callback = function()
				vim.defer_fn(function()
					set_theme_based_on_time()
				end, 0)
			end,
		})
	end,
}
