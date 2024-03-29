-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local plugins = {
	{
		"windwp/nvim-autopairs",
		-- Optional dependency
		dependencies = { 'hrsh7th/nvim-cmp' },
		config = function()
			require("nvim-autopairs").setup {

				check_ts = true, -- treesitter integration
				disable_filetype = { "TelescopePrompt" },
				ts_config = {
					lua = { "string", "source" },
					javascript = { "string", "template_string" },
					java = false,
				},

				fast_wrap = {
					map = "<M-e>",
					-- map = "<leader>w",
					chars = { "{", "[", "(", '"', "'" },
					pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
					offset = 0, -- Offset from pattern match
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "PmenuSel",
					highlight_grey = "LineNr",
				},
			}
			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			local cmp = require('cmp')
			cmp.event:on(
				'confirm_done',
				cmp_autopairs.on_confirm_done()
			)
		end,
	},
	{
		"aserowy/tmux.nvim",
		config = function()
			return require("tmux").setup()
		end
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("custom.configs.colorschemes.gruvbox")
		end,
	},
	{
		"rose-pine/neovim",
		priority = 1000,
		config = function()
			require("custom.configs.colorschemes.rose-pine")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require "custom.configs.neotree"
		end
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require "custom.configs.colorschemes.catppuccin"
		end
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			-- "rcarriga/nvim-notify",
		},
		config = function ()
			require "custom.configs.noice"
		end
	},
	{
		"rcarriga/nvim-notify",
		config = function ()
			require "custom.configs.notify"
		end


	},
	{
		"nvim-neotest/nvim-neo"
	}


}

return plugins
